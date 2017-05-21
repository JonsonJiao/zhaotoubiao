package factory;

import dao.MessageProxy;


public class MessageFactory {
	private static MessageProxy proxy;
	
	public static MessageProxy getProxy() {
		return proxy;
	}

	public static void setProxy(MessageProxy proxy) {
		MessageFactory.proxy = proxy;
	}

	public static MessageProxy get(){
		return getProxy();
	}
}
