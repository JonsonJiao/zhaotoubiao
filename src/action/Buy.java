package action;

import java.text.SimpleDateFormat;
import java.util.Date;









import com.opensymphony.xwork2.ActionSupport;

import dao.BuyOrderProxy;
import dao.MessageProxy;
import dao.ProductProxy;
import dao.SellOrderProxy;
import vo.BuyOrder;
import vo.Message;
import vo.Product;
import vo.SellOrder;

public class Buy extends ActionSupport{
	private String nowUser;
	private String own;
	private int listIndex;
	private String time;
	private int state;
	private String productListIndex;
	private MessageProxy messageProxy;
	private Message message;
	private Message messageBuy;
	
	public Message getMessageBuy() {
		return messageBuy;
	}
	public void setMessageBuy(Message messageBuy) {
		this.messageBuy = messageBuy;
	}
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
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public SellOrderProxy getSellOrderProxy() {
		return sellOrderProxy;
	}
	public void setSellOrderProxy(SellOrderProxy sellOrderProxy) {
		this.sellOrderProxy = sellOrderProxy;
	}
	public BuyOrderProxy getBuyOrderProxy() {
		return buyOrderProxy;
	}
	public void setBuyOrderProxy(BuyOrderProxy buyOrderProxy) {
		this.buyOrderProxy = buyOrderProxy;
	}
	public ProductProxy getProductProxy() {
		return productProxy;
	}
	public void setProductProxy(ProductProxy productProxy) {
		this.productProxy = productProxy;
	}
	public String getNowUser() {
		return nowUser;
	}
	public void setNowUser(String nowUser) {
		this.nowUser = nowUser;
	}
	public String getOwn() {
		return own;
	}
	
	public String getProductListIndex() {
		return productListIndex;
	}
	public void setProductListIndex(String productListIndex) {
		this.productListIndex = productListIndex;
	}
	public void setOwn(String own) {
		this.own = own;
	}
	public int getListIndex() {
		return listIndex;
	}
	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String buy(){
		boolean flag = false;
		Product product = null;
		try {
			product = productProxy.findById(productListIndex);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		SellOrder sellOrder = new SellOrder();
		sellOrder.setGame(product.getGame());
		sellOrder.setInformation(product.getInformation());
		sellOrder.setLevel(product.getLevel());
		sellOrder.setOrderName("<出售>"+product.getProductName());
		sellOrder.setOwn(product.getOwn());
		sellOrder.setPrice(product.getPrice());
		sellOrder.setSellNumber(product.getSellNumber()+1);
		sellOrder.setProductListIndex(productListIndex);
		//sellOrder.setState(state);
		sellOrder.setSystem(product.getSystem());
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		time= sdf.format(new Date());
		message.setTitle(product.getProductName()+"已经售出");
		message.setTime(time);
		message.setType("交易");
		message.setText("尊敬的用户:亲爱的用户，您发布的"+product.getProductName()+"已经售出");
		message.setOwn(product.getOwn());
		message.setSee("false");
		try {
			messageProxy.create(message);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		BuyOrder buyOrder = new BuyOrder();
		buyOrder.setGame(product.getGame());
		buyOrder.setPassword(product.getPassword());
		buyOrder.setProductListIndex(productListIndex);
		buyOrder.setAccount(product.getAccount());
		buyOrder.setInformation(product.getInformation());
		buyOrder.setLevel(product.getLevel());
		buyOrder.setOrderName("<购买>"+product.getProductName());
		buyOrder.setOwn(nowUser);
		buyOrder.setPrice(product.getPrice());
		buyOrder.setSellNumber(product.getSellNumber()+1);
		//buyOrder.setState(state);
		buyOrder.setSystem(product.getSystem());
		buyOrder.setTime(time);
		sellOrder.setTime(time);
		messageBuy.setTitle(product.getProductName()+"已购买");
		messageBuy.setTime(time);
		messageBuy.setType("交易");
		messageBuy.setText("尊敬的用户:亲爱的用户，您已购买"+product.getProductName()+"商品信息如下:   用户名:"+product.getAccount()+"密码:"+product.getPassword());
		messageBuy.setOwn(nowUser);
		messageBuy.setSee("false");
		
		try {
			messageProxy.create(messageBuy);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			flag =buyOrderProxy.doCreate(buyOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!flag){
			return "fail";
		}
		try {
			flag = sellOrderProxy.doCreate(sellOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(!flag){
			return "fail";
		}
		product.setRemaining(product.getRemaining()-1);
		product.setSellNumber(product.getSellNumber()+1);
		try {
			flag = productProxy.update(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
		
	}
	
	public void validateBuy(){
		Product product = null;
		try {
			product = productProxy.findById(productListIndex);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(product.getOwn().equals(nowUser)){
			addFieldError("product", "你不能购买自己的商品");
		}else if(product.getRemaining()<=0){
			addFieldError("product", "商品已经售完");
		}
	}
}
