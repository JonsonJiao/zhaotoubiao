package factory;


import dao.UserProxy;

public class UserFactory {
	private static UserProxy proxy ;
	
	public static UserProxy getProxy() {
		return proxy;
	}

	public static void setProxy(UserProxy proxy) {
		UserFactory.proxy = proxy;
	}

	public static UserProxy get() throws Exception{
		return getProxy();
	}
}