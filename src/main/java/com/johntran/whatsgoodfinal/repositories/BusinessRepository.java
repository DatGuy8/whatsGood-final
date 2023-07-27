package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.Business;

@Repository
public interface BusinessRepository extends JpaRepository<Business, Long> {
	List<Business> findAll();

	List<Business> findAllByIsApproved(Boolean isApproved);
	
	List<Business> findAllByIsFeatured(Boolean isFeatured);

	// FOR SEARCHING
	List<Business> findByIsApprovedTrueAndNameContainingIgnoreCaseOrIsApprovedTrueAndWebsiteContainingIgnoreCaseOrIsApprovedTrue(String name, String website);

}
