package kg.attractor.filehub.service.interfaces;

import kg.attractor.filehub.dto.RoleDto;

public interface RoleService {
    RoleDto getRoleById(Long roleId);

    RoleDto getRoleByName(String roleName);
}
