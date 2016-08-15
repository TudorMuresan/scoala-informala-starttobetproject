package ro.sci.starttobet.dao.sportsdao;

import java.util.Collection;

import ro.sci.starttobet.dao.BaseDAO;
import ro.sci.starttobet.domain.Football;

public interface FootballDAO extends BaseDAO<Football>{
	
	Collection<Football> searchByName(String query);

}
