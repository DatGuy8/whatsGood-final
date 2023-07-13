package com.johntran.whatsgoodfinal.services;

import java.util.Comparator;
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

	// ALL ITEMS
	public List<Item> getAllItems() {
		return itemRepository.findAll();
	}

	// ADD ITEM
	public Item addItem(Item item) {
		return itemRepository.save(item);
	}

	// GET ITEMS FROM ONE BUSINESS
	public List<Item> findBusinessItems(Long businessId) {
		List<Item> items = itemRepository.findByBusinessId(businessId);
		for (Item item : items) {
			Double averageRating = itemRatingService.getAverageRatingForItem(item);
			item.setAverageRating(averageRating);
		}
		return items;
	}

	// GET ONE ITEM
	public Item getOneItem(Long id) {
		Optional<Item> oneItem = itemRepository.findById(id);
		if (oneItem.isPresent()) {
			return oneItem.get();
		} else {
			return null;
		}
	}

	// GET HIGHEST RATED ITEMS
	public List<Item> getHighestRated() {
		List<Item> allItems = itemRepository.findAll();

		for (Item item : allItems) {
			Double averageRating = itemRatingService.getAverageRatingForItem(item);
			item.setAverageRating(averageRating);
		}

		allItems.sort(Comparator.comparingDouble(Item::getAverageRating).reversed());
		return allItems;

	}
}
