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
		
		List<Business> businesses = businessService.findAllApproved(false);
		List<Business> approvedBusinesses =  businessService.findAllApproved(true);
		List<User> allUsers = userService.allUsers();
		List<Item> allItems = itemService.getAllItems();
		
		model.addAttribute("businesses", businesses);
		model.addAttribute("approvedBusinesses",approvedBusinesses);
		model.addAttribute("allUsers",allUsers);
		model.addAttribute("allItems",allItems);
		
		
		return "admin/adminPage.jsp";
	
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

	@GetMapping("/admin/edit/business/{businessId}")
	public String editBusiness() {
		
		return "admin/editBusiness.jsp";

	}

}
