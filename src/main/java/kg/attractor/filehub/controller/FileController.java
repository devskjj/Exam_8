package kg.attractor.filehub.controller;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import kg.attractor.filehub.dto.FileDto;
import kg.attractor.filehub.entity.DownloadToken;
import kg.attractor.filehub.entity.File;
import kg.attractor.filehub.service.interfaces.*;
import kg.attractor.filehub.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/files")
public class FileController {
    private final FileService fileService;
    private final FileCategoryService fileCategoryService;
    private final UserService userService;
    private final DownloadTokenService downloadTokenService;
    private final EmailService emailService;

    @GetMapping("/upload")
    public String getUploadPage(@RequestParam(value = "error", required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Error when upload file");
        }

        FileDto fileDto = new FileDto();

        addCommonAttributes(model);
        model.addAttribute("fileDto", fileDto);
        return "files/upload";
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<?> downloadFile(@PathVariable Long id) {
        return fileService.downloadFile(id);
    }

    @PostMapping("/upload")
    public String uploadFile(
            @ModelAttribute("fileDto") @Valid FileDto fileDto,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file,
            Model model) {

        if (bindingResult.hasErrors()) {
            addCommonAttributes(model);
            return "files/upload";
        }

        try {
            fileDto.setUser(userService.getAuthUser());
            fileService.uploadFile(file, fileDto);
            return "redirect:/profile";
        } catch (Exception e) {
            model.addAttribute("error", "Error when getting file: " + e.getMessage());
            addCommonAttributes(model);
            return "files/upload";
        }
    }

    @PostMapping("/request-download")
    public String requestPrivateDownload(@RequestParam Long fileId, @RequestParam String email, HttpServletRequest request,
                                         Model model) {
        try {
            File file = fileService.getFileEntityById(fileId);
            DownloadToken token = downloadTokenService.createToken(file, 30);
            String link = FileUtil.getSiteUrl(request) + "/files/private-download?token=" + token.getToken();

            emailService.sendPrivateDownloadLink(email, link);
            model.addAttribute("message", "Ссылка отправлена на email");
            return "message";
        } catch (MessagingException | UnsupportedEncodingException e) {
            model.addAttribute("error", e.getMessage());
            return "message";
        }
    }

    @GetMapping("/private-download")
    public ResponseEntity<?> privateDownload(@RequestParam String token) {
        File file = downloadTokenService.consumeToken(token);
        return fileService.downloadPrivateFile(file.getId());
    }

    @GetMapping("/request-download")
    public String getRequestDownloadForm(@RequestParam Long fileId, Model model) {
        model.addAttribute("fileId", fileId);
        return "files/request-download";
    }

    private void addCommonAttributes(Model model) {
        model.addAttribute("categories", fileCategoryService.getAll());
        model.addAttribute("user", userService.getAuthUser());
    }
}
