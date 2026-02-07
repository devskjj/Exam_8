package kg.attractor.filehub.util;

import jakarta.servlet.http.HttpServletRequest;
import kg.attractor.filehub.exception.FileNotFoundException;
import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Slf4j
@UtilityClass
public class FileUtil {
    private static final String UPLOAD_DIR = "data/";

    @SneakyThrows
    public String saveUploadFile(MultipartFile file, String subDir) {
        String uuidFile = UUID.randomUUID().toString();
        String resultFileName = uuidFile + "_" + file.getOriginalFilename();

        Path pathDir = Paths.get(UPLOAD_DIR + subDir);
        Files.createDirectories(pathDir);

        Path filePath = Paths.get(pathDir + "/" + resultFileName);
        if (!Files.exists(filePath)) {
            Files.createFile(filePath);
        }

        try (OutputStream os = Files.newOutputStream(filePath)) {
            os.write(file.getBytes());
            log.info("File saved successfully: {}", filePath);
        } catch (IOException e) {
            log.error("Failed to save file: {}", filePath, e);
            throw new RuntimeException("Failed to save file", e);
        }
        return resultFileName;
    }

    @SneakyThrows
    public ResponseEntity<?> getOutputFile(String filename, String subDir, MediaType mediaType) {
        if (!subDir.endsWith("/") && !subDir.isEmpty()) {
            subDir += "/";
        }

        Path filePath = Paths.get(UPLOAD_DIR + subDir + filename);

        if (Files.isDirectory(filePath)) {
            throw new FileNotFoundException("The file exists and is not a directory: " + filePath);
        }

        if (!Files.exists(filePath)) {
            throw new FileNotFoundException("File not found: " + filePath);
        }

        byte[] content = Files.readAllBytes(filePath);
        String originalFileName = filename.substring(filename.indexOf('_') + 1);
        String encodedFileName = URLEncoder.encode(originalFileName, StandardCharsets.UTF_8)
                .replace("+", "%20");

        Resource resource = new ByteArrayResource(content);
        log.info("Getting output file: {}", filename);
        return ResponseEntity.ok()
                .contentType(mediaType)
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename*=UTF-8''" + encodedFileName)
                .header(HttpHeaders.CACHE_CONTROL, "no-cache, no-store, must-revalidate")
                .header(HttpHeaders.PRAGMA, "no-cache")
                .header(HttpHeaders.EXPIRES, "0")
                .contentLength(content.length)
                .body(resource);
    }

    public static String getSiteUrl(HttpServletRequest request) {
        String siteUrl = request.getRequestURL().toString();
        return siteUrl.replace(request.getServletPath(), "");
    }
}
