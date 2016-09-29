package ro.sci.starttobet.service;


import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JsonService implements JsonEventsParser{
	
	@Autowired
	FootballParser footballParser;
	
	@Autowired
	TennisParser tennisParser;
	
	@Autowired
	FootballService footballService;
	
	private final File folder = new File("src/main/resources/static");
 	private final File[] listOfFiles = folder.listFiles();
	
 	public List<Object> getJsonData(String path,String sport, String league) throws IOException{
 		
 		String text = new String(Files.readAllBytes(Paths.get(folder.getPath() + "\\" +path)), StandardCharsets.UTF_8);
		 JSONObject obj = new JSONObject(text);
		 List<Object> result = null;
		 Object sportTypeIdentificator = obj.get("sportType");
		 
		 if(sport.equalsIgnoreCase("Football")){
			 if(((String)sportTypeIdentificator).equalsIgnoreCase("Football")){
				 result = footballParser.parseFootballEvents(obj,league); 
			 }
		 }
		 else if(sport.equalsIgnoreCase("Tennis")){
			 if(((String)sportTypeIdentificator).equalsIgnoreCase("Tennis")){
				 result = tennisParser.parseTennisEvents(obj,league); 
			 }
			 
		 }else{
			 System.out.println("No data to parse!");
			 
		 }
		 return result;
 	}
 	
 	public void emptyMap(){
 		try {
			footballService.clearMap();
		} catch (Exception e) {
			e.printStackTrace();
		}
 	}
 	
	@Override
	public void scanForFiles(String sportType, String league) throws IOException {
		for (File file : listOfFiles) {
	 	    if (file.isFile()) {
	 	    	getJsonData(file.getName(),sportType,league);
	 	    }
	 	}
	}
}
