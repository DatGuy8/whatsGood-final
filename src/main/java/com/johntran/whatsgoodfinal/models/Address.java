package com.johntran.whatsgoodfinal.models;

import jakarta.persistence.Embeddable;

@Embeddable
public class Address {

//===========================MEMBER VARIABLES=================================
	private String street;
	private String city;
	private String state;
	private String zipCode;

//==============================CONSTRUCTOR==============================
	public Address() {}
	
	public Address(String street, String city, String state, String zipCode) {
		this.street = street;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}

// ===================GETTERS AND SETTERS======================
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
}
