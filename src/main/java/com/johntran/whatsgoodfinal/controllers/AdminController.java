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

	// -------APPROVE BUSINESS ROUTE
	@PutMapping("/admin/approve/business/{businessId}")
	public String approveBusiness(@PathVariable("businessId") Long businessId) {
		businessService.approveBusinessById(businessId);
		return "redirect:/admin";

	}

	// ---------DELETE/DENY BUSINESS
	@DeleteMapping("/admin/delete/business/{businessId}")
	public String deleteBusiness(@PathVariable("businessId") Long businessId) {
		businessService.deleteByBusinessId(businessId);
		return "redirect:/admin";
	}

	// -----------EDIT BUSINESS PAGE
	@GetMapping("/admin/editbusiness/{id}")
	public String editBusiness(@PathVariable("id") Long id, Model model) {
		Business business = businessService.getOne(id);
		model.addAttribute("business", business);
		return "admin/editBusiness.jsp";

	}

	// ------------- UPDATE BUSINESS ROUTE
	@PutMapping("/admin/editbusiness/{id}")
	public String updateBusiness(@Valid @ModelAttribute("business") Business business, BindingResult result,
			Principal principal, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("business", business);
			return "admin/editBusiness.jsp";
		} else {
			GeoApiContext context = new GeoApiContext.Builder().apiKey(googleApiKey).build();
			String address = business.getAddress().getStreet() +" "+ business.getAddress().getCity()  +","+ business.getAddress().getState()  +" "+ business.getAddress().getZipCode();
			String email = principal.getName();
			System.out.println(address);
			User currentUser = userService.findByEmail(email);
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
			
		    //update business with new address
			businessService.addBusiness(business);
			return "redirect:/admin";
		}
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
	
	//----------- CHANGE USER ROLE --------------
	@PostMapping("/admin/role/{userId}")
	public String changeRole(@PathVariable("userId")Long userId) {
		User user = userService.findById(userId);
		
		if(user == null) {
			System.out.println("user not found");
			return "redirect:/admin/users";
		}
		userService.changeRole(user);
		
		return "redirect:/admin/users";
	}
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		return "admin/accessDenied.jsp";
	}
	

}
