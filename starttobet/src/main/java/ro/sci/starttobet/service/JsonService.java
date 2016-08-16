package ro.sci.starttobet.service;


import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ro.sci.starttobet.domain.Football;

@Component
public class JsonService implements JsonEventsParser{
	
	@Autowired
	FootballParser footballParser;
	
	private final File folder = new File("src/main/resources/static");
 	private final File[] listOfFiles = folder.listFiles();
	
 	public List<Object> getJsonData(String path) throws IOException{
 		
 		String text = new String(Files.readAllBytes(Paths.get(folder.getPath() + "\\" +path)), StandardCharsets.UTF_8);
		 JSONObject obj = new JSONObject(text);
		 Object sportTypeIdentificator = obj.get("sportType");
		 List<Object> result = null;
		 if(((String)sportTypeIdentificator).equalsIgnoreCase("Football")){
			 result = footballParser.parseFootballEvents(obj); 
		 }
		 else if(((String)sportTypeIdentificator).equalsIgnoreCase("Tennis")){
			 //TODO tennis parsing 
			 //return new FootballParser().parseFootballEvents(obj).toString();
		 }else{
			 System.out.println("No data to parse!");
			 
		 }
		 return result;
 	}
 	
	@Override
	public void scanForFiles() throws IOException {
		for (File file : listOfFiles) {
	 	    if (file.isFile()) {
	 	    	getJsonData(file.getName());
	 	    }
	 	}
	}
}
