package kg.attractor.filehub.mapper;

import kg.attractor.filehub.dto.FileCategoryDto;
import kg.attractor.filehub.entity.FileCategory;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface FileCategoryMapper {

    FileCategoryDto toDto(FileCategory fileCategory);

    @Mapping(target = "files", ignore = true)
    FileCategory toEntity(FileCategoryDto fileCategoryDto);
}
