package vo;

public class Code {
	private int num;
	private String type;
	private String id;
	private String text;
	
	public Code() {
		super();
	}
	public Code(String type, String id) {
		super();
		this.type = type;
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}	
