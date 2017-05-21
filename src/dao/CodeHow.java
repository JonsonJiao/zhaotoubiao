package dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import vo.Code;

public class CodeHow extends HibernateDaoSupport implements CodeDao{

	@Override
	public List<Code> getTextById(Code code) {
		return (List<Code>) getHibernateTemplate().find("select code from Code as code where type=?"
				+ " and id = ?",new String[]{code.getType(),code.getId()});
	}

}
