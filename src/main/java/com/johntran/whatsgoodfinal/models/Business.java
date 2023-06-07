package com.johntran.whatsgoodfinal.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "businesses")
public class Business {
// ===========================MEMBER VARIABLES====================================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Size(min = 3, max = 200)
	private String name;

	@NotEmpty
	@Size(min = 5, max = 200)
	private String address;

	@Size(min = 5, max = 255)
	private String website;

	
	private Double latitude;
	
	private Double longitude;
	
	@Column(columnDefinition = "boolean default false")
	private Boolean isApproved;
	
//============================RELATIONSHIPS===================================
	// --------CATEGORIES---------
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "business_categories", joinColumns = @JoinColumn(name = "business_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories;

	// ---------USERS FAVORITE BUSINESSES------------
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "favorite_businesses", joinColumns = @JoinColumn(name = "business_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;
	
	//---------PHOTOS--------------
	@OneToMany(mappedBy="business", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Photo> photos;

	// -----------ITEMS---------------
	@OneToMany(mappedBy = "business", fetch = FetchType.LAZY)
	private List<Item> items;

//==============================METHODS=================================
	// --------------ADD ITEM TO BUSINESS-----------------
	public void addItem(Item item) {
		if (item == null) {
			items = new ArrayList<>();
		}
		items.add(item);
		item.setBusiness(this);
	}
	
	//---------------ADD PHOTOS------------------
	public void addPhoto(Photo photo) {
		if (photo == null) {
			photos = new ArrayList<>();
		}
		photos.add(photo);
		photo.setBusiness(this);
	}
	
	public void removePhoto(Photo photo) {
        photos.remove(photo);
        photo.setBusiness(null);
    }

// =========================CREATED AT AND UPDATED AT=================================
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

// =================================CONSTRUCTORS==================================================
	public Business() {
		this.isApproved = false;
	}

//=======================AUTO CREATED UPDATED AT=========================================
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

// ==============================GETTERS AND SETTERS=================================
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}


	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public Boolean getIsApproved() {
		return isApproved;
	}

	public void setIsApproved(Boolean isApproved) {
		this.isApproved = isApproved;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public List<Photo> getPhotos() {
		return photos;
	}

	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}

	
}
