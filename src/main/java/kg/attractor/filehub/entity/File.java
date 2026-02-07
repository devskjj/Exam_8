package kg.attractor.filehub.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "files")
public class File {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "path_name")
    private String pathName;

    @Column(name = "size", nullable = false)
    private Long size;

    @Column(name = "upload_date", nullable = false)
    private LocalDateTime uploadDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "file_category_id", nullable = false)
    private FileCategory fileCategory;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "content_type_id", nullable = false)
    private ContentType contentType;

    @Column(name = "is_public", nullable = false)
    private Boolean isPublic;

    @Column(name = "download_count", nullable = false)
    private Integer downloadCount;
}
