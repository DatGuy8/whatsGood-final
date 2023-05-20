package com.johntran.whatsgoodfinal.models;

import java.util.ArrayList;
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
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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

	@Size(max = 255)
	private String image;

//===============================FOR IMAGE UPLOAD======================================
	@Transient
	public String getPhotosImagePath() {
		if (image.isBlank())
			return "/uploadedImages/defaultRestaurant.jpg";
		if (image == null || id == null)
			return null;
		return "/uploadedImages/business/" + id + "/" + image;
	}

	@Transient
	private MultipartFile imageFile;

//============================RELATIONSHIPS===================================
	// --------CATEGORIES---------
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "business_categories", joinColumns = @JoinColumn(name = "business_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	private List<Category> categories;

	// ---------USERS FAVORITE BUSINESSES------------
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "favorite_businesses", joinColumns = @JoinColumn(name = "business_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;

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

// =========================CREATED AT AND UPDATED AT=================================
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

// =================================CONSTRUCTORS==================================================
	public Business() {
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}
