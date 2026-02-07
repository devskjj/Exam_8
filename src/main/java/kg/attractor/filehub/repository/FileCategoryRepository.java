package kg.attractor.filehub.repository;

import kg.attractor.filehub.entity.FileCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FileCategoryRepository extends JpaRepository<FileCategory, Long> {
    Optional<FileCategory> findByName(String name);

    boolean existsByName(String name);
}