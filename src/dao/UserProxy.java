package dao;

import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import vo.User;

public class UserProxy {
	private UserHow userHow;
	
	public UserHow getUserHow() {
		return userHow;
	}
	public void setUserHow(UserHow userHow) {
		this.userHow = userHow;
	}
	public boolean doCreate(User user) {
		boolean flag = false;
			try {
				userHow.doCreate(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		flag = true;
		return flag;
	}
	public boolean check(User user)  {
		boolean flag = false;
		User u = null;
			try {
				u = userHow.findById(user.getName());
			} catch (Exception e) {
				e.printStackTrace();
			}
		if(u!=null&&u.getPassword().equals(user.getPassword())){
			flag =true;
		}
		return flag;
	}
	
	public User findById(String s) throws Exception {
		User user = null;
		try {
			user = userHow.findById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
		}
		
		return user;
	}
	public void limit(String name,int type)throws Exception{
		User user = findById(name);
		user.setState(type);
		userHow.limit(user);
	}
	public void update(User user)throws Exception{
		userHow.update(user);
	}
	/*
	

	@Override
	public boolean delete(String s) {
		boolean flag = false;
		try {
			flag = userHow.delete(s);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dataBase.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	@Override
	public List<User> findAll() throws Exception {
		List<User> list = new ArrayList<User>();
		try {
			list = userHow.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dataBase.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	@Override
	public boolean findById(String s) throws Exception {
		boolean flag= false;
		User user = null;
		try {
			flag = userHow.findById(s);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dataBase.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public boolean update(User user) throws Exception {
		boolean flag = false;
		try {
			flag = userHow.update(user);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dataBase.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	*/
}