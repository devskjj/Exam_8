package kg.attractor.filehub.service.interfaces;

import jakarta.mail.MessagingException;

import java.io.UnsupportedEncodingException;

public interface EmailService {
    void sendPrivateDownloadLink(String email, String link) throws MessagingException, UnsupportedEncodingException;
}
