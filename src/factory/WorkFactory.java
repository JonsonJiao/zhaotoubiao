package factory;

import dao.WorkProxy;

public class WorkFactory {
	private static WorkProxy proxy;
	



	public static WorkProxy getProxy() {
		return proxy;
	}




	public static void setProxy(WorkProxy proxy) {
		WorkFactory.proxy = proxy;
	}




	public static WorkProxy get(){
		return getProxy();
	}
}
