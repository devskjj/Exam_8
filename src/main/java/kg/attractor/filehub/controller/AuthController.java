package kg.attractor.filehub.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import kg.attractor.filehub.dto.UserDto;
import kg.attractor.filehub.service.interfaces.RoleService;
import kg.attractor.filehub.service.interfaces.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {
    private final UserService userService;
    private final RoleService roleService;
    private final SecurityContextRepository contextRepository;

    @GetMapping("/login")
    public String getLoginPage(@RequestParam(value = "error", required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Wrong login or password");
        }
        return "auth/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("user", new UserDto());
        model.addAttribute("role", roleService.getRoleByName("user"));
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerUser(
            @ModelAttribute("user") @Valid UserDto userDto,
            BindingResult bindingResult,
            Model model,
            HttpServletRequest request,
            HttpServletResponse response) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("role", roleService.getRoleByName("user"));
            return "auth/register";
        }
        userService.register(userDto, request, response, contextRepository);
        return "redirect:/profile";
    }
}
