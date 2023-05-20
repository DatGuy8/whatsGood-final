package com.johntran.whatsgoodfinal.controllers;

import java.io.IOException;

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
import com.johntran.whatsgoodfinal.services.BusinessService;
import com.johntran.whatsgoodfinal.services.ItemService;

import jakarta.validation.Valid;

@Controller
public class ItemController {

	@Autowired
	ItemService itemService;

	@Autowired
	BusinessService businessService;

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
		model.addAttribute("menuItem",menuItem);
		return "item/showItem.jsp";
	}
//======================POST ADD ITEM RATING ROUTE==================================
	@PostMapping("/item/{itemId}")
	public String itemRatingSave(@ModelAttribute("itemRating")ItemRating itemRating) {
		System.out.println(itemRating.getRating());
		return "redirect:/item/{itemId}";
	}
}
