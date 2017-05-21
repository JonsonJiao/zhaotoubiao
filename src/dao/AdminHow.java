package dao;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Admin;


public class AdminHow extends HibernateDaoSupport implements AdminDao{

	@Override
	public Admin findById(String s) throws Exception {
		return getHibernateTemplate().get(Admin.class, s);
	}
}
