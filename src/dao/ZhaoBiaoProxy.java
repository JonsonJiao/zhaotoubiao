package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;

import vo.ZhaoBiao;

public class ZhaoBiaoProxy {
	public static int SIZE = 6;
	private ZhaoBiaoHow zhaoBiaoHow;
	
	
	public ZhaoBiaoHow getZhaoBiaoHow() {
		return zhaoBiaoHow;
	}


	public void setZhaoBiaoHow(ZhaoBiaoHow zhaoBiaoHow) {
		this.zhaoBiaoHow = zhaoBiaoHow;
	}


	public ZhaoBiao getZhaoBiaoById(String id) {
		return zhaoBiaoHow.getZhaoBiaoById(id);
	}

	
	public List<ZhaoBiao> getZhaoBiaoByOwn(String id) {
		return zhaoBiaoHow.getZhaoBiaoByOwn(id);
	}

	
	public void addZhaoBiaoById(ZhaoBiao zhaoBiao) {
		zhaoBiaoHow.addZhaoBiaoById(zhaoBiao);
	}

	
	public void updateZhaoBiaoById(ZhaoBiao zhaoBiao) {
		zhaoBiaoHow.updateZhaoBiaoById(zhaoBiao);
	}

	
	public void deleteZhaoBiaoById(ZhaoBiao zhaoBiao) {
		zhaoBiaoHow.deleteZhaoBiaoById(zhaoBiao);
	}
	
	public int countOfAll() {
		long count = zhaoBiaoHow.countOfAll();
		return (int)count;
	}

	public List<ZhaoBiao> findAll(int offset) {
		offset = (offset-1)*SIZE;
		return zhaoBiaoHow.findAll(offset, SIZE);
	}
}
