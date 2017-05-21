package dao;


import java.util.List;

import vo.Code;

public class CodeProxy {
	private CodeHow codeHow;
	
	public CodeHow getCodeHow() {
		return codeHow;
	}

	public void setCodeHow(CodeHow codeHow) {
		this.codeHow = codeHow;
	}

	public String GetTextById(Code code){
		List<Code> list = codeHow.getTextById(code);
		return list.get(0)==null?" ":list.get(0).getText();
	}
}
