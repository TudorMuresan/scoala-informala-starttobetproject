package ro.sci.starttobet.dao.inmemory;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import ro.sci.starttobet.dao.sportsdao.FootballDAO;
import ro.sci.starttobet.domain.Football;

@Component
public class IMFootballDAO extends IMBaseDAO<Football> 
	implements FootballDAO {

	@Override
	public Collection<Football> searchByName(String query) {
		if (StringUtils.isEmpty(query)) {
			return getAll();
		}
		
		Collection<Football> all = new LinkedList<Football>(getAll());
		for (Iterator<Football> it = all.iterator(); it.hasNext();) {
			Football emp = it.next();
			String ss = emp.getMatchTitle() + " " + emp.getMatchDate();
			if (!ss.toLowerCase().contains(query.toLowerCase())) {
				it.remove();
			}
		}
		return all;
	}
}
