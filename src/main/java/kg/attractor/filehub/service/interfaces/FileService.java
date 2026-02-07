package kg.attractor.filehub.service.interfaces;

import kg.attractor.filehub.dto.FileDto;
import kg.attractor.filehub.entity.File;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {
    FileDto getFileById(Long id);

    Page<FileDto> getFilesByUserId(Long userId, Pageable pageable);

    Page<FileDto> getFilesByFileCategoryId(Long fileCategoryId, Pageable pageable);

    Page<FileDto> getFilesByTypeId(Long contentTypeId, Pageable pageable);

    Page<FileDto> getFilesByCategoryAndType(Long fileCategoryId, Long contentTypeId, Pageable pageable);

    Page<FileDto> getFilesByUserAndCategoryAndType(Long userId, Long fileCategoryId, Long contentTypeId, Pageable pageable);

    Page<FileDto> getAllFiles(Pageable pageable);

    Page<FileDto> getFilesPage(Long userId, Long categoryId, Long contentTypeId, Pageable pageable);

    Page<FileDto> getByUserAndCategory(Long userId, Long categoryId, Pageable pageable);

    Page<FileDto> getByUserAndType(Long userId, Long typeId, Pageable pageable);

    Pageable createPageableWithSort(int page, int size, String sortDirection, String sortBy);

    File getFileEntityById(Long id);

    ResponseEntity<?> downloadFile(Long id);

    ResponseEntity<?> downloadPrivateFile(Long id);

    long getFilesCount();

    long getDownloadCount();

    void createFile(FileDto fileDto);

    void incrementDownloadCount(Long id);

    void uploadFile(MultipartFile file, FileDto fileDto);
}
