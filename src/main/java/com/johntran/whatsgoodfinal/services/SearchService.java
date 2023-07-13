package com.johntran.whatsgoodfinal.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.repositories.BusinessRepository;
import com.johntran.whatsgoodfinal.repositories.ItemRepository;
import com.johntran.whatsgoodfinal.repositories.UserRepository;

@Service
public class SearchService {
	@Autowired
	private BusinessRepository businessRepo;

	@Autowired
	private ItemRepository itemRepo;

	@Autowired
	private UserRepository userRepo;

	
	public List<Business> searchBusiness(String name, String website) {
		return businessRepo
				.findByIsApprovedTrueAndNameContainingIgnoreCaseOrIsApprovedTrueAndWebsiteContainingIgnoreCaseOrIsApprovedTrue(
						name, website);
	}

	
	public List<Item> searchItems(String name, String description) {
		return itemRepo.findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(name, description);
	}

	public List<User> searchUsers(String name) {
		return userRepo.findByUserNameContainingIgnoreCase(name);
	}

}
