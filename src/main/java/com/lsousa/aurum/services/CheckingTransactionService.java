package com.lsousa.aurum.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lsousa.aurum.models.Checking;
import com.lsousa.aurum.models.CheckingTransaction;
import com.lsousa.aurum.repositories.CheckingTransactionRepo;

@Repository
public class CheckingTransactionService {
	@Autowired
	private CheckingTransactionRepo transRepo;
	
	// ========== Create / Update ================
	
	public CheckingTransaction create(String action, String amount, Checking checking) {
		CheckingTransaction newTrans = new CheckingTransaction();

		newTrans.setAmount(Double.parseDouble(amount));
		newTrans.setAction(action);
		newTrans.setChecking_account(checking);
		
		return transRepo.save(newTrans);
	}

    public CheckingTransaction save(CheckingTransaction m) {
        return transRepo.save(m);
    }

    // ========== Read ===========================

    public List<CheckingTransaction> getAll() {
        return transRepo.findAll();
    }
}
