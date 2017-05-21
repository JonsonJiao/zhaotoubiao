package dao;

import java.util.List;

import vo.Message;

public interface MessageDao {
	public List<Message> findByOwn(String s,int offset,int size)throws Exception;
	public Message findById(String s)throws Exception;
	public void update(Message message)throws Exception;
	public void create(Message message)throws Exception;
	public void delete(Message message)throws Exception;
	public List<Message> findNoSee(String s)throws Exception;
	public long Nosee(String s)throws Exception;
	public long count(String s)throws Exception;
}
