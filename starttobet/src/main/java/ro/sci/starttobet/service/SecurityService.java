package ro.sci.starttobet.service;

import org.springframework.stereotype.Component;

import ro.sci.starttobet.domain.User;

@Component
public class SecurityService {

	private ThreadLocal<User> currentUser;
	
	public void setCurrentUser(User user) {
		this.currentUser = new ThreadLocal<>();
		this.currentUser.set(user);
	}
	
	public User getCurrentUser() {
		return this.currentUser != null ?
				this.currentUser.get() : null;
		
	}
}
