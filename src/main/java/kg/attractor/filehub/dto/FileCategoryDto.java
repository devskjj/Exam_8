package kg.attractor.filehub.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FileCategoryDto {
    private Long id;

    @NotBlank(message = "Имя категории файлов не должно быть пустым")
    private String name;

    private String description;
}
