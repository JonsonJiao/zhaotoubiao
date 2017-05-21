package factory;

import dao.ChatProxy;

public class ChatFactory {
	private static ChatProxy proxy ;
	
	public static ChatProxy getProxy() {
		return proxy;
	}

	public static void setProxy(ChatProxy proxy) {
		ChatFactory.proxy = proxy;
	}

	public static ChatProxy get(){
		return getProxy();
	}
}
