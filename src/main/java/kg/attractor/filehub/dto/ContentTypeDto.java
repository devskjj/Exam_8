package kg.attractor.filehub.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ContentTypeDto {
    private Long id;

    @NotBlank(message = "Имя типа контента не должно быть пустым")
    private String name;

    @NotBlank(message = "Имя мим-типа не должно быть пустым")
    private String mimeType;

    @NotBlank(message = "Имя расширения не должно быть пустым")
    private String extension;

    private String description;
}
