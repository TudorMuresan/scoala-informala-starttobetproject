package ro.sci.starttobet.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ro.sci.starttobet.domain.Tennis;

@Component
public class TennisParser {
	
	@Autowired
	TennisService tennieService;
	
	/**
	 * @param obj
	 * @return
	 */
	protected List<Object> parseTennisEvents(JSONObject obj,String league) {
		JSONArray arr = obj.getJSONArray("rounds");
         List<Object> result = new LinkedList<>();
         for(int i = 0; i < arr.length(); i++){
        	 JSONArray matchesArray = ((JSONObject) arr.get(i)).getJSONArray("matches");
             for(int j=0;j<matchesArray.length();j++){            	 
            	 String date = matchesArray.getJSONObject(j).getString("date");
            	 Tennis match = new Tennis();
            	 //get the home team and the away team
            	 JSONObject teamOne =  matchesArray.getJSONObject(j).getJSONObject("team1");
            	 Object homeTeam = teamOne.get("name");
            	 JSONObject teamTwo =  matchesArray.getJSONObject(j).getJSONObject("team2");
            	 Object awayTeam = teamTwo.get("name");
            	 
            	 //six type of odds - > the user will can choose one odd for each available match
            	 double homeWin =  matchesArray.getJSONObject(j).getDouble("hWin");
            	 double awayWin =  matchesArray.getJSONObject(j).getDouble("aWin");
            	 
            	 
            	 match.setHomeTeam(homeTeam.toString());
            	 match.setAwayTeam(awayTeam.toString());
            	 match.sethWin(homeWin);
            	 match.setaWin(awayWin);
            	 
            	 match.setMatchTitle(homeTeam.toString() + "  VS  " + awayTeam.toString());
            	 System.out.println(match.toString());
            	 
            
            	 //dateFormatter 
            	 //-->From string to Date<--
            	 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy MM dd");
            	 LocalDate dt = LocalDate.parse(date);
            	 String txt = dt.format(formatter);
            	 LocalDate parsedDate = LocalDate.parse(txt, formatter);
            	 match.setMatchDate(parsedDate);
            	 try {
            		 tennieService.save(match);
				} catch (Exception e) {
					e.printStackTrace();
				}
             }
         }
		 return result;
	}
}
