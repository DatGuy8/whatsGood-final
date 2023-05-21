package com.johntran.whatsgoodfinal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.repositories.ItemRepository;

@Service
public class ItemService {
	@Autowired
	private ItemRepository itemRepository;
	
	@Autowired
	private ItemRatingService itemRatingService;
	
//=====================ADD ITEM=========================	
	public Item addItem(Item item) {
		return itemRepository.save(item);
	}

//===================GET ITEMS FROM ONE BUSINESS==================
	public List<Item> findBusinessItems(Long businessId){
		List<Item> items = itemRepository.findByBusinessId(businessId);
		for (Item item : items) {
	        Double averageRating = itemRatingService.getAverageRatingForItem(item);
	        item.setAverageRating(averageRating);
		}
		return items;
	}
	
//=================GET ONE ITEM========================
	public Item getOneItem(Long id) {
		Optional<Item> oneItem = itemRepository.findById(id);
		if(oneItem.isPresent()) {
			return oneItem.get();
		}else {
			return null;
		}
	}
}
