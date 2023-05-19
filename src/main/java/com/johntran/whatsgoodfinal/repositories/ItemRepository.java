 package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.Item;

@Repository
public interface ItemRepository extends CrudRepository<Item,Long>{
	
	List<Item> findAll();
	List<Item> findByBusinessId(Long BusinessId);
	
}
