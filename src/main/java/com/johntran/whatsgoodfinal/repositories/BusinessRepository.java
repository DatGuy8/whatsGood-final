package com.johntran.whatsgoodfinal.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.johntran.whatsgoodfinal.models.Business;

@Repository
public interface BusinessRepository extends CrudRepository<Business,Long>{
	List<Business> findAll();
	List<Business> findAllByIsApproved(Boolean isApproved);
	List<Business> findByIsApprovedTrueAndNameContainingIgnoreCaseOrIsApprovedTrueAndWebsiteContainingIgnoreCaseOrIsApprovedTrueAndAddressContainingIgnoreCase(String name, String website, String address);
}
