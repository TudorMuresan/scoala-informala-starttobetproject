package ro.sci.starttobet.service;

import java.io.IOException;

public interface JsonEventsParser {
	void scanForFiles(String sportType,String league) throws IOException;

}
