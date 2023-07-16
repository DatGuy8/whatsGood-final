package com.johntran.whatsgoodfinal.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;
import com.johntran.whatsgoodfinal.config.FileUploadUtil;
import com.johntran.whatsgoodfinal.config.GoogleMapsApiConfig;
import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.Photo;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemService;
import com.johntran.whatsgoodfinal.services.PhotoService;
import com.johntran.whatsgoodfinal.services.UserService;

import jakarta.validation.Valid;

@Controller
public class BusinessController {

	@Autowired
	private UserService userService;

	@Autowired
	private BusinessService businessService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private PhotoService photoService;

	//-----------hidden API key for GoogleMaps----------
	private final String googleApiKey;
	
	@Autowired
	public BusinessController(GoogleMapsApiConfig apiConfig) {
		this.googleApiKey = apiConfig.getApiKey();
	}
	

//==================HOMEPAGE/LANDING PAGE===========================	
	@GetMapping({ "/", "/home" })
	public String homePage(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);
		List<Business> businesses = businessService.findAllApproved(true);
		model.addAttribute("businesses", businesses);
		
		List<Item> sortedItems = itemService.getHighestRated();
		model.addAttribute("sortedItems",sortedItems);
		return "business/homePage.jsp";
	}

//=================ADD BUSINESS PAGE=======================
	@GetMapping("/business/add") 
	public String addBusiness(@ModelAttribute("business") Business business, Model model) {
		model.addAttribute("googleApiKey",googleApiKey);
		return "business/addBusiness.jsp";
	}

//=================POST ROUTE ADD BUSINESS=================
	@PostMapping("/business/new")
	public String saveBusiness(@Valid @ModelAttribute("business") Business business, BindingResult result, Model model,@RequestParam("imageFile")MultipartFile photoFile,Principal principal)
			throws IOException {
		if (result.hasErrors()) {
			return "business/addBusiness.jsp";
		}
		GeoApiContext context = new GeoApiContext.Builder()
				.apiKey(googleApiKey)
				.build();
		String address = business.getAddress().getStreet();
		String email = principal.getName();
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
//		        model.addAttribute("error", "Geocoding error: " + e.getMessage());
		    }
		    
		    
		
		if (!photoFile.isEmpty()) {
			try {
				String uploadDir = "/uploadedImages/businesses/";
				String fileName = UUID.randomUUID().toString() + "_" + photoFile.getOriginalFilename();
				FileUploadUtil.saveFile("uploadedImages/businesses/", fileName, photoFile);
				
				Photo photo = new Photo();//===================fix constructor and add in the items in parathesis
				photo.setFileName(photoFile.getOriginalFilename());
				photo.setFilePath(uploadDir + fileName);
				
				Business savedBusiness = businessService.addBusiness(business);
				photo.setBusiness(savedBusiness);
				photo.setUploadedBy(currentUser);
				
				photoService.savePhoto(photo);
		
			}catch (Exception e){
				e.printStackTrace();
			}
		}

		System.out.println("Business controller photofile area");
		   
		return "redirect:/";
	}

//=====================BUSINESS SHOW PAGE===========================
	@GetMapping("/business/{businessId}")
	public String showBusiness(@PathVariable("businessId") Long businessId, Model model,Principal principal) {
		Business business = businessService.getOne(businessId);
		if(business.getIsApproved() == false) {
			return "redirect:/";
		}
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("business", business);
		model.addAttribute("googleApiKey",googleApiKey);
		return "business/businessShow.jsp";
	}
	
	

}
