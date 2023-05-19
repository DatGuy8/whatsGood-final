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
	@GetMapping("business/{id}/item/new")
	public String addItem(@PathVariable("id") Long id, Model model, @ModelAttribute("item") Item item) {

		Business business = businessService.getOne(id);
		model.addAttribute("business", business);

		return "item/addItem.jsp";
	}

//==================POST ADD ITEM ROUTE=========================
	@PostMapping("/business/{id}/item/new")
	public String saveItem(@Valid @ModelAttribute("item") Item item, BindingResult result,@PathVariable("id") Long id) throws IOException {
		if(result.hasErrors()) {
			return "item/addItem.jsp";
		}
		MultipartFile multipartFile = item.getImageFile();
		String fileName = StringUtils.cleanPath(item.getImageFile().getOriginalFilename());
		item.setImage(fileName);
//		Business business = businessService.getOne(id);
//		item.setBusiness(business);
//		itemService.addItem(item);
		businessService.addItem(id, item);
		
		if(fileName.isBlank()) {
			System.out.println("no image saved");
			return "redirect:/business/{id}";
		}else {
			String uploadDir = "uploadedImages/business/" + item.getBusiness().getId() + "/items";
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			System.out.println("imaged saved");
			return "redirect:/business/{id}";
		}
		
	}
}
