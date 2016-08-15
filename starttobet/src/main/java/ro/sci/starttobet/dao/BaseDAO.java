package ro.sci.starttobet.dao;

import java.util.Collection;

import ro.sci.starttobet.domain.AbstractModel;
import ro.sci.starttobet.domain.Football;


public interface BaseDAO <T extends AbstractModel>{

	Collection<T> getAll();
			
	T getById(Long id);
	
	T saveOrUpdate(T domainObject);
	
	boolean delete(T model);
	

}
