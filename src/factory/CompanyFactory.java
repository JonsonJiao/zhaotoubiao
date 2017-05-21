package factory;

import dao.CompanyProxy;

public class CompanyFactory {
	private static CompanyProxy proxy;
	public static CompanyProxy getProxy() {
		return proxy;
	}
	public static void setProxy(CompanyProxy proxy) {
		CompanyFactory.proxy = proxy;
	}
	public static CompanyProxy get(){
		return getProxy();
	}
}
