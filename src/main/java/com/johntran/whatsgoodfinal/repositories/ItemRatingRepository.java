package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.ItemRating;
@Repository
public interface ItemRatingRepository extends CrudRepository<ItemRating, Long> {
	
	List<ItemRating> findAllByItemId(Long id);
}