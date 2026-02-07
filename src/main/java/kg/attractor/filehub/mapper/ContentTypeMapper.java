package kg.attractor.filehub.mapper;

import kg.attractor.filehub.dto.ContentTypeDto;
import kg.attractor.filehub.entity.ContentType;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ContentTypeMapper {

    ContentTypeDto toDto(ContentType contentType);

    @Mapping(target = "files", ignore = true)
    ContentType toEntity(ContentTypeDto contentTypeDto);
}
