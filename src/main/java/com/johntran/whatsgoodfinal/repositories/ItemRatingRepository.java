package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.models.ItemRating;
import com.johntran.whatsgoodfinal.models.User;
@Repository
public interface ItemRatingRepository extends JpaRepository<ItemRating, Long> {

	List<ItemRating> findAllByItemId(Long id);

	@Query("SELECT AVG(ir.rating) FROM ItemRating ir WHERE ir.item = :item")
	Double calculateAverageRatingForItem(@Param("item") Item item);

	boolean existsByUserAndItem(User user, Item item);
}
