package com.johntran.whatsgoodfinal.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class GoogleMapsApiConfig {
	
	@Value("${apiKey}")
	private String apiKey;
	
	public String getApiKey() {
		return apiKey;
	}
}
