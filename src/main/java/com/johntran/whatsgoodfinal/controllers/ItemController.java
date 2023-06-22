package com.johntran.whatsgoodfinal.controllers;

import java.io.IOException;
import java.security.Principal;
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

import com.johntran.whatsgoodfinal.config.FileUploadUtil;
import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.ItemRating;
import com.johntran.whatsgoodfinal.models.Photo;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemRatingService;
import com.johntran.whatsgoodfinal.services.ItemService;
import com.johntran.whatsgoodfinal.services.PhotoService;
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
	
	@Autowired
	PhotoService photoService;

//==================ADD ITEM SHOW PAGE=========================
	@GetMapping("business/{businessId}/item/new")
	public String addItem(@ModelAttribute("newItem")Item newItem,@PathVariable("businessId") Long businessId, Model model) {

		Business business = businessService.getOne(businessId);
		model.addAttribute("business", business);

		return "item/addItem.jsp";
	}

//==================POST ADD ITEM ROUTE=========================
	@PostMapping("/business/{businessId}/item/new")
	public String saveItem(@Valid @ModelAttribute("newItem")Item newItem, BindingResult result,@PathVariable("businessId") Long businessId,@RequestParam("imageFile")MultipartFile multipartFile,Principal principal) throws IOException {
		if(result.hasErrors()) {
			return "item/addItem.jsp";
		}
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		Business business = businessService.getOne(businessId);
		newItem.setBusiness(business);
		Item savedItem = itemService.addItem(newItem);
		if(!multipartFile.isEmpty()) {
			try {
				String uploadDir = "/uploadedImages/items/";
				String fileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
				FileUploadUtil.saveFile("uploadedImages/items/", fileName, multipartFile);
				
				Photo photo = new Photo();//===================fix constructor and add in the items in parathesis
				photo.setFileName(multipartFile.getOriginalFilename());
				photo.setFilePath(uploadDir + fileName);
				
				photo.setUploadedBy(currentUser);
				photo.setItem(savedItem);
				
				photoService.savePhoto(photo);
				System.out.println("did it save?");
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
	
		return "redirect:/item/" + savedItem.getId();
		
//		if(fileName.isBlank()) {
//			System.out.println("no image saved");
//			return "redirect:/business/{businessId}";
//		}else {
//			String uploadDir = "uploadedImages/business/" + newItem.getBusiness().getId() + "/items";
//			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
//			System.out.println("imaged saved");
//			
//		}
//		
	}
	
//=======================SINGLE ITEM PAGE WITH REVIEWS===========//ADD FORM TOO?==================
	@GetMapping("/item/{itemId}")
	public String itemShowPage(
			@ModelAttribute("itemRating")ItemRating itemRating,
			@PathVariable("itemId")Long itemId,
			Model model
			) {
		
		Item item = itemService.getOneItem(itemId);
		Double averageRating = itemRatingService.getAverageRatingForItem(item);
		model.addAttribute("averageRating",averageRating);
		model.addAttribute("item",item);
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
		
		if(itemRatingService.hasUserRatedItem(currentUser.getId(), itemId)) {
			result.rejectValue("rating", "duplicate","You have already rated the item");
			return "redirect:/item/{itemId}"; 
		}
		
		itemRating.setItem(currentItem);
		itemRating.setUser(currentUser);
		
		itemRatingService.addRating(itemRating);
		
		return "redirect:/item/{itemId}";
	}
}
