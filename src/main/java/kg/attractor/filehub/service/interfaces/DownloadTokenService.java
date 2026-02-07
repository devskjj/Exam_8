package kg.attractor.filehub.service.interfaces;

import kg.attractor.filehub.entity.DownloadToken;
import kg.attractor.filehub.entity.File;


public interface DownloadTokenService {
    DownloadToken createToken(File file, int minutes);

    File consumeToken(String token);
}
