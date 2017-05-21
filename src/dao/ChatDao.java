package dao;

import java.util.List;

import vo.Chat;

public interface ChatDao {
	public String add(Chat chat)throws Exception;
	public Chat findByUser(String s)throws Exception;
	public void update(Chat chat)throws Exception;
	public void delete(Chat chat)throws Exception;
	public List<Chat> findAll()throws Exception;
}	
