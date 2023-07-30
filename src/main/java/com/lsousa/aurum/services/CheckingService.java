package com.lsousa.aurum.services;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lsousa.aurum.models.Checking;
import com.lsousa.aurum.models.User;
import com.lsousa.aurum.repositories.CheckingRepository;

@Service
public class CheckingService {
	@Autowired
	private CheckingRepository checkingRepository;
	
	// ========== Create / Update ================
	
	public Checking createAccount(User user) {
		Checking newChecking = new Checking();

		newChecking.setBalance(0.0);
		
		while (newChecking.getAcctNumber() == null) {
			Random random = new Random();
			int potentialAcctNum = random.nextInt(999999999);
			String stringAcctNumber = String.format("%09d", potentialAcctNum);
			if (getOneByAcctNumber(stringAcctNumber) == null) {
				newChecking.setAcctNumber(stringAcctNumber);
			}
		}
		
		newChecking.setUser(user);
		
		return checkingRepository.save(newChecking);
	}

    public Checking save(Checking m) {
        return checkingRepository.save(m);
    }

    // ========== Read ===========================

    public List<Checking> getAll() {
        return checkingRepository.findAll();
    }

    public Checking getOne (Long id) {
        return checkingRepository.findById(id).orElse(null);
    }
    
    public Checking getOneByAcctNumber (String acctNumber) {
    	return checkingRepository.findOneByAcctNumber(acctNumber);
    }
    
    public Checking getOneByUserId(Long id) {
    	return checkingRepository.findOneByUserId(id);
    }

    // ========== Delete =========================

    public void deleteOne (Long id) {
    	checkingRepository.deleteById(id);
    }


}
