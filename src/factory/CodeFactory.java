package factory;

import dao.CodeProxy;

public class CodeFactory {
	private static CodeProxy proxy;
	

	public static CodeProxy getProxy() {
		return proxy;
	}


	public static void setProxy(CodeProxy proxy) {
		CodeFactory.proxy = proxy;
	}


	public static CodeProxy get(){
		return getProxy();
	}
	
	
}
