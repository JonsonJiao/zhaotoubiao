package dao;

import java.util.List;

import vo.Message;

public class MessageProxy {
	private static int SIZE = 6;
	private MessageHow messageHow;
	
	public MessageHow getMessageHow() throws Exception{
		return messageHow;
	}

	public void setMessageHow(MessageHow messageHow) throws Exception{
		this.messageHow = messageHow;
	}

	public boolean create(Message message) throws Exception{
		boolean flag = false;
	    try {
			messageHow.create(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    flag  = true;
	    return flag ;
		
	}
	public List<Message> findNoSee(String s)throws Exception{
		List<Message> list = null;
		list = messageHow.findNoSee(s);
		return list;
	}
	public boolean delete(Message message)throws Exception{
		boolean flag = false;
		messageHow.delete(message);
		flag = true;
		return flag;
	}
	public List<Message> findByOwn(String s,int offset)throws Exception{
		List<Message> list = null;
		offset = (offset-1)*SIZE;
		list = messageHow.findByOwn(s, offset, SIZE);
		return list;
	}
	
	public Message findById(String s)throws Exception{
		Message message = null;
		message = messageHow.findById(s);
		if(message.getSee().equals("false")){
			message .setSee("true");
			messageHow.update(message);
		}
		return message;
		
	}
	public int NoSee(String s)throws Exception{
		int count =0;
		count = (int) messageHow.Nosee(s);
		return count;
	}
	
	public int count(String s)throws Exception{
		int count =0;
		count = (int) messageHow.count(s);
		return count;
	}
}
