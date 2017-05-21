package action;

import vo.User;





import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserProxy;
import factory.UserFactory;
/** Struts2的Action类 负责用户的登录和注册
 *
 */
public class Login extends ActionSupport{
	private String name;
	private String password;
	private String password2;
	private String email;
	private String userName;
	private int type;
	private UserProxy userProxy;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public UserProxy getUserProxy() {
		return userProxy;
	}
	public void setUserProxy(UserProxy userProxy) {
		this.userProxy = userProxy;
	}
	public String register(){
		User user = new User();
		boolean flag = false;
		user.setName(name);
		user.setPassword(password);
		user.setEmail(email);
		user.setType(type);
		user.setUsername(userName);
		user.setState(1);
		try {
			flag = UserFactory.get().doCreate(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ActionContext context = ActionContext.getContext();
		context.getSession().put("User", userName);
		if(flag){
			return "success";
		}
		return "success";
	}
	public String login(){
		ActionContext context = ActionContext.getContext();
		context.getSession().put("User", userName);
		return "success";
	}
	public String update(){
		User user = null;
		try {
			user = userProxy.findById(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		}
		user.setPassword(password);
		user.setName(name);
		user.setEmail(email);
		try {
			userProxy.update(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public void validateLogin(){
		boolean flag = false;
		User user = null;
		user= new User();
		user.setName(userName);
		user.setPassword(password); 
		try {
			if(userProxy.findById(userName)==null){
				addFieldError("name", "用户不存在，请重新输入");
			}else {
				flag = userProxy.check(user);
				if(!flag){
					addFieldError("password", "密码不正确，请重新输入");
				}else if(userProxy.findById(userName).getState()==2){
					addFieldError("name", "您的账号涉嫌违规，已被封禁");
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void validateRegister(){
		try {
			if(userProxy.findById(userName)!=null){
				addFieldError("name", "用户已存在，请重新输入");
			}else if(!(password.equals(password2))){
					addFieldError("password", "两次密码输入不一致");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void validateUpdate(){
		if(!password.equals(password2)){
			addFieldError("password", "两次密码输入不一致");
		}
	}
}
