package com.johntran.whatsgoodfinal.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Photo;
import com.johntran.whatsgoodfinal.repositories.PhotoRepository;

@Service
public class PhotoService {

	@Autowired
	private PhotoRepository photoRepo;
	
	// ADD PHOTO
	public Photo savePhoto(Photo photo) {
		return photoRepo.save(photo);
	}
}