package com.johntran.whatsgoodfinal.controllers;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;
import com.johntran.whatsgoodfinal.config.GoogleMapsApiConfig;
import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
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

	// -----------hidden API key for GoogleMaps----------
	private final String googleApiKey;

	@Autowired
	public AdminController(GoogleMapsApiConfig apiConfig) {
		this.googleApiKey = apiConfig.getApiKey();
	}

	
	@GetMapping("/access-denied")
	public String accessDenied() {
		return "admin/accessDenied.jsp";
	}
	
//============================= BUSINESS ROUTES ===============================	
	
	// ------ALL BUSINESSES/HOME ADMIN PAGE
	@GetMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);
		
		List<Business> businesses = businessService.findAll();
		
		model.addAttribute("businesses", businesses);
		
		return "admin/adminBusiness.jsp";
		
	}
	
	// -------APPROVE BUSINESS ROUTE
	@PutMapping("/admin/approve/business/{businessId}")
	public String approveBusiness(@PathVariable("businessId") Long businessId,RedirectAttributes redirectAttributes) {
		businessService.approveBusinessById(businessId);
		redirectAttributes.addFlashAttribute("successMessage","Business Successfully Approved");
		return "redirect:/admin";
		
	}
	
	// ---------DELETE/DENY BUSINESS
	@DeleteMapping("/admin/delete/business/{businessId}")
	public String deleteBusiness(@PathVariable("businessId") Long businessId, RedirectAttributes redirectAttributes) {
		businessService.deleteByBusinessId(businessId);
		redirectAttributes.addFlashAttribute("deleteMessage","Business Successfully Deleted");
		return "redirect:/admin";
	}
	
	// -----------EDIT BUSINESS PAGE
	@GetMapping("/admin/editbusiness/{id}")
	public String editBusiness(@PathVariable("id") Long id, Model model,Principal principal) {
		Business business = businessService.getOne(id);
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser",currentUser);
		model.addAttribute("business", business);
		return "admin/editBusiness.jsp";
		
	}
	
	
	// ------------- UPDATE BUSINESS ROUTE
	@PutMapping("/admin/editbusiness/{id}")
	public String updateBusiness(@Valid @ModelAttribute("business") Business business, BindingResult result,
			Principal principal, Model model,RedirectAttributes redirectAttributes) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		if (result.hasErrors()) {
			model.addAttribute("business", business);
			model.addAttribute("currentUser",currentUser);
			return "admin/editBusiness.jsp";
		}
		GeoApiContext context = new GeoApiContext.Builder().apiKey(googleApiKey).build();
		String address = business.getAddress().getStreet() + " " + business.getAddress().getCity() + ","
				+ business.getAddress().getState() + " " + business.getAddress().getZipCode();
		GeocodingResult[] results;
		try {
			results = GeocodingApi.geocode(context, address).await();
			
			if (results.length > 0) {
				// Retrieve the first result
				GeocodingResult apiResult = results[0];
				
				// Extract the latitude and longitude
				LatLng location = apiResult.geometry.location;
				double latitude = location.lat;
				double longitude = location.lng;
				
				// Pass the latitude and longitude to the model
				business.setLatitude(latitude);
				business.setLongitude(longitude);
				System.out.println("latitude" + latitude);
				System.out.println("longitude" + longitude);
				
			} else {
				// Handle case where no results are found
				System.out.println("No geocoding results found.");
			}
		} catch (ApiException | InterruptedException | IOException e) {
			// Handle exceptions
			System.out.println(e.getMessage());
		}
		// update business with new address
		Business updatedBusiness = businessService.addBusiness(business);
		redirectAttributes.addFlashAttribute("successMessage","Business Updated!");
		return "redirect:/admin/editbusiness/" + updatedBusiness.getId();
		
	}
	
	
	
	
//============================= USERS ROUTES =============================
	
	// -----ALL USERS
	@GetMapping("/admin/users")
	public String adminBusiness(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);
		
		List<User> allUsers = userService.allUsers();
		model.addAttribute("allUsers", allUsers);
		
		return "admin/adminUsers.jsp";
		
	}
	
	// ----------- CHANGE USER ROLE --------------
	@PostMapping("/admin/role/{userId}")
	public String changeRole(@PathVariable("userId") Long userId,RedirectAttributes redirectAttributes) {
		User user = userService.findById(userId);
		
		if (user == null) {
			System.out.println("user not found");
			return "redirect:/admin/users";
		}
		userService.changeRole(user);
		
		String message = "User: " + user.getUserName() + " role successfully changed!";
		redirectAttributes.addFlashAttribute("successMessage", message);
		
		return "redirect:/admin/users";
	}
	
//============================= ITEM ROUTES ==============================

	// ----------DELETE ITEM
	@DeleteMapping("/admin/delete/item/{itemId}")
	public String deleteItem(@PathVariable("itemId") Long itemId,RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("successMessage", "Item successfully deleted!");
		itemService.deleteItemById(itemId);
		return "redirect:/admin/items";
	}


	// --------EDIT ITEM PAGE
	@GetMapping("/admin/edititem/{id}")
	public String editItemPage(@PathVariable("id") Long id, Model model,Principal principal) {
		Item item = itemService.getOneItem(id);
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser",currentUser);
		model.addAttribute("item", item);
		
		return "admin/editItem.jsp";
	}

	// ------------UPDATE ITEM ROUTE
	@PutMapping("/admin/edititem/{id}")
	public String updateItem(@Valid @ModelAttribute("item") Item item, BindingResult result,
			Principal principal, Model model,RedirectAttributes redirectAttributes) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		if (result.hasErrors()) {
			model.addAttribute("item", item);
			model.addAttribute("currentUser",currentUser);
			return "admin/editItem.jsp";
		}

		// UPDATES ITEM
		Item updatedItem = itemService.addItem(item);
		
		redirectAttributes.addFlashAttribute("successMessage", "Item successfully updated!");
		
		
		return "redirect:/admin/edititem/" + updatedItem.getId();
	}


	// ---------- ALL ITEMS PAGE
	@GetMapping("/admin/items")
	public String adminItems(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);

		List<Item> items = itemService.getAllItems();
		model.addAttribute("items", items);

		return "admin/adminItems.jsp";
	}



}
