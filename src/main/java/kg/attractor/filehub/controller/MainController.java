package kg.attractor.filehub.controller;

import kg.attractor.filehub.dto.FileDto;
import kg.attractor.filehub.dto.UserDto;
import kg.attractor.filehub.service.interfaces.ContentTypeService;
import kg.attractor.filehub.service.interfaces.FileCategoryService;
import kg.attractor.filehub.service.interfaces.FileService;
import kg.attractor.filehub.service.interfaces.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.NoSuchElementException;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class MainController {
    private final UserService userService;
    private final FileService fileService;
    private final FileCategoryService fileCategoryService;
    private final ContentTypeService contentTypeService;

    @GetMapping
    public String getMainPage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false, defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Long contentTypeId,
            @RequestParam(required = false, defaultValue = "uploadDate") String sortBy,
            Model model) {

        addCommonAttributes(model, page, size, sortDirection, categoryId, contentTypeId, sortBy, null);
        return "index";
    }

    @GetMapping("/profile")
    public String getProfilePage(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false, defaultValue = "desc") String sortDirection,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Long contentTypeId,
            @RequestParam(required = false, defaultValue = "uploadDate") String sortBy,
            Model model) {

        UserDto user = userService.getAuthUser();
        model.addAttribute("user", user);
        addCommonAttributes(model, page, size, sortDirection, categoryId, contentTypeId, sortBy, user.getId());
        return "profile/profile";
    }

    private void addCommonAttributes(Model model, int page, int size, String sortDirection,
                                     Long categoryId, Long contentTypeId, String sortBy, Long userId) {
        Pageable pageable = fileService.createPageableWithSort(page, size, sortDirection, sortBy);
        Page<FileDto> files = null;
        try {
            files = fileService.getFilesPage(userId, categoryId, contentTypeId, pageable);

        } catch (NoSuchElementException ignored) {
        }

        model.addAttribute("files", files);
        model.addAttribute("categories", fileCategoryService.getAll());
        model.addAttribute("types", contentTypeService.getAll());
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("contentTypeId", contentTypeId);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("page", page);
        model.addAttribute("size", size);
    }
}
