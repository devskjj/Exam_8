package kg.attractor.filehub.service.impl;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import kg.attractor.filehub.service.interfaces.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {
    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String EMAIL_FROM;

    public void sendPrivateDownloadLink(String email, String link)
            throws MessagingException, UnsupportedEncodingException {

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom(EMAIL_FROM, "FileHub");
        helper.setTo(email);
        helper.setSubject("Ссылка для скачивания файла");

        helper.setText("""
        <p>Здравствуйте!</p>
        <p>Вы запросили доступ к приватному файлу.</p>
        <p>Ссылка одноразовая и действует ограниченное время:</p>
        <p><a href="%s">Скачать файл</a></p>
        """.formatted(link), true);

        mailSender.send(message);
    }
}
