package kg.attractor.filehub.repository;

import kg.attractor.filehub.entity.DownloadToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface DownloadTokenRepository extends JpaRepository<DownloadToken, Long> {
    Optional<DownloadToken> findByToken(String token);

    Optional<DownloadToken> findByTokenAndIsUsedFalseAndExpirationDateAfter(String token, LocalDateTime date);

    boolean existsByToken(String token);
}
