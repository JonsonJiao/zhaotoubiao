package factory;

import dao.AdminProxy;

public class AdminFactory {
	private static AdminProxy proxy;
	
	public static AdminProxy getProxy() {
		return proxy;
	}

	public static void setProxy(AdminProxy proxy) {
		AdminFactory.proxy = proxy;
	}

	public static AdminProxy get(){
		return getProxy();
	}

}
