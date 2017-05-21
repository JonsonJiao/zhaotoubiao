package action;

import dao.UserProxy;

public class Limit {
	private String name;
	private String state;
	private UserProxy userProxy;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public UserProxy getUserProxy() {
		return userProxy;
	}
	public void setUserProxy(UserProxy userProxy) {
		this.userProxy = userProxy;
	}
	public String limitUser(){
		try {
			userProxy.limit(name, state);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
}
