package com.lsousa.aurum.models;

import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
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
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name = "authUsers")
public class AuthorizedUser {

	// ========== Primary Key ===================
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	// ========== Member Variables ==============
	
	@NotEmpty(message="Please enter a valid first name")
	private String firstName;
	
	private String midInit;
	
	@NotEmpty(message="Please enter a valid last name")
	private String lastName;
	
	@NotEmpty
	@Pattern(regexp="\\d+\\s+([a-zA-Z]+|[a-zA-Z]+\\s[a-zA-Z]+)", message="Please enter a valid address")
	private String address;
	
	@NotEmpty(message="Please enter a city")
	@Pattern(regexp="^[A-Za-z]*$",message = "Please enter a valid city")
	private String city;
	
	@NotEmpty(message="Please enter a state")
	@Pattern(regexp="^[A-Za-z]*$",message = "Please enter a valid city")
	private String state;
	
	@NotEmpty(message="Please enter a zip code")
	private String zipcode;
	
	@NotEmpty(message="Please enter an email")
	@Email(message="Please enter a valid email address")
	private String email;
	
	// ========== Data Creation Trackers ========
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	// ========== Relationships =================
	
	// One
	@OneToMany(mappedBy="authUser", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Account> accounts;
	
	// Many
	@ManyToOne(fetch = FetchType.LAZY)
	    @JoinColumn(name="user_id")
	    private User user;
	
	// ========== Constructors ==================
	
	// Empty constructor
	public AuthorizedUser() {}
	
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

	public String getMidInit() {
		return midInit;
	}

	public void setMidInit(String midInit) {
		this.midInit = midInit;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}
}
