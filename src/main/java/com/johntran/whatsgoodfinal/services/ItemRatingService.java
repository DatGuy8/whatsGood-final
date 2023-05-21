package com.johntran.whatsgoodfinal.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.ItemRating;
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


}
