package com.johntran.whatsgoodfinal.models;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

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
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
// ========================MEMBER VARIABLES=================================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull
	@Size(min = 3, max = 50)
	private String userName;

	@NotNull
	@Size(min = 3, max = 40)
	private String firstName;

	@NotNull
	@Size(min = 2, max = 40)
	private String lastName;

	@NotNull
	@Email
	private String email;
	
	@NotNull
	@Size(min=5)
	private String password;

	@Transient
	private String confirm;

// ========================RELATIONSHIPS===================================

	// ----------ADMIN/USER--------------
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "users_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private List<Role> roles;

	// -----------FAVORITE BUSINESSES------------
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "favorite_businesses", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "business_id"))
	private List<Business> favoriteBusinesses;

	// ------------USER RATED ITEMS------------
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<ItemRating> ratings;

// =========================CREATED AT AND UPDATED AT=================================
	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

// =======================AUTO CREATED UPDATED AT=========================================
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

// ==========================CONSTRUCTOR========================================

	public User() {
	}

// ==========================GETTERS AND SETTERS===================================
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
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

	public List<Business> getFavoriteBusinesses() {
		return favoriteBusinesses;
	}

	public void setFavoriteBusinesses(List<Business> favoriteBusinesses) {
		this.favoriteBusinesses = favoriteBusinesses;
	}

	public Set<ItemRating> getRatings() {
		return ratings;
	}

	public void setRatings(Set<ItemRating> ratings) {
		this.ratings = ratings;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
}
