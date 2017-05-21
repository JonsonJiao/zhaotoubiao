package dao;

import java.util.List;

import vo.Work;

public interface WorkDao {
	public Work getWorkById(String id);
	public List<Work> getWorkByOwn(String id);
	public void addWorkById(Work work);
	public void updateWorkById(Work work);
	public void deleteWorkById(Work work);
}
