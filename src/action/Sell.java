package action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;







import com.opensymphony.xwork2.ActionSupport;

import dao.MessageProxy;
import dao.ProductProxy;
import vo.Message;
import vo.Product;

public class Sell extends ActionSupport{
	private String productName;
	private String game;
	private int level;
	private int price;
	private String information;
	private String account;
	private String password;
	private String system;
	private String own;
	private int listIndex;
	private int remaining;
	private MessageProxy messageProxy;
	private Message message;
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public MessageProxy getMessageProxy() {
		return messageProxy;
	}
	public void setMessageProxy(MessageProxy messageProxy) {
		this.messageProxy = messageProxy;
	}
	public int getRemaining() {
		return remaining;
	}
	public void setRemaining(int remaining) {
		this.remaining = remaining;
	}
	
	public int getListIndex() {
		return listIndex;
	}
	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}
	public String getOwn() {
		return own;
	}
	public void setOwn(String own) {
		this.own = own;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	
	public String sell(){
		boolean flag = false;
		product.setSystem(system);
		product.setAccount(account);
		product.setGame(game);
		product.setInformation(information);
		product.setLevel(level);
		product.setPassword(password);
		product.setPrice(price);		
		product.setProductName(productName);
		product.setOwn(own);
		product.setRemaining(1);
		product.setSellNumber(0);
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time= sdf.format(new Date());
		message.setTitle(productName+"已经上架");
		message.setTime(time);
		message.setType("商品");
		message.setText("尊敬的用户:亲爱的用户，您发布的"+productName+"已经上架");
		message.setSee("false");
		message.setOwn(own);
		try {
			flag = messageProxy.create(message);
			flag = productProxy.add(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(flag){
			return "success";
		}
		return "sell";
	}
	public String update(){
		boolean flag = false;
		try {
			product = productProxy.findById(listIndex+"");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		product.setSystem(system);
		product.setAccount(account);
		product.setGame(game);
		product.setInformation(information);
		product.setLevel(level);
		product.setPassword(password);
		product.setPrice(price);		
		product.setProductName(productName);
		product.setOwn(own);
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time= sdf.format(new Date());
		message.setTitle(productName+"已经修改");
		message.setTime(time);
		message.setType("商品");
		message.setText("尊敬的用户:亲爱的用户，您发布的"+productName+"已经修改");
		message.setOwn(own);
		message.setSee("false");
		try {
			flag = messageProxy.create(message);
			flag = productProxy.update(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(flag){
			return "success";
		}
		return "sell";
	}
	public void validateSell(){
		Pattern p = Pattern.compile("敏感词");
		if(p.matcher(information).find()){
			addFieldError("information", "描述包含敏感词，请重新输入");
		}else if(productProxy.findByAccount(account).size()!=0){
			addFieldError("account", "该账号正在出售");
		}else if(price<=0){
			addFieldError("price", "价格必须大于等于0元");
		}else if(level<=0){
			addFieldError("level", "等级必须大于等于0");
		}
		
	}
}
