package factory;

import dao.CreditProxy;

public class CreditFactory {
	private static CreditProxy proxy;
	
	public static CreditProxy getProxy() {
		return proxy;
	}

	public static void setProxy(CreditProxy proxy) {
		CreditFactory.proxy = proxy;
	}

	public static CreditProxy get(){
		return getProxy();
	}
}
