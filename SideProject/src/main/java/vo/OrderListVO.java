package vo;

import java.sql.Timestamp;

public class OrderListVO {
	private String buyername,productname,buyeradress1,buyeradress3;
	private int ordernum,quantity,result,totalprice;
	private Timestamp paymenttime;
	
	
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public Timestamp getPaymenttime() {
		return paymenttime;
	}
	public void setPaymenttime(Timestamp paymenttime) {
		this.paymenttime = paymenttime;
	}
	public String getBuyername() {
		return buyername;
	}
	public void setBuyername(String buyername) {
		this.buyername = buyername;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getBuyeradress1() {
		return buyeradress1;
	}
	public void setBuyeradress1(String buyeradress1) {
		this.buyeradress1 = buyeradress1;
	}
	public String getBuyeradress3() {
		return buyeradress3;
	}
	public void setBuyeradress3(String buyeradress3) {
		this.buyeradress3 = buyeradress3;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
    
	
}
