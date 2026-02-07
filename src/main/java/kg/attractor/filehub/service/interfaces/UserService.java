package kg.attractor.filehub.service.interfaces;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kg.attractor.filehub.dto.UserDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.web.context.SecurityContextRepository;

import java.util.List;

public interface UserService {
    List<UserDto> getUsers();

    UserDto getUserById(Long userId);

    UserDto getUserByEmail(String email);

    UserDto getAuthUser();

    Long getAuthId();

    Page<UserDto> getUsersPage(Pageable pageable);

    long getUserCount();

    void register(UserDto userDto,
                  HttpServletRequest request,
                  HttpServletResponse response,
                  SecurityContextRepository contextRepository);

    boolean existsUserByEmail(String email);

    boolean isUserBlocked(Long userId);

    void blockUser(Long userId);

    void unblockUser(Long userId);
}
