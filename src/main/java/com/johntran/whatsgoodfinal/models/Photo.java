package com.johntran.whatsgoodfinal.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;

@Entity
@Table(name = "photos")
public class Photo {
//=============================MEMBER VARIABLES============================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String fileName;

	private String filePath;

	// -----------------RELATIONSHIPS-------------------
	
	// WHO IT IS UPLOADED BY
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "uploaded_by_user_id")
	private User uploadedBy;

	// BUSINESS PHOTOS
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "business_id")
	private Business business;

	// PHOTOS OF ITEMS
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "item_id")
	private Item item;
	
	// USER PROFILE PHOTO ADD LATER
//	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//  @JoinColumn(name = "photo_id")
//  private Photo profilePhoto;

	// ---------------CREATED AT--------------------
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;


	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
//==============================CONSTRUCTOR==============================
	public Photo() {}

//==========================GETTERS AND SETTERS=========================	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public User getUploadedBy() {
		return uploadedBy;
	}

	public void setUploadedBy(User uploadedBy) {
		this.uploadedBy = uploadedBy;
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
}
