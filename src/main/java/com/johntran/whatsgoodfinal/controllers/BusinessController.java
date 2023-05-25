package com.johntran.whatsgoodfinal.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.johntran.whatsgoodfinal.config.FileUploadUtil;
import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemService;
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

//==================HOMEPAGE/LANDING PAGE===========================	
	@GetMapping({ "/", "/home" })
	public String homePage(Principal principal, Model model) {
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);
		List<Business> businesses = businessService.findAllApproved(true);
		model.addAttribute("businesses", businesses);
		
		return "business/homePage.jsp";
	}

//=================ADD BUSINESS PAGE=======================
	@GetMapping("/business/add") 
	public String addBusiness(@ModelAttribute("business") Business business, Model model) {
		return "business/addBusiness.jsp";
	}

//=================POST ROUTE ADD BUSINESS=================
	@PostMapping("/business/new")
	public String saveBusiness(@Valid @ModelAttribute("business") Business business, BindingResult result, Model model)
			throws IOException {
		if (result.hasErrors()) {
			return "business/addBusiness.jsp";
		}

		MultipartFile multipartFile = business.getImageFile();
		String fileName = StringUtils.cleanPath(business.getImageFile().getOriginalFilename());
		business.setImage(fileName);
		businessService.addBusiness(business);

		if (fileName.isBlank()) {
			System.out.println("no image saved");
			return "redirect:/";
		} else {
			String uploadDir = "uploadedImages/business/" + business.getId();
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			System.out.println("imaged saved");
			return "redirect:/";
		}

	}

//=====================BUSINESS SHOW PAGE===========================
	@GetMapping("/business/{businessId}")
	public String showBusiness(@PathVariable("businessId") Long businessId, Model model) {
		
		Business business = businessService.getOne(businessId);
		List<Item> items = itemService.findBusinessItems(businessId);
		model.addAttribute("business", business);
		model.addAttribute("items", items);
		return "business/businessShow.jsp";
	}
	
	@GetMapping("/test")
	public String test() {
		return "test.jsp";
	}

}
