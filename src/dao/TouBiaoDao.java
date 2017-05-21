package dao;

import java.util.List;

import vo.TouBiao;

public interface TouBiaoDao {
	public List<TouBiao> getTouBiaoByZhaoBiaoId(String id);
	public TouBiao getTouBiaoById(String id);
	public List<TouBiao> getTouBiaoByOwn(String id);
	public void addTouBiaoById(TouBiao touBiao);
	public void updateTouBiaoById(TouBiao touBiao);
	public void deleteTouBiaoById(TouBiao touBiao);
}
