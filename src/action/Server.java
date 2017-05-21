package action;

import org.apache.struts2.ServletActionContext;


import vo.Chat;

import com.opensymphony.xwork2.ActionContext;

import dao.ChatProxy;

public class Server {
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
		ActionContext con = ActionContext.getContext();
		boolean flag = false;
        Chat chat =null;
		try {
			chat = chatProxy.findByUser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
        if(chat==null){
        	chat = new Chat();
        	chat.setUser(username);
        	chat.setText("");
        	con.getSession().put("username", username);
        	try {
				flag = chatProxy.add(chat);
			} catch (Exception e) {
				e.printStackTrace();
			}
        	if(flag){
        		return "success";
        	}
        }else{
        
        	String  text=  chat.getText();
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
         text += "<font color='red'>（用户）"+username+"</font>说："+content1 +"<br>";
         
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
	public String leave(){
		boolean flag = false;
		Chat chat = new Chat();
		chat.setUser(username);
		 try {
				flag = chatProxy.delete(chat);
			} catch (Exception e) {
				e.printStackTrace();
			}
	         if(flag){
	        	 return "success";
	         }
	         return "success";
		
	}
	
}
