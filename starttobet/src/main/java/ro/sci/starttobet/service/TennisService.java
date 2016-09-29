package ro.sci.starttobet.service;

import java.util.Collection;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.sci.starttobet.dao.inmemory.IMTennisDAO;
import ro.sci.starttobet.domain.Tennis;

@Service
public class TennisService {
	private static final Logger LOGGER = LoggerFactory.getLogger(TennisService.class);

	@Autowired
	private IMTennisDAO dao;

	public Collection<Tennis> listAll() {
		return dao.getAll();
	}

	public Collection<Tennis> search( String query) {
		LOGGER.debug("Searching for " + query);
		return dao.searchByName(query);
	}

	public boolean delete(Long id) {
		LOGGER.debug("Deleting employee for id: " + id);
		Tennis match = dao.getById(id);
		if (match != null) {
			dao.delete(match);
			return true;
		}

		return false;
	}

	public Tennis get(Long id) {
		LOGGER.debug("Getting match for id: " + id);
		return dao.getById(id);

	}

	public void save(Tennis match) throws Exception {
		LOGGER.debug("Saving: " + match);

		dao.saveOrUpdate(match);
	}
}
