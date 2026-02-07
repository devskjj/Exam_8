package kg.attractor.filehub.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "content_types")
public class ContentType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Column(name = "mime_type", length = 100, nullable = false)
    private String mimeType;

    @Column(name = "extension", length = 20, nullable = false)
    private String extension;

    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "contentType", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<File> files;
}
