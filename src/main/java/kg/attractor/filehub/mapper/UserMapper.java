package kg.attractor.filehub.mapper;

import kg.attractor.filehub.dto.UserDto;
import kg.attractor.filehub.entity.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = {RoleMapper.class})
public interface UserMapper {

    UserDto toDto(User user);

    User toEntity(UserDto userDto);
}
