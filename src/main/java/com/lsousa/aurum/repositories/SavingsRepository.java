package com.lsousa.aurum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.lsousa.aurum.models.Savings;

public interface SavingsRepository extends CrudRepository<Savings, Long> {
	List<Savings> findAll();
	Savings findOneByAcctNumber(String acctNumber);
	Savings findOneByUserId(Long id);
}
