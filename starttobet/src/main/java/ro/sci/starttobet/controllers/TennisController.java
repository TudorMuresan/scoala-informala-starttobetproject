package ro.sci.starttobet.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import ro.sci.starttobet.service.JsonService;
import ro.sci.starttobet.service.TennisService;

@Controller
@RequestMapping("/tennis")
@RestController
public class TennisController{
	
	@Autowired
	private TennisService tennisService;
	
	@Autowired
	private JsonService jsonService;
	
	
	@RequestMapping(value = "/ATP",method = RequestMethod.GET) 
	public ModelAndView showPremierLeagueMatches() throws IOException{
		System.out.println("enters");
		jsonService.scanForFiles("Tennis","ATP");
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("tmatches", tennisService.listAll());
		return modelAndView;
	}
	
}




