package com.lsousa.aurum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lsousa.aurum.models.CheckingTransaction;

@Repository
public interface CheckingTransactionRepo extends CrudRepository<CheckingTransaction, Long> {
	List<CheckingTransaction> findAll();
}
