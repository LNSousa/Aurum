package com.lsousa.aurum.models;

import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

	// ========== Primary Key ===================
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	// ========== Member Variables ==============
	
	@NotEmpty(message="Please enter a valid first name")
	private String firstName;

	@NotEmpty(message="Please enter a valid last name")
	private String lastName;
	
	@NotEmpty(message="Please enter an email")
	@Email(message="Please enter a valid email address")
	private String email;
	
	@NotEmpty(message="Password is required")
	@Size(min=8, message="Password must be at least 8 characters long")
	private String password;

	@Transient
	private String confirm;
	
	// ========== Data Creation Trackers ========
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	// ========== Relationships =================
	
	// Main One
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Checking checkingAcct;
	
	// Main One
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Savings savingsAcct;
	
	// ========== Constructors ==================
	
	// Empty constructor
	public User() {}
	
	// ========== Data Creation Event ===========
	
	@PrePersist
	protected void onCreate() {
	    this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdated() {
	    this.updatedAt = new Date();
	}
	
	// ========== Getters and Setters ===========

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Checking getCheckingAcct() {
		return checkingAcct;
	}

	public void setCheckingAcct(Checking checkingAcct) {
		this.checkingAcct = checkingAcct;
	}

	public Savings getSavingsAcct() {
		return savingsAcct;
	}

	public void setSavingsAcct(Savings savingsAcct) {
		this.savingsAcct = savingsAcct;
	}
}
