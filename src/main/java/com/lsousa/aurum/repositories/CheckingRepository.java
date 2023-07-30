package com.lsousa.aurum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.lsousa.aurum.models.Checking;

public interface CheckingRepository extends CrudRepository<Checking, Long> {
	List<Checking> findAll();
	Checking findOneByAcctNumber(String acctNumber);
	Checking findOneByUserId(Long id);
}
