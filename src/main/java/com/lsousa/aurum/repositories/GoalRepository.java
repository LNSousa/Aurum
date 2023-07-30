package com.lsousa.aurum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.lsousa.aurum.models.Goal;

public interface GoalRepository extends CrudRepository<Goal, Long> {
	List<Goal> findAll();
}
