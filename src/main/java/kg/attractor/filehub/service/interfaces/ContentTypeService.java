package kg.attractor.filehub.service.interfaces;

import kg.attractor.filehub.dto.ContentTypeDto;

import java.util.List;

public interface ContentTypeService {
    List<ContentTypeDto> getAll();

    ContentTypeDto getContentTypeByMimeType(String mimeType);

    ContentTypeDto getOrCreateContentType(String mimeType);

    ContentTypeDto createContentType(String mimeType, String name, String extension, String description);

    ContentTypeDto getContentTypeById(Long contentTypeId);
}