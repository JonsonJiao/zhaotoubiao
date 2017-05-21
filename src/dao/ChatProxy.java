package dao;

import java.util.List;

import vo.Chat;

public class ChatProxy {
	private ChatHow chatHow;
	

	public ChatHow getChatHow() {
		return chatHow;
	}

	public void setChatHow(ChatHow chatHow) {
		this.chatHow = chatHow;
	}

	public boolean add(Chat chat) throws Exception {
		boolean flag = false;
		try {
			 chatHow.add(chat);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
	}

	public Chat findByUser(String s) throws Exception {
		Chat chat = null;
		try{
			chat = chatHow.findByUser(s);
		}catch (Exception e){
			
		}
		return chat;
	}

	public boolean update(Chat chat) throws Exception {
		boolean flag = false;
		try {
			chatHow.update(chat);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
	}

	public boolean delete(Chat chat) throws Exception {
		boolean flag = false;
		try {
			chatHow.delete(chat);
		} catch (Exception e) {
			
		}
		flag = true;
		return flag;
	}
	public List<Chat> findAll() throws Exception {
		List<Chat> list =null;
		try{
			list = chatHow.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
