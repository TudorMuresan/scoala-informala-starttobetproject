package ro.sci.starttobet.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import ro.sci.starttobet.service.FootballService;
import ro.sci.starttobet.service.JsonService;


@RequestMapping("/Football")
@RestController
public class FootballController{
	
	@Autowired
	private FootballService footballService;
	
/*	@RequestMapping(value ="match/list")
	public ModelAndView list() throws Exception {
		ModelAndView modelAndView = new ModelAndView("match/list");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}*/
	
	@RequestMapping(value ="") 
	public ModelAndView showFootball(JsonService js) throws Exception {
		js.scanForFiles();
		ModelAndView modelAndView = new ModelAndView("match/list");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}
}




