package dao;

import vo.Admin;

public interface AdminDao {
	public Admin findById(String s)throws Exception;
}
