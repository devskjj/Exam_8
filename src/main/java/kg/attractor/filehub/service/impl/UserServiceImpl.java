package kg.attractor.filehub.service.impl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kg.attractor.filehub.dto.UserDto;
import kg.attractor.filehub.entity.User;
import kg.attractor.filehub.exception.UserNotFoundException;
import kg.attractor.filehub.mapper.UserMapper;
import kg.attractor.filehub.repository.UserRepository;
import kg.attractor.filehub.service.interfaces.RoleService;
import kg.attractor.filehub.service.interfaces.UserService;
import kg.attractor.filehub.service.userdetails.CustomUserDetails;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.NoSuchElementException;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final RoleService roleService;

    @Override
    public void register(UserDto userDto,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         SecurityContextRepository contextRepository) {

        String adjustedEmail = adjustData(userDto.getEmail(), true);
        String adjustedName = adjustData(userDto.getName(), false);
        String adjustedSurname = adjustData(userDto.getSurname(), false);

        if (adjustedName.isEmpty() || adjustedSurname.isEmpty()) {
            throw new IllegalArgumentException("Name and surname must not be empty");
        }

        if (userRepository.existsByEmail(adjustedEmail)) {
            throw new IllegalArgumentException("There is already a user with the email " + adjustedEmail);
        }

        if (userDto.getPassword() == null || userDto.getPassword().isBlank()) {
            throw new IllegalArgumentException("Password must not be empty");
        }

        userDto.setName(adjustedName);
        userDto.setSurname(adjustedSurname);
        userDto.setEmail(adjustedEmail);
        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));

        if (userDto.getRole() != null && userDto.getRole().getId() != null) {
            userDto.setRole(roleService.getRoleById(userDto.getRole().getId()));
        } else {
            userDto.setRole(roleService.getRoleByName("USER"));
        }

        User savedUser = userRepository.save(userMapper.toEntity(userDto));
        log.info("User registered successfully: ID={}, Email={}", savedUser.getId(), savedUser.getEmail());

        autoLogin(request, response, contextRepository, savedUser);
        log.info("Auto login successfully: ID={}", savedUser.getId());
    }

    private void autoLogin(HttpServletRequest request, HttpServletResponse response,
                           SecurityContextRepository repository, User user) {

        CustomUserDetails userDetails = new CustomUserDetails(user);

        Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        authenticate(auth, request, response, repository);
        log.info("Authentication successful: ID={}, Email={}", user.getId(), user.getEmail());
    }

    private void authenticate(
            Authentication authentication,
            HttpServletRequest request,
            HttpServletResponse response,
            SecurityContextRepository repository) {

        SecurityContext context = SecurityContextHolder.createEmptyContext();
        context.setAuthentication(authentication);
        SecurityContextHolder.setContext(context);
        repository.saveContext(context, request, response);

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        log.info("Principal = {}", auth.getPrincipal().getClass());
    }

    @Override
    public List<UserDto> getUsers() {
        List<UserDto> users = userRepository.findAll().stream().map(userMapper::toDto).toList();
        if (users.isEmpty()) {
            throw new UserNotFoundException("No users found");
        }
        log.info("Users found: {}", users.size());
        return users;
    }

    @Override
    public UserDto getUserById(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() ->
                new UserNotFoundException("User with id " + userId + " not found"));
        log.info("User with ID {} found", userId);
        return userMapper.toDto(user);
    }

    @Override
    public UserDto getUserByEmail(String email) {
        User user = userRepository.findByEmail(email).orElseThrow(() ->
                new UserNotFoundException("User with email " + email + " not found"));
        log.info("User with email {} found", email);
        return userMapper.toDto(user);
    }

    @Override
    public UserDto getAuthUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            log.error("Authentication is null or user is not authenticated");
            throw new NoSuchElementException("Authentication is null or user is not authenticated");
        }

        String email = authentication.getName();
        UserDto user = getUserByEmail(email);
        log.info("Authenticated user found: {}", email);
        return user;
    }

    @Override
    public Long getAuthId() {
        return getAuthUser().getId();
    }

    @Override
    public Page<UserDto> getUsersPage(Pageable pageable) {
        Page<User> usersPage = userRepository.findAll(pageable);
        if (usersPage.isEmpty()) {
            throw new UserNotFoundException("No users found");
        }
        log.info("Users found: {}", usersPage.getTotalElements());
        return usersPage.map(userMapper::toDto);
    }

    @Override
    public long getUserCount() {
        return userRepository.count();
    }

    @Override
    public boolean existsUserByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Override
    public boolean isUserBlocked(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() ->
                new UserNotFoundException("User with id " + userId + " not found"));
        return !user.getEnabled();
    }

    @Override
    public void blockUser(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() ->
                new UserNotFoundException("User with id " + userId + " not found"));
        if (Boolean.FALSE.equals(user.getEnabled())) {
            log.info("User with id {} is blocked", userId);
            return;
        }
        user.setEnabled(false);
        userRepository.save(user);
        log.info("User with id {} is blocked", userId);
    }

    @Override
    public void unblockUser(Long userId) {
        User user = userRepository.findById(userId).orElseThrow(() ->
                new UserNotFoundException("User with id " + userId + " not found"));
        if (Boolean.TRUE.equals(user.getEnabled())) {
            log.info("User with id {} is unblocked", userId);
            return;
        }
        user.setEnabled(true);
        userRepository.save(user);
        log.info("User with id {} is unblocked", userId);
    }

    private String adjustData(String data, boolean isEmail) {
        if (data == null || data.isBlank()) {
            return "";
        }
        String adjustedData = data.trim().replaceAll("\\s+", " ").toLowerCase();
        return isEmail ? adjustedData : StringUtils.capitalize(adjustedData);
    }
}
