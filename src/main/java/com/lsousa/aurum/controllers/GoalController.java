package com.lsousa.aurum.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.lsousa.aurum.models.Goal;
import com.lsousa.aurum.models.User;
import com.lsousa.aurum.services.GoalService;
import com.lsousa.aurum.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class GoalController {
	@Autowired
	private GoalService goalService;
	@Autowired
	private UserService userService;
	

	@GetMapping("/goals")
	public String goals(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Goal goal = userService.getOneUser((Long) session.getAttribute("userId")).getSavingsAcct().getGoal();
		
		if (goal != null) {
			model.addAttribute("goal", goal);			
		}
		
		return "goals.jsp";
	}
	
	@GetMapping("/goals/new")
	public String newGoal(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		model.addAttribute("newGoal", new Goal());
		
		return "goals-new.jsp";
	}

	@PostMapping("/goals/new")
	public String createGoal(@Valid @ModelAttribute("newGoal") Goal goal, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "goals-new.jsp";
		}
		
		User user = userService.getOneUser((Long) session.getAttribute("userId"));
		
		goal.setSavings(user.getSavingsAcct());
		
		goalService.save(goal);
		
		return "redirect:/goals";
	}
	
	@PutMapping("/goals/edit/{id}")
	public String editGoal(@Valid @ModelAttribute("goal") Goal goal, @PathVariable("id") Long id, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("goal", goal);
			return "goals.jsp";
		}
		
		goalService.save(goal);
		
		return "redirect:/goals";
	}
	
	@DeleteMapping("/{id}/restart")
	public String delete(@PathVariable("id") Long id) {
		goalService.deleteOne(id);
		
		return "redirect:/goals/new";
	}
}
