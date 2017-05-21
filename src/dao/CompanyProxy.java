package dao;

import java.util.List;

import vo.Company;

public class CompanyProxy {
	private CompanyHow companyHow;
	private static int SIZE = 6;

	public CompanyHow getCompanyHow() {
		return companyHow;
	}

	public void setCompanyHow(CompanyHow companyHow) {
		this.companyHow = companyHow;
	}
	public Company getCompanyById(String id) {
		return companyHow.getCompanyById(id);
	}

	public List<Company> getCompanyByOwn(String id,int offset) {
		offset = (offset-1)*SIZE;
		return companyHow.getCompanyByOwn(id,offset,SIZE);
	}

	public void addCompanyById(Company company) {
		companyHow.addCompanyById(company);
	}

	public void updateCompanyById(Company company) {
		companyHow.updateCompanyById(company);
	}

	public void deleteCompanyById(Company company) {
		companyHow.deleteCompanyById(company);
	}
	
	public int countOfOwn(String own) {
		long count = companyHow.countOfOwn(own);
		return (int)count;
		
	}
	
	public List<Company> getCompanyByNoCheck() {
		return companyHow.getCompanyByNoCheck();
	}
	
	public List<Company> getCompanyByOwnofAll(String id) {
		return companyHow.getCompanyByOwnofAll(id);
	}
}
