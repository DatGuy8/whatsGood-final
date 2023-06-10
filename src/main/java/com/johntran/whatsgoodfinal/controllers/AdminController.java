package com.johntran.whatsgoodfinal.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemService;
import com.johntran.whatsgoodfinal.services.UserService;

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

		return "admin/adminPage.jsp";

	}

	@GetMapping("/admin/users")
	public String adminBusiness(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);

		List<User> allUsers = userService.allUsers();
		model.addAttribute("allUsers", allUsers);

		return "admin/business.jsp";

	}

	@PutMapping("/admin/approve/business/{businessId}")
	public String approveBusiness(@PathVariable("businessId") Long businessId) {
		businessService.approveBusinessById(businessId);
		return "redirect:/";

	}

	@DeleteMapping("/admin/delete/business/{businessId}")
	public String deleteBusiness(@PathVariable("businessId") Long businessId) {
		businessService.deleteByBusinessId(businessId);
		return "redirect:/";
	}

	@GetMapping("/admin/editbusiness/{businessId}")
	public String editBusiness(@PathVariable("businessId") Long businessId, Model model) {
		Business business = businessService.getOne(businessId);
		model.addAttribute("business", business);

		return "admin/editBusiness.jsp";

	}

}
