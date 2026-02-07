package kg.attractor.filehub.service.impl;

import kg.attractor.filehub.dto.ContentTypeDto;
import kg.attractor.filehub.entity.ContentType;
import kg.attractor.filehub.exception.ContentTypeNotFoundException;
import kg.attractor.filehub.mapper.ContentTypeMapper;
import kg.attractor.filehub.repository.ContentTypeRepository;
import kg.attractor.filehub.service.interfaces.ContentTypeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentTypeServiceImpl implements ContentTypeService {
    private final ContentTypeRepository contentTypeRepository;
    private final ContentTypeMapper contentTypeMapper;

    @Override
    public List<ContentTypeDto> getAll() {
        List<ContentTypeDto> types = contentTypeRepository.findAll().stream().map(contentTypeMapper::toDto).toList();
        if (types.isEmpty()) {
            throw new ContentTypeNotFoundException("List of content types not found");
        }
        log.info("List of content types: {}", types.size());
        return types;
    }

    @Override
    public ContentTypeDto getContentTypeByMimeType(String mimeType) {
        ContentType contentType = contentTypeRepository.findByMimeType(mimeType)
                .orElseThrow(() -> new ContentTypeNotFoundException("Type not found"));
        log.info("Get content type by mime type: {}", contentType.getMimeType());
        return contentTypeMapper.toDto(contentType);
    }

    @Override
    public ContentTypeDto getOrCreateContentType(String mimeType) {
        try {
            return getContentTypeByMimeType(mimeType);
        } catch (NoSuchElementException e) {
            log.info("Content type not found");

            String extension = "";
            if (mimeType != null && mimeType.contains("/")) {
                extension = "." + mimeType.split("/")[1];
            }

            String name = mimeType;
            if (mimeType != null && mimeType.contains("/")) {
                name = mimeType.split("/")[1].toUpperCase() + " File";
            }

            return createContentType(mimeType, name, extension, "Created content type");
        }
    }

    @Override
    public ContentTypeDto getContentTypeById(Long contentTypeId) {
        ContentType contentType = contentTypeRepository.findById(contentTypeId).orElseThrow(() ->
                new ContentTypeNotFoundException("Content type with ID " + contentTypeId + " not found"));
        log.info("Get content type by ID: {}", contentTypeId);
        return contentTypeMapper.toDto(contentType);
    }

    @Override
    public ContentTypeDto createContentType(String mimeType, String name, String extension, String description) {
        ContentType contentType = ContentType.builder()
                .mimeType(mimeType)
                .name(name)
                .extension(extension)
                .description(description)
                .build();

        contentType = contentTypeRepository.save(contentType);
        log.info("Create content type by mime type: {}", contentType.getMimeType());
        return contentTypeMapper.toDto(contentType);
    }
}
