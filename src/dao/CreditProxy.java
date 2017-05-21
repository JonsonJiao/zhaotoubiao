package dao;

import java.util.List;

import vo.Credit;

public class CreditProxy {
	private CreditHow creditHow;
	
	public CreditHow getCreditHow() {
		return creditHow;
	}

	public void setCreditHow(CreditHow creditHow) {
		this.creditHow = creditHow;
	}

	public Credit getCreditById(String id) {
		return creditHow.getCreditById(id);
	}

	public List<Credit> getCreditByOwn(String id) {
		return creditHow.getCreditByOwn(id);
	}
	
	public void addCreditById(Credit credit) {
		creditHow.addCreditById(credit);
	}

	public void updateCreditById(Credit credit) {
		creditHow.updateCreditById(credit);
		
	}

	public void deleteCreditById(Credit credit) {
		creditHow.deleteCreditById(credit);
		
	}
}	
