package dao;

import java.util.List;

import vo.Credit;


public interface CreditDao {
	public Credit getCreditById(String id);
	public List<Credit> getCreditByOwn(String id);
	public void addCreditById(Credit credit);
	public void updateCreditById(Credit credit);
	public void deleteCreditById(Credit credit);
}
