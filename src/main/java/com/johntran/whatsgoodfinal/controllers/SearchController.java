package com.johntran.whatsgoodfinal.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.services.SearchService;
import com.johntran.whatsgoodfinal.services.UserService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/search")
	public String searchPage(@RequestParam(value="searchParams")String searchWord,Model model,Principal principal) {
		if(searchWord.length()< 3) {
			model.addAttribute("error", "Search Input must have at least 3 characters");
			return "search/searchPage.jsp";
		}
		
		String email = principal.getName();
		User currentUser = userService.findByEmail(email);
		model.addAttribute("currentUser", currentUser);
		
		List<Business> businesses = searchService.searchBusiness(searchWord, searchWord);
		List<Item> items = searchService.searchItems(searchWord, searchWord);
		List<User> users = searchService.searchUsers(searchWord);
		model.addAttribute("businesses", businesses);
		model.addAttribute("items", items);
		model.addAttribute("users", users);
		
		return "search/searchPage.jsp";
	}
}
