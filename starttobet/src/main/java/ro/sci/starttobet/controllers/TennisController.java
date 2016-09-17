package ro.sci.starttobet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import ro.sci.starttobet.service.SecurityService;
import ro.sci.starttobet.service.FootballService;
import ro.sci.starttobet.service.JsonService;

@Controller
@RequestMapping("/tennis")
@RestController
public class TennisController{
	
	//@Autowired
	//TODO private TennisService tennisService;
	
	@Autowired
	private SecurityService securityService;
	
	//@Autowired
	//TODO private JsonService jsonService;
	
/*	@RequestMapping(value ="match/list")
	public ModelAndView list() throws Exception {
		ModelAndView modelAndView = new ModelAndView("match/list");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}*/
	
	@RequestMapping("") 
	public ModelAndView showFootball() throws Exception {
		ModelAndView modelAndView = new ModelAndView("match/tennis");
		//modelAndView.addObject("matches", footballService.listAll());
		modelAndView.addObject("currentUser", securityService.getCurrentUser());
		return modelAndView;
	}
}




