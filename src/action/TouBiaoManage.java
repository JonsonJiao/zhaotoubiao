package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import vo.TouBiao;
import dao.CreditProxy;
import dao.MessageProxy;
import dao.TouBiaoProxy;

public class TouBiaoManage {
	private String zhaoBiaoId;
	private String companyId;
	private int workTime;
	private int money;
	private TouBiaoProxy touBiaoProxy;
	private MessageProxy messageProxy;
	private CreditProxy creditProxy;
	
	public MessageProxy getMessageProxy() {
		return messageProxy;
	}
	public void setMessageProxy(MessageProxy messageProxy) {
		this.messageProxy = messageProxy;
	}
	public CreditProxy getCreditProxy() {
		return creditProxy;
	}
	public void setCreditProxy(CreditProxy creditProxy) {
		this.creditProxy = creditProxy;
	}
	public String getZhaoBiaoId() {
		return zhaoBiaoId;
	}
	public void setZhaoBiaoId(String zhaoBiaoId) {
		this.zhaoBiaoId = zhaoBiaoId;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public int getWorkTime() {
		return workTime;
	}
	public void setWorkTime(int workTime) {
		this.workTime = workTime;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public TouBiaoProxy getTouBiaoProxy() {
		return touBiaoProxy;
	}
	public void setTouBiaoProxy(TouBiaoProxy touBiaoProxy) {
		this.touBiaoProxy = touBiaoProxy;
	}
	public String touBiao(){
		TouBiao toubiao = new TouBiao();
		toubiao.setCompanyId(companyId);
		toubiao.setMoney(money);
		toubiao.setWorkTime(workTime);
		toubiao.setZhaoBiaoId(zhaoBiaoId);
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time  = sdf.format(new Date());
		toubiao.setUpdateDate(time);
		touBiaoProxy.addTouBiaoById(toubiao);
		return "success";
	}
}
