package ro.sci.starttobet.controllers;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ro.sci.starttobet.service.JsonService;



@RestController
public class FootballController{
	
	
	@RequestMapping(value ="")
	public String showChampionships() {
		return "Main Panel";
	}
	@RequestMapping(value ="/Football")
	public String showFootball(JsonService js) throws IOException {
		return js.getJsonData("firstRound.json");
	}
}




