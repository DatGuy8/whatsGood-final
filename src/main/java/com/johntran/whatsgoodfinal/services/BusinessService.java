package com.johntran.whatsgoodfinal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.repositories.BusinessRepository;
import com.johntran.whatsgoodfinal.repositories.ItemRatingRepository;
import com.johntran.whatsgoodfinal.repositories.ItemRepository;

import jakarta.transaction.Transactional;

@Service
public class BusinessService {

	@Autowired
	private BusinessRepository businessRepo;
	@Autowired
	private ItemRepository itemRepo;
	@Autowired
	private ItemRatingRepository ratingRepo;

	// FIND ALL BUSINESSES
	public List<Business> findAll() {
		return businessRepo.findAll();
	}

	// FIND ALL APPROVED BUSINESSES
	public List<Business> findAllApproved(Boolean isApproved) {
		return businessRepo.findAllByIsApproved(isApproved);
	}

	// FIND FEATURED BUSINESSES
	public List<Business> findFeaturedBusinesses(Boolean isFeatured){
		return businessRepo.findAllByIsFeatured(isFeatured);
	}
	
	// ADD BUSINESS
	public Business addBusiness(Business business) {
		return businessRepo.save(business);
	}
	
	// GET ONE BUSINESS
	public Business getOne(Long id) {
		Optional<Business> oneBusiness = businessRepo.findById(id);
		if (oneBusiness.isPresent()) {
			return oneBusiness.get();
		} else {
			return null;
		}
	}
	
	// ADD ITEM TO BUSINESS
	public void addItem(Long businessId, Item item) {
		Business business = this.getOne(businessId);
		if (business != null) {
			item.setBusiness(business);
			business.getItems().add(item);
			System.out.println(business.getItems());
			businessRepo.save(business);
		} else {
			System.out.println("Didnt work");
		}
	}
	
	// DELETE
	@Transactional
	public void deleteByBusinessId(Long id) {
		if (businessRepo.existsById(id)) {
			List<Item> items = itemRepo.findByBusinessId(id);
			
			for(Item item : items) {
				ratingRepo.deleteAllByItem(item);
			}
			
			
			itemRepo.deleteAllByBusinessId(id);
			businessRepo.deleteById(id);
		} else {
			throw new IllegalArgumentException("Business not found with ID: " + id);
		}
	}

	// APPROVE A BUSINESS
	public void approveBusinessById(Long id) {
		Optional<Business> oneBusiness = businessRepo.findById(id);
		if (oneBusiness.isPresent()) {
			Business business = oneBusiness.get();
			business.setIsApproved(true);
			businessRepo.save(business);
		} else {
			throw new IllegalArgumentException("Business not found with ID: " + id);
		}
	}
	
	// =================== FEATURE A BUSINESS======================TO ADD
}
