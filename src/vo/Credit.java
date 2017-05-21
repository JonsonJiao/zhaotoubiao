package vo;

public class Credit {
	private int id;
	private int type;
	private int zhaoBiaoCount;
	private int workCount;
	private int workTime;
	private int workquality;
	
	public int getZhaoBiaoCount() {
		return zhaoBiaoCount;
	}
	public void setZhaoBiaoCount(int zhaoBiaoCount) {
		this.zhaoBiaoCount = zhaoBiaoCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getWorkCount() {
		return workCount;
	}
	public void setWorkCount(int workCount) {
		this.workCount = workCount;
	}
	public int getWorkTime() {
		return workTime;
	}
	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}
	public int getWorkquality() {
		return workquality;
	}
	public void setWorkquality(int workquality) {
		this.workquality = workquality;
	}
	
}
