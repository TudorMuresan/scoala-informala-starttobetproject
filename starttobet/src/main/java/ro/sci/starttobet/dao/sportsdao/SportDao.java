package ro.sci.starttobet.dao.sportsdao;

import java.util.Collection;


public interface SportDao <T>{

	Collection<T> getAll();
			
	T getById(Integer id);
	
	T saveOrUpdate(T domainObject);
	
	void delete(Integer id);
	

}
