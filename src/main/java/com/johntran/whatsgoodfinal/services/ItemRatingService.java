package com.johntran.whatsgoodfinal.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.ItemRating;
import com.johntran.whatsgoodfinal.models.User;
import com.johntran.whatsgoodfinal.repositories.ItemRatingRepository;

@Service
public class ItemRatingService {

	@Autowired
	ItemRatingRepository itemRatingRepo;
	
//===================ADD ITEM RATING=========================
	public ItemRating addRating(ItemRating rating) {
		return itemRatingRepo.save(rating);
	}
	
//===================GET AVERAGE RATING=======================
	public Double getAverageRatingForItem(Item item) {
		return itemRatingRepo.calculateAverageRatingForItem(item);
	}

//=================CHECK TO SEE IF USER RATED AN ITEM ALREADY=======================
	public boolean hasUserRatedItem(Long userId, Long itemId) {
		Item item = new Item();
		item.setId(itemId);

		User user = new User();
		user.setId(userId);
		
		return itemRatingRepo.existsByUserAndItem(user, item);
	}
}
