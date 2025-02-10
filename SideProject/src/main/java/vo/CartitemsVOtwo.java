package vo;

public class CartitemsVOtwo {

    private int productnum;
    private String memberid;

	 // 생성자
    public CartitemsVOtwo(int productnum, String memberid) {
        this.productnum = productnum;
        this.memberid = memberid;
    }

	public int getProductnum() {
		return productnum;
	}

	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	 
	 
}
