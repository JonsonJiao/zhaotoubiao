package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vo.Admin;
import dao.AdminProxy;

public class AdminLogin extends ActionSupport{
	private String name;
	private String password;
	private AdminProxy adminProxy;
	private Admin admin;
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
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
	public AdminProxy getAdminProxy() {
		return adminProxy;
	}
	public void setAdminProxy(AdminProxy adminProxy) {
		this.adminProxy = adminProxy;
	}
	public String login(){
		ActionContext context = ActionContext.getContext();
		context.getSession().put("Admin", name);
		return "success";
		
	}
	public void validateLogin(){
		boolean flag = false;
		admin.setName(name);
		admin.setPassword(password); 
		try {
			if(adminProxy.findById(name)==null){
				addFieldError("name", "用户不存在，请重新输入");
			}else {
				flag = adminProxy.check(admin);
				if(!flag){
					addFieldError("password", "密码不正确，请重新输入");
				}
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
}
