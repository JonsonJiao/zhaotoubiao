package action;

import org.apache.struts2.ServletActionContext;




import dao.ChatProxy;
import vo.Chat;



public class KServer {
	private String content1;
	private String username;
	private ChatProxy chatProxy;
	
	public ChatProxy getChatProxy() {
		return chatProxy;
	}
	public void setChatProxy(ChatProxy chatProxy) {
		this.chatProxy = chatProxy;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessages(){
        Chat chat =null;
		try {
			chat = chatProxy.findByUser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String  text= null;
		if(chat==null){
			text = "用户已经断开连接";
			ServletActionContext.getRequest().setAttribute("message", text);
		}else{
			text= chat.getText();
	    	ServletActionContext.getRequest().setAttribute("message", text);
		}
    	
        return "success";
	}
	public String sendMessages(){
		boolean flag = false;
        Chat chat =null;
		try {
			chat = chatProxy.findByUser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
         String text = chat.getText();
         text += "<font color='red'>（客服）</font>说："+content1 +"<br>";
         
         chat.setText(text);
         ServletActionContext.getRequest().setAttribute("message", text);
         try {
			flag = chatProxy.update(chat);
		} catch (Exception e) {
			e.printStackTrace();
		}
         if(flag){
        	 return "success";
         }
         return "success";
	}
}
