package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Message;

public class MessageHow extends HibernateDaoSupport implements MessageDao{

	@Override
	public List<Message> findByOwn(final String s,final int offset, final int size) throws Exception {
		return (List<Message>) getHibernateTemplate( ).execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
			List<Message> result = session.createQuery("select message from Message as message where own=? order by time desc")
						.setParameter(0, s).setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}

	@Override
	public void create(Message message) throws Exception {
		getHibernateTemplate().save(message);
	}

	@Override
	public void delete(Message message) throws Exception {
		getHibernateTemplate().delete(message);
		
	}
	@Override
	public List<Message> findNoSee(String s) throws Exception {
		return (List<Message>) getHibernateTemplate().find("select message from Message as message where own=?"
				+ " and see = false", s);
	}
	@Override
	public Message findById(String s) throws Exception {
		return getHibernateTemplate().get(Message.class, new Integer(s));
	}
	@Override
	public void update(Message message) throws Exception {
		getHibernateTemplate().update(message);
	}
	@Override
	public long Nosee(String s) throws Exception {
		return (Long)getHibernateTemplate().find("select count(*) from Message as message where see = 'false'"
				+ "and own =?",s).get(0);
	}
	
	@Override
	public long count(String s) throws Exception {
		return (Long)getHibernateTemplate().find("select count(*) from Message as message where own =?",s).get(0);
	}
}
