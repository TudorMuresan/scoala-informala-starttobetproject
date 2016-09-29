package ro.sci.starttobet.dao.inmemory;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import ro.sci.starttobet.dao.sportsdao.TennisDAO;
import ro.sci.starttobet.domain.Tennis;

@Component
public class IMTennisDAO extends IMBaseDAO<Tennis> implements TennisDAO{

	@Override
	public Collection<Tennis> searchByName(String query) {
		if (StringUtils.isEmpty(query)) {
			return getAll();
		}
		
		Collection<Tennis> all = new LinkedList<Tennis>(getAll());
		for (Iterator<Tennis> it = all.iterator(); it.hasNext();) {
			Tennis emp = it.next();
			String ss = emp.getMatchTitle() + " " + emp.getMatchDate();
			if (!ss.toLowerCase().contains(query.toLowerCase())) {
				it.remove();
			}
		}
		return all;
	}
}
