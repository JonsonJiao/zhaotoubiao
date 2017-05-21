package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Work;

public class WorkHow extends HibernateDaoSupport implements WorkDao{


	@Override
	public Work getWorkById(String id) {
		return getHibernateTemplate().get(Work.class, new Integer(id));
	}

	@Override
	public List<Work> getWorkByOwn(String id) {
		return (List<Work>) getHibernateTemplate().find("select work from Work as work where zhaoBiaoId=?", id);
	}

	@Override
	public void addWorkById(Work work) {
		getHibernateTemplate().save(work);
		
	}

	@Override
	public void updateWorkById(Work work) {
		getHibernateTemplate().update(work);
		
	}

	@Override
	public void deleteWorkById(Work work) {
		getHibernateTemplate().delete(work);
	}

}
