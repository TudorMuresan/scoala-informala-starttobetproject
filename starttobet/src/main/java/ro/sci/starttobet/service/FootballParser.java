package ro.sci.starttobet.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ro.sci.starttobet.domain.Football;

@Component
public class FootballParser {
	
	@Autowired
	FootballService footballService;
	
	/**
	 * @param obj
	 * @return
	 */
	protected List<Object> parseFootballEvents(JSONObject obj) {
		JSONArray arr = obj.getJSONArray("rounds");
         List<Object> result = new LinkedList<>();
         for(int i = 0; i < arr.length(); i++){
        	 JSONArray matchesArray = ((JSONObject) arr.get(i)).getJSONArray("matches");
             for(int j=0;j<matchesArray.length();j++){            	 
            	 String date = matchesArray.getJSONObject(j).getString("date");
            	 Football match = new Football();
            	 //get the home team and the away team
            	 JSONObject teamOne =  matchesArray.getJSONObject(j).getJSONObject("team1");
            	 Object homeTeam = teamOne.get("name");
            	 JSONObject teamTwo =  matchesArray.getJSONObject(j).getJSONObject("team2");
            	 Object awayTeam = teamTwo.get("name");
            	 
            	 //six type of odds - > the user will can choose one odd for each available match
            	 double homeWin =  matchesArray.getJSONObject(j).getDouble("hWin");
            	 double awayWin =  matchesArray.getJSONObject(j).getDouble("aWin");
            	 double draw =  matchesArray.getJSONObject(j).getDouble("draw");
            	 double homeOrDraw =  matchesArray.getJSONObject(j).getDouble("hOrDraw");
            	 double awayOrDraw =  matchesArray.getJSONObject(j).getDouble("aOrDraw");
            	 double homeOrAway =  matchesArray.getJSONObject(j).getDouble("hOra");
            	 
            	 match.setHomeTeam(homeTeam.toString());
            	 match.setAwayTeam(awayTeam.toString());
            	 match.sethWin(homeWin);
            	 match.setaWin(awayWin);
            	 match.setDraw(draw);
            	 match.sethOrDraw(homeOrDraw);
            	 match.setaOrDraw(awayOrDraw);
            	 match.sethOra(homeOrAway);
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
            		 footballService.save(match);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	// System.out.println("Scheduled date = " + parsedDate);
            	 //System.out.println(homeTeam + " vs " + awayTeam + "    " + "\nhome---" + homeWin + "\naway---" + awayWin + "\ndraw---" + draw + "\nhomeordraw---" + homeOrDraw + "\nawayordraw---" + awayOrDraw + "\nhomeoraway---" + homeOrAway +"\n");
             }
         }
		 return result;
	}
}
