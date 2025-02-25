package vo;

public class OrderListItemVO {

	private String productname, productimage_path;
	private int quantity, totalprice;
	
	
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProductimage_path() {
		return productimage_path;
	}
	public void setProductimage_path(String productimage_path) {
		this.productimage_path = productimage_path;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
