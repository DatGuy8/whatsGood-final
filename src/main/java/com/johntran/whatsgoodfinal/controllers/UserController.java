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
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {

		userValidator.validate(user, result);
		System.out.println(result);

		if (result.hasErrors()) {
			return "user/registrationPage.jsp";
		} else if (userService.allUsers().size() == 0) {
			userService.saveUserWithAdminRole(user);
			return "redirect:/login";
		} else {
			userService.saveWithUserRole(user);
			return "redirect:/login";
		}

	}

	@GetMapping("/login")
	public String login() {
		return "user/loginPage.jsp";
	}
	
	
	@GetMapping("/test")
	public String test1() {
		return "test.jsp";
	}
	
	@PostMapping("/user/addFavoriteBusiness/{businessId}")
	public String addFavoriteBusiness(@PathVariable("businessId")Long businessId, Principal principal) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		Business business = businessService.getOne(businessId);
		
		System.out.println("here");
		
		
		return "redirect:/";
	}
	
	@GetMapping("/user/profile")
	public String profilePage() {
		return "user/userProfile.jsp";
	}
	
}
