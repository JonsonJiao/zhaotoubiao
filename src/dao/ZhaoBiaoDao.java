package dao;

import java.util.List;

import vo.ZhaoBiao;

public interface ZhaoBiaoDao {
	public ZhaoBiao getZhaoBiaoById(String id);
	public List<ZhaoBiao> getZhaoBiaoByOwn(String id);
	public void addZhaoBiaoById(ZhaoBiao zhaoBiao);
	public void updateZhaoBiaoById(ZhaoBiao zhaoBiao);
	public void deleteZhaoBiaoById(ZhaoBiao zhaoBiao);
	public Long countOfAll();
	public List<ZhaoBiao> findAll(final int offset, final int size);
}
