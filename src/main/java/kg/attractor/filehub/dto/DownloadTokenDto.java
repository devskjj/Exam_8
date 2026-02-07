package kg.attractor.filehub.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DownloadTokenDto {
    private Long id;

    @NotBlank(message = "Имя токена не должно быть пустым")
    private String token;

    private LocalDateTime expirationDate;

    @Builder.Default
    private Boolean isUsed = false;

    private FileDto file;
}
