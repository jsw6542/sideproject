package vo;

import java.sql.Timestamp;
import java.util.List;

public class OrderListVO {
	private String buyername,buyeradress1,buyeradress3;
	private int ordernum,result;
	private Timestamp paymenttime;

	private List<OrderListItemVO> items;
	

	public List<OrderListItemVO> getItems() {
		return items;
	}
	public void setItems(List<OrderListItemVO> items) {
		this.items = items;
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
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
    
	
}
