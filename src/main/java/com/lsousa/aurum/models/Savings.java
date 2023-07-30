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
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name="savings_accounts")
public class Savings {

	// ========== Primary Key ===================
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	// ========== Member Variables ==============
	
	private String acctNumber;
	
	private Double balance;
	
	// ========== Data Creation Trackers ========
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	// ========== Relationships =================

	// One to tie to main
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="savings_id")
	private User user;
	
	// One-to-One
	
	// Main One
	@OneToOne(mappedBy="savings", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private Goal goal;
	
	// One-to-Many

	// One
	@OneToMany(mappedBy="savings_account", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<SavingsTransaction> transactions;

	// ========== Constructors ==================
	
	// Empty constructor
	public Savings() {}
	
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

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
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

	public String getAcctNumber() {
		return acctNumber;
	}

	public void setAcctNumber(String acctNumber) {
		this.acctNumber = acctNumber;
	}

	public Goal getGoal() {
		return goal;
	}

	public void setGoal(Goal goal) {
		this.goal = goal;
	}

	public List<SavingsTransaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<SavingsTransaction> transactions) {
		this.transactions = transactions;
	}

}
