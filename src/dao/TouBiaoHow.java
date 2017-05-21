package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.TouBiao;

public class TouBiaoHow extends HibernateDaoSupport implements TouBiaoDao{

	@Override
	public TouBiao getTouBiaoById(String id) {
		return getHibernateTemplate().get(TouBiao.class, new Integer(id));
	}

	@Override
	public List<TouBiao> getTouBiaoByOwn(String id) {
		return (List<TouBiao>) getHibernateTemplate().find("select touBiao from TouBiao as touBiao where companyId=?", id);
	}

	@Override
	public void addTouBiaoById(TouBiao touBiao) {
		getHibernateTemplate().save(touBiao);
	}

	@Override
	public void updateTouBiaoById(TouBiao touBiao) {
		getHibernateTemplate().update(touBiao);
		
	}

	@Override
	public void deleteTouBiaoById(TouBiao touBiao) {
		getHibernateTemplate().delete(touBiao);
		
	}

	@Override
	public List<TouBiao> getTouBiaoByZhaoBiaoId(String id) {
		return (List<TouBiao>) getHibernateTemplate().find("select touBiao from TouBiao as touBiao where zhaoBiaoId=?", id);
	}

}
