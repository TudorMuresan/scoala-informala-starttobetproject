package ro.sci.starttobet.service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.json.JSONArray;
import org.json.JSONObject;

public class JsonService {
	
	
 	public String getJsonData(String path) throws IOException{
 		String text = new String(Files.readAllBytes(Paths.get(path)), StandardCharsets.UTF_8);
		 JSONObject obj = new JSONObject(text);
         JSONArray arr = obj.getJSONArray("rounds");
         StringBuilder result = new StringBuilder();
         for(int i = 0; i < arr.length(); i++){
        	 JSONArray matchesArray = ((JSONObject) arr.get(i)).getJSONArray("matches");
             for(int j=0;j<matchesArray.length();j++){            	 
            	 String date = matchesArray.getJSONObject(j).getString("date");
            	 
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
            	 result.append(homeTeam + " vs " + awayTeam);
            	 result.append("\n");
            	 //dateFormatter 
            	 //-->From string to Date<--
            	 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy MM dd");
            	 LocalDate dt = LocalDate.parse(date);
            	 String txt = dt.format(formatter);
            	 LocalDate parsedDate = LocalDate.parse(txt, formatter);
            	 System.out.println("Scheduled date = " + parsedDate);
            	 System.out.println(homeTeam + " vs " + awayTeam + "    " + "\nhome---" + homeWin + "\naway---" + awayWin + "\ndraw---" + draw + "\nhomeordraw---" + homeOrDraw + "\nawayordraw---" + awayOrDraw + "\nhomeoraway---" + homeOrAway +"\n");
             }
         }
         System.out.println(result.toString());
         return result.toString();
 	}
}
