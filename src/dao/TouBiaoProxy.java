package dao;

import java.util.List;

import vo.TouBiao;

public class TouBiaoProxy {
	private TouBiaoHow touBiaoHow;
	
	public TouBiaoHow getTouBiaoHow() {
		return touBiaoHow;
	}

	public void setTouBiaoHow(TouBiaoHow touBiaoHow) {
		this.touBiaoHow = touBiaoHow;
	}

	
	public TouBiao getTouBiaoById(String id) {
		return touBiaoHow.getTouBiaoById(id);
	}

	
	public List<TouBiao> getTouBiaoByOwn(String id) {
		return touBiaoHow.getTouBiaoByOwn(id);
	}

	
	public void addTouBiaoById(TouBiao touBiao) {
		touBiaoHow.addTouBiaoById(touBiao);
	}

	
	public void updateTouBiaoById(TouBiao touBiao) {
		touBiaoHow.updateTouBiaoById(touBiao);
	}

	
	public void deleteTouBiaoById(TouBiao touBiao) {
		touBiaoHow.deleteTouBiaoById(touBiao);
		
	}
	
	public List<TouBiao> getTouBiaoByZhaoBiaoId(String id) {
		return touBiaoHow.getTouBiaoByZhaoBiaoId(id);
	}
}
