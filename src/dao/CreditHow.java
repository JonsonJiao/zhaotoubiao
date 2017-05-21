package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Company;
import vo.Credit;

public class CreditHow extends HibernateDaoSupport implements CreditDao{

	@Override
	public Credit getCreditById(String id) {
		return getHibernateTemplate().get(Credit.class, new Integer(id));
	}

	@Override
	public List<Credit> getCreditByOwn(String id) {
		return (List<Credit>) getHibernateTemplate().find("select credit from Credit as credit where pid=?", id);
	}

	@Override
	public void addCreditById(Credit credit) {
		getHibernateTemplate().save(credit);
	}

	@Override
	public void updateCreditById(Credit credit) {
		getHibernateTemplate().update(credit);
		
	}

	@Override
	public void deleteCreditById(Credit credit) {
		getHibernateTemplate().delete(credit);
		
	}

}
