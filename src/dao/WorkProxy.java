package dao;

import java.util.List;

import vo.Work;

public class WorkProxy {
	private WorkHow workHow;
	
	
	public WorkHow getWorkHow() {
		return workHow;
	}


	public void setWorkHow(WorkHow workHow) {
		this.workHow = workHow;
	}


	public Work getWorkById(String id) {
		return workHow.getWorkById(id);
	}

	
	public List<Work> getWorkByOwn(String id) {
		return workHow.getWorkByOwn(id);
	}

	
	public void addWorkById(Work work) {
		workHow.addWorkById(work);
		
	}

	
	public void updateWorkById(Work work) {
		workHow.updateWorkById(work);
		
	}

	
	public void deleteWorkById(Work work) {
		workHow.deleteWorkById(work);
	}
}
