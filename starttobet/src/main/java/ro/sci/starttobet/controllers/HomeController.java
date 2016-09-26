package ro.sci.starttobet.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import ro.sci.starttobet.service.FootballService;
import ro.sci.starttobet.service.JsonService;
import ro.sci.starttobet.service.SecurityService;

@Controller
@RequestMapping("")
@RestController

public class HomeController {
	
	
	@Autowired
	private FootballService footballService;
	
	@Autowired
	private JsonService jsonService;
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping("") 
	public ModelAndView showHomePage(){
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("currentUser", securityService.getCurrentUser());
		return modelAndView;
	}
	
	@RequestMapping(value = "/footballMatches",method = RequestMethod.GET) 
	public ModelAndView showMatches() throws IOException{
		jsonService.scanForFiles();
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}
	
}
