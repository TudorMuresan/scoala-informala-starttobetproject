package ro.sci.starttobet.service;

import java.util.Collection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.sci.starttobet.dao.inmemory.IMFootballDAO;
import ro.sci.starttobet.domain.Football;

@Service
public class FootballService {
	private static final Logger LOGGER = LoggerFactory.getLogger(FootballService.class);

	@Autowired
	private IMFootballDAO dao;

	public Collection<Football> listAll() {
		
		return dao.getAll();
	}

	public Collection<Football> search( String query) {
		LOGGER.debug("Searching for " + query);
		return dao.searchByName(query);
	}

	public boolean delete(Long id) {
		LOGGER.debug("Deleting employee for id: " + id);
		Football match = dao.getById(id);
		if (match != null) {
			dao.delete(match);
			return true;
		}

		return false;
	}

	public Football get(Long id) {
		LOGGER.debug("Getting match for id: " + id);
		return dao.getById(id);

	}

	public void save(Football match) throws Exception {
		LOGGER.debug("Saving: " + match);

		dao.saveOrUpdate(match);
	}
	//TODO delete this after database implementation
	public void clearMap() throws Exception {
		dao.clearMapContent();
	}
	
}
