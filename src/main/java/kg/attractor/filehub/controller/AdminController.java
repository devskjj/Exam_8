package kg.attractor.filehub.controller;

import kg.attractor.filehub.dto.FileDto;
import kg.attractor.filehub.dto.UserDto;
import kg.attractor.filehub.service.interfaces.FileService;
import kg.attractor.filehub.service.interfaces.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
    private final UserService userService;
    private final FileService fileService;

    @GetMapping
    public String adminDashboard(Model model) {
        model.addAttribute("userCount", userService.getUserCount());
        model.addAttribute("fileCount", fileService.getFilesCount());
        model.addAttribute("downloadCount", fileService.getDownloadCount());
        return "admin/dashboard";
    }

    @GetMapping("/users")
    public String getUsers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir,
            Model model) {

        Pageable pageable = fileService.createPageableWithSort(page, size, sortDir, sortBy);
        Page<UserDto> usersPage = userService.getUsersPage(pageable);

        model.addAttribute("users", usersPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", usersPage.getTotalPages());
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        UserDto currentUser = userService.getAuthUser();
        model.addAttribute("currentUserId", currentUser.getId());
        return "admin/users";
    }

    @GetMapping("/users/{userId}/files")
    public String getUserFiles(
            @PathVariable Long userId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDir,
            Model model) {

        UserDto user = userService.getUserById(userId);

        Pageable pageable = fileService.createPageableWithSort(page, size, sortDir, sortBy);

        Page<FileDto> filesPage = fileService.getFilesByUserId(userId, pageable);

        model.addAttribute("user", user);
        model.addAttribute("files", filesPage);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", filesPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDir", sortDir);
        model.addAttribute("reverseSortDir", sortDir.equals("asc") ? "desc" : "asc");

        return "admin/users-files";
    }

    @PostMapping("/users/{userId}/block")
    public String blockUser(@PathVariable Long userId) {
        UserDto currentUser = userService.getAuthUser();
        if (currentUser.getId().equals(userId)) {
            return "redirect:/admin/users?error=self-block";
        }
        userService.blockUser(userId);
        return "redirect:/admin/users?success=blocked";
    }

    @PostMapping("/users/{userId}/unblock")
    public String unblockUser(@PathVariable Long userId) {
        userService.unblockUser(userId);
        return "redirect:/admin/users?success=unblocked";
    }
}
