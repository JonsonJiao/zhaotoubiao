package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Message;
import vo.ZhaoBiao;

public class ZhaoBiaoHow extends HibernateDaoSupport implements ZhaoBiaoDao{
	@Override
	public ZhaoBiao getZhaoBiaoById(String id) {
		return getHibernateTemplate().get(ZhaoBiao.class, new Integer(id));
	}

	@Override
	public List<ZhaoBiao> getZhaoBiaoByOwn(String id) {
		return (List<ZhaoBiao>) getHibernateTemplate().find("select zhaoBiao from ZhaoBiao as zhaoBiao where companyId=? order by updateDate", id);
	}

	@Override
	public void addZhaoBiaoById(ZhaoBiao zhaoBiao) {
		getHibernateTemplate().save(zhaoBiao);
	}

	@Override
	public void updateZhaoBiaoById(ZhaoBiao zhaoBiao) {
		getHibernateTemplate().update(zhaoBiao);
		
	}

	@Override
	public void deleteZhaoBiaoById(ZhaoBiao zhaoBiao) {
		getHibernateTemplate().delete(zhaoBiao);
		
	}

	@Override
	public Long countOfAll() {
		return (Long)getHibernateTemplate().find("select count(*) from ZhaoBiao as zhaoBiao where state=1").get(0);
	}

	@Override
	public List<ZhaoBiao> findAll(final int offset, final int size) {
		return (List<ZhaoBiao>) getHibernateTemplate( ).execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<ZhaoBiao> result = session.createQuery("select zhaoBiao from ZhaoBiao as zhaoBiao where state=1 order by updateDate desc")
						.setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}


}
