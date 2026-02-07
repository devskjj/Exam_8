package kg.attractor.filehub.service.impl;

import kg.attractor.filehub.dto.RoleDto;
import kg.attractor.filehub.entity.Role;
import kg.attractor.filehub.exception.RoleNotFoundException;
import kg.attractor.filehub.mapper.RoleMapper;
import kg.attractor.filehub.repository.RoleRepository;
import kg.attractor.filehub.service.interfaces.RoleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {
    private final RoleRepository roleRepository;
    private final RoleMapper roleMapper;

    @Override
    public RoleDto getRoleById(Long roleId) {
        Role role = roleRepository.findById(roleId).orElseThrow(() ->
                new RoleNotFoundException("Role with ID " + roleId + " not found"));
        log.info("Get role by ID: {}", roleId);
        return roleMapper.toDto(role);
    }

    @Override
    public RoleDto getRoleByName(String roleName) {
        String name = roleName.toUpperCase().trim();
        Role role = roleRepository.findByName(name).orElseThrow(() ->
                new RoleNotFoundException("Role with name " + roleName + " not found"));
        log.info("Get role by name: {}", name);
        return roleMapper.toDto(role);
    }
}
