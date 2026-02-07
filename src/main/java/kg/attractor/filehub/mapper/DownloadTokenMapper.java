package kg.attractor.filehub.mapper;

import kg.attractor.filehub.dto.DownloadTokenDto;
import kg.attractor.filehub.entity.DownloadToken;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = {FileMapper.class})
public interface DownloadTokenMapper {

    DownloadTokenDto toDto(DownloadToken downloadToken);

    DownloadToken toEntity(DownloadTokenDto downloadTokenDto);
}
