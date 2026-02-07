package kg.attractor.filehub.service.impl;

import kg.attractor.filehub.dto.ContentTypeDto;
import kg.attractor.filehub.dto.FileCategoryDto;
import kg.attractor.filehub.dto.FileDto;
import kg.attractor.filehub.entity.File;
import kg.attractor.filehub.exception.FileNotFoundException;
import kg.attractor.filehub.exception.PrivateFileException;
import kg.attractor.filehub.mapper.FileMapper;
import kg.attractor.filehub.repository.FileRepository;
import kg.attractor.filehub.service.interfaces.ContentTypeService;
import kg.attractor.filehub.service.interfaces.FileCategoryService;
import kg.attractor.filehub.service.interfaces.FileService;
import kg.attractor.filehub.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDateTime;

import org.apache.tika.Tika;

import java.util.function.Supplier;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileServiceImpl implements FileService {
    private final FileMapper fileMapper;
    private final FileRepository fileRepository;
    private final ContentTypeService contentTypeService;
    private final FileCategoryService fileCategoryService;

    @Override
    public FileDto getFileById(Long id) {
        FileDto fileDto = fileRepository.findById(id).map(fileMapper::toDto).orElseThrow(() -> {
            log.error("File not found, id:{}", id);
            return new FileNotFoundException("File not found");
        });
        log.info("File successfully found, id:{}", id);
        return fileDto;
    }

    @Override
    public Page<FileDto> getFilesByUserId(Long userId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByUserId(userId, pageable), "User doesn't have files");
    }

    @Override
    public Page<FileDto> getFilesByFileCategoryId(Long fileCategoryId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByFileCategoryId(fileCategoryId, pageable), "This category doesn't have files");
    }

    @Override
    public Page<FileDto> getFilesByTypeId(Long contentTypeId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByContentTypeId(contentTypeId, pageable), "This type doesn't have files");
    }

    @Override
    public Page<FileDto> getFilesByCategoryAndType(Long fileCategoryId, Long contentTypeId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByFileCategoryIdAndContentTypeId(fileCategoryId, contentTypeId, pageable), "This request doesn't have files");
    }

    @Override
    public Page<FileDto> getFilesByUserAndCategoryAndType(Long userId, Long fileCategoryId, Long contentTypeId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByUserIdAndFileCategoryIdAndContentTypeId(userId, fileCategoryId, contentTypeId, pageable), "This request doesn't have files");
    }

    @Override
    public Page<FileDto> getByUserAndCategory(Long userId, Long categoryId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByUserIdAndFileCategoryId(userId, categoryId, pageable), "This request doesn't have files");
    }

    @Override
    public Page<FileDto> getByUserAndType(Long userId, Long typeId, Pageable pageable) {
        return getFilePage(() -> fileRepository.findByUserIdAndContentTypeId(userId, typeId, pageable), "Users with this type are not found");
    }

    @Override
    public Pageable createPageableWithSort(int page, int size, String sortDirection, String sortBy) {
        Sort.Direction direction = sortDirection.equalsIgnoreCase("ASC") ? Sort.Direction.ASC : Sort.Direction.DESC;
        int pageNumber = Math.max(page - 1, 0);
        return PageRequest.of(pageNumber, size, Sort.by(direction, sortBy));
    }

    @Override
    public Page<FileDto> getAllFiles(Pageable pageable) {
        return getFilePage(() -> fileRepository.findAll(pageable), null);
    }

    @Override
    public File getFileEntityById(Long id) {
        log.info("Start getting file entity, id:{}", id);
        return fileRepository.findById(id).orElseThrow(() -> new FileNotFoundException("File with id " + id + " not found"));
    }

    @Override
    public Page<FileDto> getFilesPage(Long userId, Long categoryId, Long contentTypeId, Pageable pageable) {
        log.info("Getting files on the main page");
        if (userId != null && categoryId != null && contentTypeId != null)
            return getFilesByUserAndCategoryAndType(userId, categoryId, contentTypeId, pageable);
        if (userId != null && categoryId != null) return getByUserAndCategory(userId, categoryId, pageable);
        if (userId != null && contentTypeId != null) return getByUserAndType(userId, contentTypeId, pageable);
        if (userId != null) return getFilesByUserId(userId, pageable);
        if (categoryId != null && contentTypeId != null)
            return getFilesByCategoryAndType(categoryId, contentTypeId, pageable);
        if (categoryId != null) return getFilesByFileCategoryId(categoryId, pageable);
        if (contentTypeId != null) return getFilesByTypeId(contentTypeId, pageable);
        return getAllFiles(pageable);
    }

    @Override
    public long getFilesCount() {
        return fileRepository.count();
    }

    @Override
    public long getDownloadCount() {
        return fileRepository.getTotalDownloads();
    }

    @Override
    public void createFile(FileDto fileDto) {
        log.info("Start create file, name:{}", fileDto.getName());

        File file = fileMapper.toEntity(fileDto);
        file = fileRepository.save(file);

        log.info("File successfully created, id:{}", file.getId());
    }

    @Override
    public void incrementDownloadCount(Long id) {
        log.info("Start increment download count, id:{}", id);
        File file = fileRepository.findById(id).orElseThrow(() -> new FileNotFoundException("File with id: " + id + " not found"));
        int updatedCount = file.getDownloadCount() + 1;
        file.setDownloadCount(updatedCount);
        fileRepository.save(file);
        log.info("Download count successfully increased by {} for file with id:{}", updatedCount, id);
    }

    private Page<FileDto> getFilePage(Supplier<Page<File>> supplier, String message) {
        Page<File> page = supplier.get();
        if (page.isEmpty()) {
            throw new FileNotFoundException(message != null ? message : "Files not found");
        }
        log.info("{} files successfully found on page", page.getTotalElements());
        return page.map(fileMapper::toDto);
    }

    @Override
    public void uploadFile(MultipartFile file, FileDto fileDto) {
        Tika tika = new Tika();
        String mimeType;

        log.info("Starting to upload file, id:{}", fileDto.getId());

        if (file.isEmpty()) throw new IllegalArgumentException("File is empty");

        String pathName = FileUtil.saveUploadFile(file, "files");
        log.info("Saved file with path: {}", pathName);

        try {
            mimeType = tika.detect(file.getInputStream());
        } catch (IOException e) {
            log.error("Cannot detect MIME type, fallback to application/octet-stream", e);
            mimeType = "application/octet-stream";
        }

        ContentTypeDto contentTypeDto = contentTypeService.getOrCreateContentType(mimeType);
        FileCategoryDto fileCategoryDto = fileCategoryService.getCategoryById(fileDto.getFileCategory().getId());

        FileDto newFileDto = FileDto.builder()
                .name(fileDto.getName())
                .pathName(pathName)
                .contentType(contentTypeDto)
                .fileCategory(fileCategoryDto)
                .size(file.getSize())
                .uploadDate(LocalDateTime.now())
                .isPublic(fileDto.getIsPublic())
                .user(fileDto.getUser())
                .build();

        createFile(newFileDto);
        log.info("File successfully uploaded, id:{}", newFileDto.getName());
    }


    @Override
    public ResponseEntity<?> downloadFile(Long id) {
        log.info("Start download file, id:{}", id);
        FileDto file = getFileById(id);

        if (file.getIsPublic().equals(false)) {
            throw new PrivateFileException("File with id:" + id + " is not public. Get token");
        }
        MediaType mediaType = MediaType.parseMediaType(file.getContentType().getMimeType());

        log.info("Sending file to download: name:{}, type:{}", file.getName(), mediaType);
        incrementDownloadCount(id);
        System.out.println(file.getPathName());
        return FileUtil.getOutputFile(file.getPathName(), "files", mediaType);
    }

    @Override
    public ResponseEntity<?> downloadPrivateFile(Long id) {
        log.info("Start download private file, id:{}", id);
        FileDto file = getFileById(id);
        if (file.getIsPublic().equals(true)) {
            throw new PrivateFileException("File with id:" + id + " is not public. Get token");
        }
        MediaType mediaType = MediaType.parseMediaType(file.getContentType().getMimeType());
        log.info("Sending file to download: name:{}, type:{}", file.getName(), mediaType);
        incrementDownloadCount(id);

        return FileUtil.getOutputFile(file.getPathName(), "files", mediaType);
    }
}
