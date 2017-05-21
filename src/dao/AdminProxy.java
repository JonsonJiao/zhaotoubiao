package dao;

import vo.Admin;
import vo.User;

public class AdminProxy {
	private AdminHow adminHow ;
	
	public AdminHow getAdminHow() {
		return adminHow;
	}

	public void setAdminHow(AdminHow adminHow) {
		this.adminHow = adminHow;
	}

	public boolean check(Admin admin) throws Exception {
		boolean flag = false;
		Admin u = null;
			try {
				u = adminHow.findById(admin.getName());
			} catch (Exception e) {
				e.printStackTrace();
			}
		if(u!=null&&u.getPassword().equals(admin.getPassword())){
			flag =true;
		}
		return flag;
	}
	
	public Admin findById(String s) throws Exception {
		Admin admin = null;
		try {
			admin = adminHow.findById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		}
		
		return admin;
	}
}
