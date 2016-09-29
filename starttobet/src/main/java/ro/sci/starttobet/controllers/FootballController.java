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

@Controller
@RequestMapping("/football")
@RestController
public class FootballController{
	
	@Autowired
	private FootballService footballService;
	
	@Autowired
	private JsonService jsonService;
	
	@RequestMapping(value = "/PremierLeague",method = RequestMethod.GET) 
	public ModelAndView showPremierLeagueMatches() throws IOException{
		jsonService.emptyMap();//TODO delete this when implementing the JDBC
		jsonService.scanForFiles("Football","PremierLeague");
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}
	
	@RequestMapping(value = "/LaLiga",method = RequestMethod.GET) 
	public ModelAndView showPrimeraDivisionMatches() throws IOException{
		jsonService.emptyMap();//TODO delete this when implementing the JDBC
		jsonService.scanForFiles("Football","LaLiga");
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}
	
	@RequestMapping(value = "/LigueOne",method = RequestMethod.GET) 
	public ModelAndView showLigueOneMatches() throws IOException{
		jsonService.emptyMap();//TODO delete this when implementing the JDBC
		jsonService.scanForFiles("Football","LigueOne");
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}
	
	@RequestMapping(value = "/Bundesliga",method = RequestMethod.GET) 
	public ModelAndView showBundesligaMatches() throws IOException{
		jsonService.emptyMap();//TODO delete this when implementing the JDBC
		jsonService.scanForFiles("Football","Bundesliga");
		ModelAndView modelAndView = new ModelAndView("home/home");
		modelAndView.addObject("matches", footballService.listAll());
		return modelAndView;
	}
	
	
}




