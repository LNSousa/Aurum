package com.lsousa.aurum.services;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsousa.aurum.models.Savings;
import com.lsousa.aurum.models.User;
import com.lsousa.aurum.repositories.SavingsRepository;

@Service
public class SavingsService {
	@Autowired
	private SavingsRepository savingsRepository;
	
	// ========== Create / Update ================
	
	public Savings createAccount(User user) {
		Savings newSavings = new Savings();

		newSavings.setBalance(0.0);
		
		while (newSavings.getAcctNumber() == null) {
			Random random = new Random();
			int potentialAcctNum = random.nextInt(999999999);
			String stringAcctNumber = String.format("%09d", potentialAcctNum);
			if (getOneByAcctNumber(stringAcctNumber) == null) {
				newSavings.setAcctNumber(stringAcctNumber);
			}
		}
		
		newSavings.setUser(user);
		
		return savingsRepository.save(newSavings);
	}

    public Savings save(Savings m) {
        return savingsRepository.save(m);
    }

    // ========== Read ===========================

    public List<Savings> getAll() {
        return savingsRepository.findAll();
    }

    public Savings getOne (Long id) {
        return savingsRepository.findById(id).orElse(null);
    }
    
    public Savings getOneByAcctNumber (String acctNumber) {
    	return savingsRepository.findOneByAcctNumber(acctNumber);
    }
    
    public Savings getOneByUserId (Long id) {
    	return savingsRepository.findOneByUserId(id);
    }

    // ========== Delete =========================

    public void deleteOne (Long id) {
    	savingsRepository.deleteById(id);
    }
}
