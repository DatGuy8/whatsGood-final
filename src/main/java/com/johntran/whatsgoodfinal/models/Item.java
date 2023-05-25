package com.johntran.whatsgoodfinal.models;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "items")
public class Item {
//===========================MEMBER VARIABLES==================================	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty
	@Size(min = 3, max = 100)
	private String name;

	@Size(min = 5, max = 255)
	private String description;

	@Min(value = 0)
	private BigDecimal price;
	
	@Transient
	private Double averageRating;
	
	private String image;

//==========================RELATIONSHIPS====================================
	// ------------ITEM RATINGS------------
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "item")
	private List<ItemRating> ratings;

	// -------------BUSINESS------------------
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "business_id")
	private Business business;

// =========================CREATED AT AND UPDATED AT=================================
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

//============================FOR IMAGE UPLOAD======================================	
	@Transient
	public String getPhotosImagePath() {
		if (image.isBlank()) return "/uploadedImages/stockDishPhoto.jpg";
		if (image == null || id == null)
			return null;
		return "/uploadedImages/items/" + this.business.getId() + "/" + image;
	}

	@Transient
	private MultipartFile imageFile;

// =======================AUTO CREATED UPDATED AT=========================================

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

//=====================CONSTRUCTOR============================
	public Item() {
	}


	//==============================GETTERS AND SETTERS===========================
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public List<ItemRating> getRatings() {
		return ratings;
	}

	public void setRatings(List<ItemRating> ratings) {
		this.ratings = ratings;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public Double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(Double averageRating) {
		this.averageRating = averageRating;
	}
}
