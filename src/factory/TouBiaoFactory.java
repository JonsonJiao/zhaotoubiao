package factory;

import dao.TouBiaoProxy;

public class TouBiaoFactory {
	private static TouBiaoProxy proxy;
	

	public static TouBiaoProxy getProxy() {
		return proxy;
	}


	public static void setProxy(TouBiaoProxy proxy) {
		TouBiaoFactory.proxy = proxy;
	}


	public static TouBiaoProxy get(){
		return getProxy();
	}
}
