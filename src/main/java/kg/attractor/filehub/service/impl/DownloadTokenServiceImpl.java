package kg.attractor.filehub.service.impl;

import kg.attractor.filehub.entity.DownloadToken;
import kg.attractor.filehub.entity.File;
import kg.attractor.filehub.exception.PrivateFileException;
import kg.attractor.filehub.repository.DownloadTokenRepository;
import kg.attractor.filehub.service.interfaces.DownloadTokenService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class DownloadTokenServiceImpl implements DownloadTokenService {
    private final DownloadTokenRepository downloadTokenRepository;

    @Override
    public DownloadToken createToken(File file, int minutes) {
        DownloadToken token = DownloadToken.builder()
                .token(UUID.randomUUID().toString())
                .file(file)
                .expirationDate(LocalDateTime.now().plusMinutes(minutes))
                .isUsed(false)
                .build();
        log.info("Creating DownloadToken Token: {}", token);
        return downloadTokenRepository.save(token);
    }

    @Override
    public File consumeToken(String token) {
        DownloadToken downloadToken = downloadTokenRepository.findByTokenAndIsUsedFalseAndExpirationDateAfter(
                token,
                LocalDateTime.now()).orElseThrow(() -> new PrivateFileException("Token is invalid or expired"));

        File file = downloadToken.getFile();
        downloadToken.setIsUsed(true);

        downloadTokenRepository.delete(downloadToken);
        log.info("Successfully deleted token {}", downloadToken.getToken());
        return file;
    }
}
