package dao;

import java.util.List;




import vo.User;


public interface UserDao {
	public String doCreate(User user)throws Exception;
	public User findById(String s)throws Exception;
	public void limit(User user)throws Exception;
	public void update(User user)throws Exception;
		/*
	public boolean delete(String s)throws Exception;
	public List<User> findAll () throws Exception;
	public boolean update(User user)throws Exception;
	*/
}