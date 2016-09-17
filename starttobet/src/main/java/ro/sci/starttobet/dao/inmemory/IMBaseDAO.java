package ro.sci.starttobet.dao.inmemory;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import ro.sci.starttobet.dao.BaseDAO;
import ro.sci.starttobet.domain.AbstractModel;



public abstract class IMBaseDAO<T extends AbstractModel> 
	implements BaseDAO<T> {
	private Map<Long, T> models = new HashMap<Long, T>();

	private static AtomicLong ID = new AtomicLong(System.currentTimeMillis());

	@Override
	public Collection<T> getAll() {

		return models.values();
	}

	@Override
	public T getById(Long id) {

		return models.get(id);
	}

	@Override
	public T saveOrUpdate(T model) {
		boolean exists=false;
		if (model.getId() <= 0) {
			model.setId(ID.getAndIncrement());
		}
		for (Map.Entry<Long, T> entry : models.entrySet())
		{
			if(model.equals(entry.getValue())){
				exists = true;
			}
		}
		if(!exists){
			models.put(model.getId(), model);
		}
		return model;
	}

	@Override
	public boolean delete(T model) {
		boolean result = models.containsKey(model.getId());

		if (result)
			models.remove(model.getId());
		return result;
	}

}
