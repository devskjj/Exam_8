package kg.attractor.filehub.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileDto {
    private Long id;

    @NotBlank(message = "Имя файла не должно быть пустым")
    private String name;

    private String pathName;
    private Long size;
    private LocalDateTime uploadDate;
    private UserDto user;
    private FileCategoryDto fileCategory;
    private ContentTypeDto contentType;

    @Builder.Default
    private Boolean isPublic = true;

    @Builder.Default
    private Integer downloadCount = 0;

    public String getFormattedUploadDate() {
        if (uploadDate == null) {
            return null;
        }
        return uploadDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd - HH:mm"));
    }
}
