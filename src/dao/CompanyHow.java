package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Company;
import vo.Message;
import vo.ZhaoBiao;

public class CompanyHow extends HibernateDaoSupport implements CompanyDao{

	@Override
	public Company getCompanyById(String id) {
		return getHibernateTemplate().get(Company.class, new Integer(id));
	}


	@Override
	public void addCompanyById(Company company) {
		getHibernateTemplate().save(company);
	}

	@Override
	public void updateCompanyById(Company company) {
		getHibernateTemplate().update(company);
		
	}



	@Override
	public void deleteCompanyById(Company company) {
		getHibernateTemplate().delete(company);
		
	}


	@Override
	public List<Company> getCompanyByOwn(String id, final int offset, final int size) {
		return (List<Company>) getHibernateTemplate( ).execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				List<ZhaoBiao> result = session.createQuery("select company from Company as company ")
						.setFirstResult(offset).setMaxResults(size).list();
				return result;
			}
		});
	}


	@Override
	public Long countOfOwn(String own) {
		return (Long)getHibernateTemplate().find("select count(*) from Company as company").get(0);
	}


	@Override
	public List<Company> getCompanyByNoCheck() {
		return (List<Company>) getHibernateTemplate().find("select company from Company as company where state=1");
	}


	@Override
	public List<Company> getCompanyByOwnofAll(String id) {
		return (List<Company>) getHibernateTemplate().find("select company from Company as company where own=?",id);
	}


}
