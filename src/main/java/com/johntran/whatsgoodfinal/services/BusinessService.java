package com.johntran.whatsgoodfinal.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.repositories.BusinessRepository;

@Service
public class BusinessService {
	@Autowired
	private BusinessRepository businessService;
	
//====================FIND ALL BUSINESSES======================
	public List<Business> findAll(){
		return businessService.findAll();
	}

//=====================ADD BUSINESS=============================
	public Business addBusiness(Business business) {
		return businessService.save(business);
	}
	
//====================GET ONE BUSINESS============================
	public Business getOne(Long id) {
		Optional<Business> oneBusiness = businessService.findById(id);
		if(oneBusiness.isPresent()) {
			return oneBusiness.get();
		}else {
			return null;
		}
	}

//========================ADD ITEM TO BUSINESS===========================
	public void addItem(Long businessId, Item item) {
		Business business = this.getOne(businessId);
	    if (business != null) {
	    	item.setBusiness(business);
	        business.getItems().add(item);
	        System.out.println(business.getItems());
	        businessService.save(business);
	    } else {
            System.out.println("Didnt work");
        }
	}
}
