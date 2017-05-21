package action;

import vo.Message;
import dao.MessageProxy;

public class Messages {
	private int listIndex;
	private MessageProxy messageProxy;
	private Message message;
	
	public MessageProxy getMessageProxy() {
		return messageProxy;
	}
	public void setMessageProxy(MessageProxy messageProxy) {
		this.messageProxy = messageProxy;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public int getListIndex() {
		return listIndex;
	}
	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}
	public String delete(){
		boolean flag = false;
		message.setListIndex(listIndex);
		try {
			flag = messageProxy.delete(message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(flag){
			return "success";
		}
		return "success";
	}
}
