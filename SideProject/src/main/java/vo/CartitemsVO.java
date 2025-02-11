package vo;

public class CartitemsVO {

	private int cartitem_num,cartnum,productnum,quantity;
	private String productname;
	private int price;
	private String productimage_path;

	public String getProductimage_path() {
		return productimage_path;
	}

	public void setProductimage_path(String productimage_path) {
		this.productimage_path = productimage_path;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCartitem_num() {
		return cartitem_num;
	}

	public void setCartitem_num(int cartitem_num) {
		this.cartitem_num = cartitem_num;
	}

	public int getCartnum() {
		return cartnum;
	}

	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}

	public int getProductnum() {
		return productnum;
	}

	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
