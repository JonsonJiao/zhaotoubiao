package dao;

import java.util.List;

import vo.Company;

public interface CompanyDao {
	public Company getCompanyById(String id);
	public List<Company> getCompanyByOwn(final String id,final int offset,final int  size);
	public void addCompanyById(Company company);
	public void updateCompanyById(Company company);
	public void deleteCompanyById(Company company);
	public Long countOfOwn(String own);
	public List<Company> getCompanyByNoCheck();
	public List<Company> getCompanyByOwnofAll(String id);
}
