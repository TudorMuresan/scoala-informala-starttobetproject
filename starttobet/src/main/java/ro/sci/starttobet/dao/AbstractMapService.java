package ro.sci.starttobet.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ro.sci.starttobet.domain.DomainObject;

public abstract class AbstractMapService {
	protected Map<Integer, DomainObject> domainMap;
	
	public AbstractMapService()
	{
		domainMap = new HashMap<>();
		loadDomainObjects();
	}
	
	public List<DomainObject> getAll(){return new ArrayList<>(domainMap.values());}
	
	public DomainObject getById(int id){return domainMap.get(id);}
	
	public DomainObject saveOrUpdate(DomainObject domainObject)
	{
		if(domainObject!=null){
			if(domainObject.getId()==null){
				domainObject.setId(getNextKey());
			}
			domainMap.put(domainObject.getId(), domainObject);
			
			return domainObject;
		}
		else{
			throw new RuntimeException("Object can't be null!");
		}
	}
	public void delete(int id){
		domainMap.remove(id);
	}
	
	private Integer getNextKey(){
		return Collections.max(domainMap.keySet()) + 1;
	}
	
	
	protected abstract void loadDomainObjects();
	
}
