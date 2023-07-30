package com.lsousa.aurum.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsousa.aurum.models.Savings;
import com.lsousa.aurum.models.SavingsTransaction;
import com.lsousa.aurum.repositories.SavingsTransactionRepo;

@Service
public class SavingsTransactionService {
	@Autowired
	private SavingsTransactionRepo transRepo;
	
	// ========== Create / Update ================
	
	public SavingsTransaction create(String action, String amount, Savings savings) {
		SavingsTransaction newTrans = new SavingsTransaction();

		newTrans.setAmount(Double.parseDouble(amount));
		newTrans.setAction(action);
		newTrans.setSavings_account(savings);
		
		return transRepo.save(newTrans);
	}

    public SavingsTransaction save(SavingsTransaction m) {
        return transRepo.save(m);
    }

    // ========== Read ===========================

    public List<SavingsTransaction> getAll() {
        return transRepo.findAll();
    }

}
