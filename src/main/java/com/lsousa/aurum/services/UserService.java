package com.lsousa.aurum.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.lsousa.aurum.models.LoginUser;
import com.lsousa.aurum.models.User;
import com.lsousa.aurum.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	// ========== Register and Login =============

	// Register method
    // This method will be called from the controller
    // whenever a user submits a login form.
    public User register(User newUser, BindingResult result) {
		Optional<User> optionalUser = userRepository.findByEmail(newUser.getEmail());
		if (optionalUser.isPresent()) {
			result.rejectValue("email", "duplicate", "Email address is already registered");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "not matching", "Confirm password does not match");
		}
		if (result.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		
		return userRepository.save(newUser);
	}

    // Login method
    // This method will be called from the controller
    // whenever a user submits a login form.
    public User login(LoginUser newLogin, BindingResult result) {
		Optional<User> optionalUser = userRepository.findByEmail(newLogin.getEmail());
		if (!optionalUser.isPresent()) {
			result.rejectValue("email", "not registered", "Email address is incorrect");
		}
		if (result.hasErrors()) {
			return null;
		}
		User user = optionalUser.get();
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
		}
		if (result.hasErrors()) {
			return null;
		}
		return user;
	}
	
	public User getOneUser (Long id) {
      return userRepository.findById(id).orElse(null);

	}
}
