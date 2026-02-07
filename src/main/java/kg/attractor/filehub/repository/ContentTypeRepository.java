package kg.attractor.filehub.repository;

import kg.attractor.filehub.entity.ContentType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ContentTypeRepository extends JpaRepository<ContentType, Long> {
    Optional<ContentType> findByName(String name);

    Optional<ContentType> findByMimeType(String mimeType);

    Optional<ContentType> findByExtension(String extension);

    List<ContentType> findByNameContainingIgnoreCase(String name);

    boolean existsByName(String name);

    boolean existsByMimeType(String mimeType);

    boolean existsByExtension(String extension);
}
