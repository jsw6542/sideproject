package vo;

public class CartitemsVOtwo {

    private int productnum;
    private int cartnum;

	 // 생성자
    public CartitemsVOtwo(int productnum, int cartnum) {
        this.productnum = productnum;
        this.cartnum = cartnum;
    }

	public int getProductnum() {
		return productnum;
	}

	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}

	public int getCartnum() {
		return cartnum;
	}

	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}


	 
	 
}
