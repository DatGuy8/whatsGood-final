package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.Photo;

@Repository
public interface PhotoRepository extends CrudRepository<Photo,Long>{

	List<Photo> findAll();
	
}
