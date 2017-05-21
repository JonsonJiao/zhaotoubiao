package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import vo.Message;
import vo.Product;
import dao.MessageProxy;
import dao.ProductProxy;

public class Delete {
	private int listIndex;
	private ProductProxy productProxy;
	private Product product;
	private MessageProxy messageProxy;
	private Message message;
	private String productName;
	private String own;
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOwn() {
		return own;
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
	public ProductProxy getProductProxy() {
		return productProxy;
	}
	public void setProductProxy(ProductProxy productProxy) {
		this.productProxy = productProxy;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public MessageProxy getMessageProxy() {
		return messageProxy;
	}
	public void setMessageProxy(MessageProxy messageProxy) {
		this.messageProxy = messageProxy;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public String delete(){
		boolean flag = false;
		product.setListIndex(listIndex);
		SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		String time= sdf.format(new Date());
		message.setTitle(productName+"已经删除");
		message.setTime(time);
		message.setType("商品");
		message.setText("尊敬的用户:亲爱的用户，您发布的"+productName+"已经删除");
		message.setOwn(own);
		message.setSee("false");
		try {
			flag = productProxy.delete(product);
			flag = messageProxy.create(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(flag){
			return "success";
		}
		return "input";
	}

}
