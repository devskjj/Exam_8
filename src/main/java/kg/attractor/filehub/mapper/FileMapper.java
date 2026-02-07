package kg.attractor.filehub.mapper;

import kg.attractor.filehub.dto.FileDto;
import kg.attractor.filehub.entity.File;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = {UserMapper.class, FileCategoryMapper.class, ContentTypeMapper.class})
public interface FileMapper {

    @Mapping(target = "pathName", source = "pathName")
    FileDto toDto(File file);

    @Mapping(target = "pathName", source = "pathName")
    File toEntity(FileDto fileDto);
}
