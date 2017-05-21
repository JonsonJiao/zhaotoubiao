package dao;

import java.util.List;






import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Chat;

public class ChatHow extends HibernateDaoSupport implements ChatDao{

	@Override
	public String add(Chat chat) throws Exception {
		return (String) getHibernateTemplate().save(chat);
	}

	@Override
	public Chat findByUser(String s) throws Exception {
		return getHibernateTemplate().get(Chat.class, s);
	}

	@Override
	public void update(Chat chat) throws Exception {
		getHibernateTemplate().update(chat);
	}

	@Override
	public void delete(Chat chat) throws Exception {
		getHibernateTemplate().delete(chat);
	}
	@Override
	public List<Chat> findAll() throws Exception {
		return (List<Chat>) getHibernateTemplate().find("select chat from Chat as chat");
	}

}
