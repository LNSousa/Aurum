package com.lsousa.aurum.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "transactions")
public class CheckingTransaction {
	// ========== Primary Key ===================
	
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id;
		
		// ========== Member Variables ==============
		 
		 private String action;
		
		 private Double amount;
		
		// ========== Data Creation Trackers ========
		
		@Column(updatable = false)
		private Date createdAt;
		private Date updatedAt;
		
		// ========== Relationships =================

		// Many
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name="checking_id")
		private Checking checking_account;
		
		// ========== Constructors ==================
		
		// Empty constructor
		public CheckingTransaction() {}
		
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

		public String getAction() {
			return action;
		}

		public void setAction(String action) {
			this.action = action;
		}

		public Double getAmount() {
			return amount;
		}

		public void setAmount(Double amount) {
			this.amount = amount;
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

		public Checking getChecking_account() {
			return checking_account;
		}

		public void setChecking_account(Checking checking_account) {
			this.checking_account = checking_account;
		}
}
