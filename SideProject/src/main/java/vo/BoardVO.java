package vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int boardidx,readhit,ref,step,depth;
	private String memberid,boardimage_path,title,content,del_info,productname,board_type;
	private Timestamp board_created_at,board_updated_at;
	
	
	public Timestamp getBoard_created_at() {
		return board_created_at;
	}

	public void setBoard_created_at(Timestamp board_created_at) {
		this.board_created_at = board_created_at;
	}

	public Timestamp getBoard_updated_at() {
		return board_updated_at;
	}

	public void setBoard_updated_at(Timestamp board_updated_at) {
		this.board_updated_at = board_updated_at;
	}

	private MultipartFile boardimage;

	public int getBoardidx() {
		return boardidx;
	}

	public void setBoardidx(int boardidx) {
		this.boardidx = boardidx;
	}

	public int getReadhit() {
		return readhit;
	}

	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getBoardimage_path() {
		return boardimage_path;
	}

	public void setBoardimage_path(String boardimage_path) {
		this.boardimage_path = boardimage_path;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDel_info() {
		return del_info;
	}

	public void setDel_info(String del_info) {
		this.del_info = del_info;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public MultipartFile getBoardimage() {
		return boardimage;
	}

	public void setBoardimage(MultipartFile boardimage) {
		this.boardimage = boardimage;
	}
	
	
}
