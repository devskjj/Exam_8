package kg.attractor.filehub.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RoleDto {
    private Long id;

    @NotBlank(message = "Имя роли не должно быть пустым")
    private String name;
}
