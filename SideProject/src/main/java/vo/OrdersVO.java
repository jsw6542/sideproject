package vo;

import java.sql.Timestamp;
import java.util.Date;

public class OrdersVO {
	
	private int ordernum;
	private String memberid;
	private Date orderdate;
	private String impuid;
	private int totalprice;  
	private Timestamp paymenttime; 
	
    
	
	public Timestamp getPaymenttime() {
		return paymenttime;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public void setPaymenttime(Timestamp paymenttime) {
		this.paymenttime = paymenttime;
	}
	public String getImpuid() {
		return impuid;
	}
	public void setImpuid(String impuid) {
		this.impuid = impuid;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	
	
	
}
