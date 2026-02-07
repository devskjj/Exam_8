package kg.attractor.filehub.repository;

import kg.attractor.filehub.entity.File;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepository extends JpaRepository<File, Long> {
    Page<File> findByUserId(Long userId, Pageable pageable);

    Page<File> findByFileCategoryId(Long fileCategoryId, Pageable pageable);

    Page<File> findByContentTypeId(Long contentTypeId, Pageable pageable);

    Page<File> findByFileCategoryIdAndContentTypeId(Long fileCategoryId, Long contentTypeId, Pageable pageable);

    Page<File> findByUserIdAndFileCategoryIdAndContentTypeId(Long userId, Long fileCategoryId, Long contentTypeId, Pageable pageable);

    Page<File> findByUserIdAndFileCategoryId(Long userId, Long fileCategoryId, Pageable pageable);

    Page<File> findByUserIdAndContentTypeId(Long userId, Long contentTypeId, Pageable pageable);


}
