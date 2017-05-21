package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import dao.CreditProxy;
import dao.MessageProxy;
import dao.ZhaoBiaoProxy;
import vo.Credit;
import vo.Message;
import vo.ZhaoBiao;

public class ZhaoBiaoManage {
	private int id;
	private String userId;
	private String companyId;
	private int type;
	private String companyName;
	private String title;
	private String userName;
	private String phone;
	private String email;
	private String zhaoBiaoText;
	private int state;
	private ZhaoBiaoProxy zhaoBiaoProxy;
	private MessageProxy messageProxy;
	private CreditProxy creditProxy;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public CreditProxy getCreditProxy() {
		return creditProxy;
	}
	public void setCreditProxy(CreditProxy creditProxy) {
		this.creditProxy = creditProxy;
	}
	public ZhaoBiaoProxy getZhaoBiaoProxy() {
		return zhaoBiaoProxy;
	}
	public void setZhaoBiaoProxy(ZhaoBiaoProxy zhaoBiaoProxy) {
		this.zhaoBiaoProxy = zhaoBiaoProxy;
	}
	public MessageProxy getMessageProxy() {
		return messageProxy;
	}
	public void setMessageProxy(MessageProxy messageProxy) {
		this.messageProxy = messageProxy;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getZhaoBiaoText() {
		return zhaoBiaoText;
	}
	public void setZhaoBiaoText(String zhaoBiaoText) {
		this.zhaoBiaoText = zhaoBiaoText;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String addZhaoBiao(){
		ZhaoBiao zhaobiao = new ZhaoBiao();
		zhaobiao.setCompanyId(companyId);
		zhaobiao.setCompanyName(companyName);
		zhaobiao.setEmail(email);
		zhaobiao.setPhone(phone);
		zhaobiao.setState(1);
		zhaobiao.setTitle(title);
		zhaobiao.setCompanyType(type);
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time  = sdf.format(new Date());
		zhaobiao.setUpdateDate(time);
		zhaobiao.setUserName(userName);
		zhaobiao.setZhaoBiaoText(zhaoBiaoText);
		zhaoBiaoProxy.addZhaoBiaoById(zhaobiao);
		Credit credit = creditProxy.getCreditById(companyId);
		credit.setZhaoBiaoCount(credit.getZhaoBiaoCount()+1);
		creditProxy.updateCreditById(credit);
		Message message = new Message();
		message.setTitle("您的"+zhaobiao.getCompanyName()+"发布了招标信息");
		message.setTime(time);
		message.setType("招标信息");
		message.setText("您的"+zhaobiao.getCompanyName()+"发布了招标信息"+zhaobiao.getTitle());
		message.setOwn(userId);
		message.setSee("false");
		try {
			messageProxy.create(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public String changeZhaoBiao(){
		ZhaoBiao zhaoBiao = zhaoBiaoProxy.getZhaoBiaoById(id+"");
		zhaoBiao.setState(2);
		zhaoBiaoProxy.updateZhaoBiaoById(zhaoBiao);
		return "success";
	}
	
}
