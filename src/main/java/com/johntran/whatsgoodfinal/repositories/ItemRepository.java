 package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {
	List<Item> findAll();

	List<Item> findByBusinessId(Long BusinessId);

	List<Item> findByNameContainingIgnoreCaseOrDescriptionContainingIgnoreCase(String name, String description);

	@Query("SELECT i FROM Item i JOIN FETCH i.ratings r GROUP BY i.id ORDER BY AVG(r.rating) ASC")
	List<Item> findItemsByAverageRatingAscending();

}