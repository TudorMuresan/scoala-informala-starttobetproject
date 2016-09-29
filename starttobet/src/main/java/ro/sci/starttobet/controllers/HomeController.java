package ro.sci.starttobet.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import ro.sci.starttobet.service.SecurityService;

@Controller
@RequestMapping("")
@RestController

public class HomeController {

	@Autowired
	private SecurityService securityService;
	
	@RequestMapping("") 
	public ModelAndView showHomePage(){
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("currentUser", securityService.getCurrentUser());
		return modelAndView;
	}

	@RequestMapping(value = "/saveReceipt",method = RequestMethod.POST) 
	public String saveMatches(@RequestParam String recDetails,String betValue) throws IOException{
		System.out.println(recDetails);
		System.out.println(betValue);
		System.out.println("aaaa");
		return "";
	}
}
