package com.johntran.whatsgoodfinal.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemService;
import com.johntran.whatsgoodfinal.services.UserService;

import jakarta.validation.Valid;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private BusinessService businessService;

	@Autowired
	private ItemService itemService;

	@GetMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);

		List<Business> businesses = businessService.findAll();

		model.addAttribute("businesses", businesses);

		return "admin/adminBusiness.jsp";

	}

	@GetMapping("/admin/users")
	public String adminBusiness(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);

		List<User> allUsers = userService.allUsers();
		model.addAttribute("allUsers", allUsers);

		return "admin/adminUsers.jsp";

	}

	@PutMapping("/admin/approve/business/{businessId}")
	public String approveBusiness(@PathVariable("businessId") Long businessId) {
		businessService.approveBusinessById(businessId);
		return "redirect:/admin";

	}

	@DeleteMapping("/admin/delete/business/{businessId}")
	public String deleteBusiness(@PathVariable("businessId") Long businessId) {
		businessService.deleteByBusinessId(businessId);
		return "redirect:/admin";
	}

	
	
	@GetMapping("/admin/editbusiness/{id}")
	public String editBusiness(@PathVariable("id") Long id, Model model) {
		Business business = businessService.getOne(id);
		model.addAttribute("business", business);
		return "admin/editBusiness.jsp";

	}
	
	@PutMapping("/admin/editbusiness/{id}")
	public String updateBusiness(@Valid @ModelAttribute("business")  Business business, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("business", business);
			return "admin/editBusiness.jsp";
		} else {
			businessService.addBusiness(business);
			return "redirect:/admin";
		}
	}

}
