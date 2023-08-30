package com.johntran.whatsgoodfinal.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.UserService;
import com.johntran.whatsgoodfinal.validator.UserValidator;

import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private BusinessService businessService;

	@GetMapping("/register")
	public String registerForm(@ModelAttribute("user") User user) {
		return "user/registrationPage.jsp";
	}

	@PostMapping("/register")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,RedirectAttributes redirectAttributes) {

		userValidator.validate(user, result);

		if (result.hasErrors()) {
			return "user/registrationPage.jsp";
		} else if (userService.allUsers().size() == 0) {
			userService.saveUserWithAdminRole(user);
			redirectAttributes.addFlashAttribute("successMessage", "Thanks For Registering, Please Log in");
			return "redirect:/login";
		} else {
			userService.saveWithUserRole(user);
			redirectAttributes.addFlashAttribute("successMessage", "Thanks For Registering, Please Log in");
			return "redirect:/login";
		}

	}

	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		

		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}

		return "user/loginPage.jsp";
	}

	@PostMapping("/user/addFavoriteBusiness/{businessId}")
	public String addFavoriteBusiness(@PathVariable("businessId") Long businessId, Principal principal) {
		
		return "redirect:/comingsoon";
	}

	@GetMapping("/user/profile")
	public String profilePage() {
		return "redirect:/comingsoon";
	}

	@GetMapping("/user/{userId}")
	public String userPage(@PathVariable("userId") Long userId) {
		return "redirect:/comingsoon";
	}

	@GetMapping("/comingsoon")
	public String comingSoon() {
		return "comingSoon.jsp";
	}
	
	
}
