package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import vo.Company;
import vo.Credit;
import vo.Message;
import dao.CompanyProxy;
import dao.CreditProxy;
import dao.MessageProxy;

public class CompanyManage {
	private String id;
	private String own;
	private String companyName;
	private String lianXiRen;
	private String position;
	private String address;
	private String phone;
	private String code;
	private String stateText;
	private int state;
	private CompanyProxy companyProxy;
	private MessageProxy messageProxy;
	private CreditProxy creditProxy;
	
	public CreditProxy getCreditProxy() {
		return creditProxy;
	}
	public void setCreditProxy(CreditProxy creditProxy) {
		this.creditProxy = creditProxy;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	public CompanyProxy getCompanyProxy() {
		return companyProxy;
	}
	public void setCompanyProxy(CompanyProxy companyProxy) {
		this.companyProxy = companyProxy;
	}
	public MessageProxy getMessageProxy() {
		return messageProxy;
	}
	public void setMessageProxy(MessageProxy messageProxy) {
		this.messageProxy = messageProxy;
	}
	public String getOwn() {
		return own;
	}
	public void setOwn(String own) {
		this.own = own;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getLianXiRen() {
		return lianXiRen;
	}
	public void setLianXiRen(String lianXiRen) {
		this.lianXiRen = lianXiRen;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStateText() {
		return stateText;
	}
	public void setStateText(String stateText) {
		this.stateText = stateText;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public String addCompany(){
		Company company = new Company();
		company.setAddress(address);
		company.setCode(code);
		company.setCompanyName(companyName);
		company.setState(1);
		company.setLianXiRen(lianXiRen);
		company.setOwn(own);
		company.setPosition(position);
		company.setPhone(phone);
		company.setStateText("尚未进行审核");
		companyProxy.addCompanyById(company);
		Credit credit = new Credit();
		credit.setType(1);
		credit.setId(new Integer(id));
		credit.setWorkCount(0);
		credit.setWorkquality(0);
		credit.setWorkTime(0);
		credit.setZhaoBiaoCount(0);
		creditProxy.addCreditById(credit);
		Message message = new Message();
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time  = sdf.format(new Date());
		message.setTitle(company.getCompanyName()+"添加成功,请等待审核");
		message.setTime(time);
		message.setType("公司信息");
		message.setText("您的公司"+company.getCompanyName()+"添加成功,我们将尽快为您审核,请耐心等待");
		message.setOwn(company.getOwn());
		message.setSee("false");
		try {
			messageProxy.create(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public String deleteCompany(){
		Company company = new Company();
		company.setId(new Integer(id));
		companyProxy.deleteCompanyById(company);
		Message message = new Message();
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time  = sdf.format(new Date());
		message.setTitle(company.getCompanyName()+"已被删除");
		message.setTime(time);
		message.setType("公司信息");
		message.setText("您的公司"+company.getCompanyName()+"已经成功删除");
		message.setOwn(company.getOwn());
		message.setSee("false");
		try {
			messageProxy.create(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	public String checkCompany(){
		Company company = companyProxy.getCompanyById(id);
		company.setState(state);
		company.setStateText(stateText);
		companyProxy.updateCompanyById(company);
		Message message = new Message();
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time  = sdf.format(new Date());
		message.setTitle(company.getCompanyName()+((state==2)?"审核成功":"审核被驳回"));
		message.setTime(time);
		message.setType("公司信息");
		message.setText("您的公司"+company.getCompanyName()+((state==2)?"审核成功":"审核被驳回")+",审核意见为:"+stateText);
		message.setOwn(company.getOwn());
		message.setSee("false");
		try {
			messageProxy.create(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
}
