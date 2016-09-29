package ro.sci.starttobet.dao.sportsdao;

import java.util.Collection;

import ro.sci.starttobet.dao.BaseDAO;
import ro.sci.starttobet.domain.Tennis;

public interface TennisDAO extends BaseDAO<Tennis>{
	
	Collection<Tennis> searchByName(String query);

}
