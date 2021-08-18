package com.fitzgerald.loginreg.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fitzgerald.loginreg.models.LoginUser;
import com.fitzgerald.loginreg.models.User;
import com.fitzgerald.loginreg.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userServ;
	    
	    @GetMapping("/")
	    public String index(Model model) {
	        model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        return "index.jsp";
	    }
	    
	    @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	    	userServ.register(newUser, result);
	        if(result.hasErrors()) {
	            model.addAttribute("newLogin", new LoginUser());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", newUser.getId());
	        return "redirect:/dashboard";
	    }
	    
	    @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
	        User user = userServ.login(newLogin, result);
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "index.jsp";
	        }
	        session.setAttribute("user_id", user.getId());
	        return "redirect:/dashboard";
	    }
	    
	    @GetMapping("/dashboard")
	    public String dashboard(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
	    	Long userInSessionId = (Long)session.getAttribute("user_id");
	    	System.out.println("******LOGGED IN USER OBJECT*******");
	    	System.out.println(userInSessionId);
	    	
	    	if(userInSessionId == null) {
	    		//show Flash message on redirect
	    		redirectAttributes.addFlashAttribute("notAllowed", "Please Login to view this page");
	    		return "redirect:/";
	    	}
	    	
	    	//with the user id stored in session access user in template via id
	    	User userInSession = this.userServ.findUser(userInSessionId);
	    		
	    	model.addAttribute("userInSession", userInSession);
	    	
	    	return "dashboard.jsp";
	    }
	    
	    
	    @GetMapping("/logout")
	    public String logout(HttpSession session) {
	    	session.removeAttribute("user_id");
	    			return ("redirect:/");
	    }
	         
}
