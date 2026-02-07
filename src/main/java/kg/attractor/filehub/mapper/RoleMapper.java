package kg.attractor.filehub.mapper;

import kg.attractor.filehub.dto.RoleDto;
import kg.attractor.filehub.entity.Role;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RoleMapper {

    RoleDto toDto(Role role);

    Role toEntity(RoleDto roleDto);
}
