package com.johntran.whatsgoodfinal.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.johntran.whatsgoodfinal.models.Business;
import com.johntran.whatsgoodfinal.models.Item;
import com.johntran.whatsgoodfinal.repositories.BusinessRepository;
import com.johntran.whatsgoodfinal.repositories.ItemRepository;

@Service
public class ItemService {
	@Autowired
	private ItemRepository itemService;
	@Autowired
	private BusinessRepository businessService;
	
//=====================ADD ITEM=========================	
	public Item addItem(Item item) {
		return itemService.save(item);
	}

//===================GET ITEMS FROM ONE BUSINESS==================
	public List<Item> findBusinessItems(Long businessId){
		return itemService.findByBusinessId(businessId);
	}
}
