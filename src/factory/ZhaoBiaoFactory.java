package factory;

import dao.ZhaoBiaoProxy;

public class ZhaoBiaoFactory {
	private static ZhaoBiaoProxy proxy;


	public static ZhaoBiaoProxy getProxy() {
		return proxy;
	}


	public static void setProxy(ZhaoBiaoProxy proxy) {
		ZhaoBiaoFactory.proxy = proxy;
	}


	public static ZhaoBiaoProxy get(){
		return getProxy();
	}
}
