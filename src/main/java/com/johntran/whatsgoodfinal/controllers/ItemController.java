package com.johntran.whatsgoodfinal.controllers;

import java.io.IOException;
import java.security.Principal;

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
import com.johntran.whatsgoodfinal.models.ItemRating;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemRatingService;
import com.johntran.whatsgoodfinal.services.ItemService;
import com.johntran.whatsgoodfinal.services.UserService;

import jakarta.validation.Valid;

@Controller
public class ItemController {

	@Autowired
	ItemService itemService;

	@Autowired
	BusinessService businessService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ItemRatingService itemRatingService;

//==================ADD ITEM SHOW PAGE=========================
	@GetMapping("business/{businessId}/item/new")
	public String addItem(@ModelAttribute("newItem")Item newItem,@PathVariable("businessId") Long businessId, Model model) {

		Business business = businessService.getOne(businessId);
		model.addAttribute("business", business);

		return "item/addItem.jsp";
	}

//==================POST ADD ITEM ROUTE=========================
	@PostMapping("/business/{businessId}/item/new")
	public String saveItem(@Valid @ModelAttribute("newItem")Item newItem, BindingResult result,@PathVariable("businessId") Long businessId) throws IOException {
		if(result.hasErrors()) {
			return "item/addItem.jsp";
		}
		MultipartFile multipartFile = newItem.getImageFile();
		String fileName = StringUtils.cleanPath(newItem.getImageFile().getOriginalFilename());
		newItem.setImage(fileName);
		
		Business business = businessService.getOne(businessId);
		newItem.setBusiness(business);
		itemService.addItem(newItem);
		
		if(fileName.isBlank()) {
			System.out.println("no image saved");
			return "redirect:/business/{businessId}";
		}else {
			String uploadDir = "uploadedImages/business/" + newItem.getBusiness().getId() + "/items";
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			System.out.println("imaged saved");
			return "redirect:/business/{businessId}";
		}
		
	}
	
//=======================SINGLE ITEM PAGE WITH REVIEWS===========//ADD FORM TOO?==================
	@GetMapping("/item/{itemId}")
	public String itemShowPage(
			@ModelAttribute("itemRating")ItemRating itemRating,
			@PathVariable("itemId")Long itemId,
			Model model
			) {
		
		Item menuItem = itemService.getOneItem(itemId);
		Double averageRating = itemRatingService.getAverageRatingForItem(menuItem);
		model.addAttribute("averageRating",averageRating);
		model.addAttribute("menuItem",menuItem);
		return "item/showItem.jsp";
	}
//======================POST ADD ITEM RATING ROUTE==================================
	@PostMapping("/item/{itemId}")
	public String itemRatingSave(@Valid @ModelAttribute("itemRating")ItemRating itemRating, BindingResult result,@PathVariable("itemId")Long itemId,Principal pricipal) throws IOException {
		
		if(result.hasErrors()) {
			System.out.println(result);
			return "redirect:/item/{itemId}";
		}
		
		String email = pricipal.getName();
		User currentUser = userService.findByEmail(email);
		
		Item currentItem = itemService.getOneItem(itemId);
		
		itemRating.setItem(currentItem);
		itemRating.setUser(currentUser);
		
		itemRatingService.addRating(itemRating);
		
		return "redirect:/item/{itemId}";
	}
}
