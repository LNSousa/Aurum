package com.lsousa.aurum.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsousa.aurum.models.Goal;
import com.lsousa.aurum.repositories.GoalRepository;

@Service
public class GoalService {
	@Autowired
	private GoalRepository goalRepository;
	
	// ========== Create / Update ================

    public Goal save(Goal m) {
        return goalRepository.save(m);
    }

    // ========== Read ===========================

    public List<Goal> getAll() {
        return goalRepository.findAll();
    }

    public Goal getOne (Long id) {
        return goalRepository.findById(id).orElse(null);
    }

    // ========== Delete =========================

    public void deleteOne (Long id) {
    	goalRepository.deleteById(id);
    }
}
