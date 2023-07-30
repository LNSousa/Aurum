package com.lsousa.aurum.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "goals")
public class Goal {

	// ========== Primary Key ===================
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	// ========== Member Variables ==============
	
	 @NotNull
	 @Size(min=1, message="Please enter a name for your goal")
	 private String name;
	 
	 @Column(length=255)
	 private String description;
	 
	 @NotNull(message="Please enter a goal amount")
	 private Integer goalAmount;
	 
	 private Double progress;
	
	// ========== Data Creation Trackers ========
	
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;
	
	// ========== Relationships =================

	// One to tie to main
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="goal_id")
	private Savings savings;
	
	
	// ========== Constructors ==================
	
	// Empty constructor
	public Goal() {}
	
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

	public Integer getGoalAmount() {
		return goalAmount;
	}

	public void setGoalAmount(Integer goalAmount) {
		this.goalAmount = goalAmount;
	}

	public Double getProgress() {
		return progress;
	}

	public void setProgress(Double progress) {
		this.progress = progress;
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

	public Savings getSavings() {
		return savings;
	}

	public void setSavings(Savings savings) {
		this.savings = savings;
	}
}
