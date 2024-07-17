package vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private MultipartFile productimage;
	
	private int productnum;
	private String productname,price,content,productimage_path,productregdate,productquantity;
	
	public MultipartFile getProductimage() {
		return productimage;
	}
	public void setProductimage(MultipartFile productimage) {
		this.productimage = productimage;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProductimage_path() {
		return productimage_path;
	}
	public void setProductimage_path(String productimage_path) {
		this.productimage_path = productimage_path;
	}
	public String getProductregdate() {
		return productregdate;
	}
	public void setProductregdate(String productregdate) {
		this.productregdate = productregdate;
	}
	public String getProductquantity() {
		return productquantity;
	}
	public void setProductquantity(String productquantity) {
		this.productquantity = productquantity;
	}
	
}
