package com.lsousa.aurum.controllers;

import java.util.Collections;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lsousa.aurum.models.Checking;
import com.lsousa.aurum.models.CheckingTransaction;
import com.lsousa.aurum.models.Savings;
import com.lsousa.aurum.models.SavingsTransaction;
import com.lsousa.aurum.models.User;
import com.lsousa.aurum.services.CheckingService;
import com.lsousa.aurum.services.CheckingTransactionService;
import com.lsousa.aurum.services.SavingsService;
import com.lsousa.aurum.services.SavingsTransactionService;
import com.lsousa.aurum.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
	@Autowired
	private CheckingService checkingService;
	@Autowired
	private SavingsService savingsService;
	@Autowired
	private UserService userService;
	@Autowired
	private CheckingTransactionService ctransService;
	@Autowired
	private SavingsTransactionService stransService;
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		User user = userService.getOneUser((Long) session.getAttribute("userId"));
		
		List<CheckingTransaction> ctrans = user.getCheckingAcct().getTransactions();
		Collections.reverse(ctrans);
		
		List<SavingsTransaction> strans = user.getSavingsAcct().getTransactions();
		Collections.reverse(strans);
		
		model.addAttribute("user", user);
		model.addAttribute("checking", user.getCheckingAcct());
		model.addAttribute("savings", user.getSavingsAcct());
		model.addAttribute("goal", user.getSavingsAcct().getGoal());
		model.addAttribute("checkTrans", ctrans);
		model.addAttribute("savingsTrans", strans);

		return "dashboard.jsp";
	}
	
	@GetMapping("/request")
	public String deposit(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Checking checking = checkingService.getOneByUserId((Long) session.getAttribute("userId"));
		
		model.addAttribute("checking", checking);

		List<CheckingTransaction> trans = checking.getTransactions();
		Collections.reverse(trans);
		model.addAttribute("trans", trans);
		
		return "request.jsp";
	}
	
	@GetMapping("/request-processed")
	public String requestMessage() {
		
		return "message.jsp";
	}
	
	@GetMapping("/transfer")
	public String transfer(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Savings savings = savingsService.getOneByUserId((Long) session.getAttribute("userId"));
		Checking checking = checkingService.getOneByUserId((Long) session.getAttribute("userId"));
		
		model.addAttribute("checking", checking);
		model.addAttribute("savings", savings);

		List<SavingsTransaction> trans = savings.getTransactions();
		Collections.reverse(trans);
		model.addAttribute("trans", trans);
		
		return "transfer.jsp";
	}
	
	@GetMapping("/exchange")
	public String exchange(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}

		User user = userService.getOneUser((Long) session.getAttribute("userId"));

		model.addAttribute("user", user);
		
		return "exchange.jsp";
	}
	
	@GetMapping("/transactions")
	public String checkTrans(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Checking checking = checkingService.getOneByUserId((Long) session.getAttribute("userId"));
		Savings savings = savingsService.getOneByUserId((Long) session.getAttribute("userId"));

		model.addAttribute("c", checking);
		model.addAttribute("s", savings);

		List<CheckingTransaction> cTrans = checking.getTransactions();
		Collections.reverse(cTrans);
		model.addAttribute("cTrans", cTrans);

		List<SavingsTransaction> sTrans = savings.getTransactions();
		Collections.reverse(sTrans);
		model.addAttribute("sTrans", sTrans);
		
		return "transactions.jsp";
	}
	
	// ========== Action =========================

    // POST, PUT, DELETE requests
	
	@PostMapping("/process-request")
	public String processRequest(@RequestParam(value="amount") String amount,
			@RequestParam(value="password") String password, 
			@RequestParam("action") String action, HttpSession session,
			RedirectAttributes redirectAttributes, Model model) {
		
		User user = userService.getOneUser((Long) session.getAttribute("userId"));
		
		if (!BCrypt.checkpw(password, user.getPassword())) {
			redirectAttributes.addFlashAttribute("error", "Incorrect password!");
			return "redirect:/request";
		}
		
		Checking checking = user.getCheckingAcct();
		
		Savings savings = user.getSavingsAcct();
		
		if(action.equals("deposit")) {
			ctransService.create(action, amount, checking);
			
			checking.setBalance(checking.getBalance() + Double.parseDouble(amount));
			checkingService.save(checking);			
		} 
		if (action.equals("withdraw")) {
			if(Double.parseDouble(amount) > savings.getBalance()) {
				redirectAttributes.addFlashAttribute("error", "The withdraw request exceeds your balance!");
				return "redirect:/request";
			}
			ctransService.create(action, amount, checking);
			
			checking.setBalance(checking.getBalance() - Double.parseDouble(amount));
			checkingService.save(checking);	
		}
		if(action.equals("transfer-in")) {
			if(Double.parseDouble(amount) > savings.getBalance()) {
				redirectAttributes.addFlashAttribute("error", "The transfer request exceeds your savings account balance!");
				return "redirect:/transfer";
			}
			stransService.create(action, amount, savings);
			ctransService.create(action, amount, checking);
			
			savings.setBalance(savings.getBalance() - Double.parseDouble(amount));
			checking.setBalance(checking.getBalance() + Double.parseDouble(amount));
			if(savings.getGoal() != null) {
				if (savings.getGoal().getProgress() < Double.parseDouble(amount)) {
					savings.getGoal().setProgress(0.0);
				} else {
					savings.getGoal().setProgress(savings.getGoal().getProgress() - Double.parseDouble(amount));
				}
			}
			savingsService.save(savings);			
		} 
		if (action.equals("transfer-out")) {
			if(Double.parseDouble(amount) > checking.getBalance()) {
				redirectAttributes.addFlashAttribute("error", "The transfer request exceeds your checking account balance!");
				return "redirect:/transfer";
			}
			stransService.create(action, amount, savings);
			ctransService.create(action, amount, checking);
			
			savings.setBalance(savings.getBalance() + Double.parseDouble(amount));
			checking.setBalance(checking.getBalance() - Double.parseDouble(amount));
			if(savings.getGoal() != null) {
				if (savings.getGoal().getGoalAmount() < Double.parseDouble(amount)) {
					savings.getGoal().setProgress(savings.getGoal().getProgress() + Double.parseDouble(amount) - Double.parseDouble(amount));
				} else {
					savings.getGoal().setProgress(savings.getGoal().getProgress() + Double.parseDouble(amount));
				}
			}
			savingsService.save(savings);	
			
		}
		
		redirectAttributes.addFlashAttribute("message", action);
		
		return "redirect:/request-processed";
	}
}
