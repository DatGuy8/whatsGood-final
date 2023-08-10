package com.johntran.whatsgoodfinal.services;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Business;
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
		List<Item> items = itemRepository.findAll();

		for (Item item : items) {
			Double averageRating = itemRatingService.getAverageRatingForItem(item);
			if (averageRating != null) {

				// sets average rating to two decimal points
				Double rating = Math.round(averageRating * 100.0) / 100.0;
				item.setAverageRating(rating);
			} else {
				item.setAverageRating(0.00);
			}

		}

		return items;
	}

	// ADD ITEM
	public Item addItem(Item item) {
		return itemRepository.save(item);
	}

	// GET ITEMS FROM ONE BUSINESS
	public List<Item> findBusinessItems(Business business) {
		List<Item> items = itemRepository.findByBusiness(business);

		for (Item item : items) {
			Double averageRating = itemRatingService.getAverageRatingForItem(item);
			if (averageRating != null) {

				// sets average rating to two decimal points
				Double rating = Math.round(averageRating * 100.0) / 100.0;
				item.setAverageRating(rating);
			}else {
				item.setAverageRating(0.00);
			}
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
			if (averageRating != null) {

				// sets average rating to two decimal points
				Double rating = Math.round(averageRating * 100.0) / 100.0;
				item.setAverageRating(rating);
			}else {
				item.setAverageRating(0.00);
			}
		}

		allItems.sort(Comparator.comparingDouble(Item::getAverageRating).reversed());
		return allItems;

	}

	// GET AVERAGE RATINGS FOR ALL ITEMS IN BUSINESS
	public Double getAverageRatingForBusinessItems(Business business) {
		List<Item> items = findBusinessItems(business);

		if (items.isEmpty()) {
			return null;
		}
		double totalRating = 0;
		int itemCount = 0;
		for (Item item : items) {
			Double averageRating = itemRatingService.getAverageRatingForItem(item);
			if (averageRating != null) {
				totalRating += averageRating;
				itemCount++;
			}
		}

		if (itemCount == 0) {
			return null;
		}

		return totalRating / itemCount;
	}
}
