package com.johntran.whatsgoodfinal.config;

import java.util.Comparator;

import org.springframework.beans.factory.annotation.Autowired;

import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.services.ItemRatingService;

public class ItemRatingComparator implements Comparator<Item>{
	
	
	private ItemRatingService itemRatingService;
	// Use @Autowired annotation to automatically inject the ItemRatingService bean
    @Autowired
    public ItemRatingComparator(ItemRatingService itemRatingService) {
        this.itemRatingService = itemRatingService;
    }
	
	@Override
	 public int compare(Item item1, Item item2) {
        // Compare the average ratings of two items
        // Note: You need to implement the method getAverageRatingForItem() in your itemRatingService
        Double averageRating1 = itemRatingService.getAverageRatingForItem(item1);
        Double averageRating2 = itemRatingService.getAverageRatingForItem(item2);
        // Handle null average ratings
        if (averageRating1 == null && averageRating2 == null) {
            return 0; // Both items have no average rating, consider them equal
        } else if (averageRating1 == null) {
            return 1; // Item1 has no average rating, consider it lower than item2
        } else if (averageRating2 == null) {
            return -1; // Item2 has no average rating, consider it lower than item1
        }

        
        // Compare in reverse order to sort from highest to lowest
        return Double.compare(averageRating2, averageRating1);
    }
}
