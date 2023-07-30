package com.lsousa.aurum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lsousa.aurum.models.SavingsTransaction;

@Repository
public interface SavingsTransactionRepo extends CrudRepository<SavingsTransaction, Long> {
	List<SavingsTransaction> findAll();
}
