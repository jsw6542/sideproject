package com.side.project;

import java.io.File;
import java.util.List;
import util.Common;
import util.Paging;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.ProductDAO;
import vo.ProductVO;
import vo.ProductVOtwo;

@Controller
public class ProductController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/product/";
	
	ProductDAO product_dao;
	
	public ProductController(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	// 홈페이지,초기화면
	@RequestMapping(value = { "/", "/home.do" })
	public String homePage(Model model,ProductVO vo) {
		List<ProductVO> recentlist = product_dao.selectrecentproduct(vo);
		model.addAttribute("recentlist", recentlist);
			
		return "/WEB-INF/views/home.jsp";
	}
	
	
	// 상품추가페이지 이동
	@RequestMapping("/productadd_form.do")
	public String productadd_form() {
		if(request.getSession().getAttribute("login") != null) {
			return VIEW_PATH + "add.jsp";
		}
		else {
			return "redirect:login_form.do";
		}
	}
	
	
	
	//상품추가 처리
	@RequestMapping("/productadd.do")
	public String productadd(ProductVO vo) {
		/*
		 * int insertresult = product_dao.insert(vo); if(insertresult == 0) {
		 * request.setAttribute("insertfail", "상품 추가에 실패하였습니다"); } else {
		 * request.setAttribute("insertsuccess", "상품을 추가하였습니다! "); } return VIEW_PATH +
		 * "add.jsp";
		 * ajax로 처리예정
		 */
		String webPath = "/resources/product_img/";
		String savePath = application.getRealPath(webPath);//절대경로
		
		System.out.println("절대 경로 : " + savePath);//잘들어갔는지 확인
	
		MultipartFile productimage = vo.getProductimage();
		String productimage_path = "no_file";
		
		//업로드 된 파일이 존재한다면
		/*
		 * if (productimage != null && !productimage.isEmpty()) {
		 * System.out.println("63번째에서 널값 발생"); }
		 */
		if (!productimage.isEmpty()) { //사진을 넣는다면
			productimage_path = productimage.getOriginalFilename();//업로드된 파일명을 가져옴
			
			//파일을 저장할 경로
			File saveFile = new File(savePath, productimage_path);
			//System.out.println("테스트1");
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 파일명 중복방지
				long time = System.currentTimeMillis();
				productimage_path = String.format("%d_%s", time, productimage_path);
				saveFile = new File(savePath, productimage_path);
			}

			try {
				//지정된 경로에 실제 파일을 물리적으로 복사
				productimage.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//System.out.println("테스트2");
		System.out.println(productimage_path);
		
		vo.setProductimage_path(productimage_path); //"resources/game_img/" + filename이였음
		
		//vo의 내용을 db로 전달
		product_dao.insert(vo);
		//System.out.println("테스트3");
		/*
		 * String result = "no"; if (res != 0) { result = "yes"; } 였음
		 */
		
		
		return "redirect:home.do"; // + "insertResult.jsp?res=" + result였음
		
	}
	
	
	 //상품 리스트 페이지 이동 아래 페이징처리로 수정예정
		/*
		 * @RequestMapping("/productlist.do") public String productlist(Model model) {
		 * List<ProductVO> productlist = product_dao.selectpagingAll();
		 * model.addAttribute("productlist", productlist); return VIEW_PATH +
		 * "list.jsp"; }
		 */
	 
	 //상품 목록 페이징처리
	 @RequestMapping("/productlist.do")
	 public String productlist(
	     @RequestParam(value = "page", defaultValue = "1") int page,
	     @RequestParam(value = "searchTitle", required = false) String searchTitle, Model model) {

	     int itemsPerPage = 8; // 한 페이지에 표시할 상품 수
	     int start = (page - 1) * itemsPerPage + 1; // 페이지의 시작 번호 계산
	     int end = start + itemsPerPage - 1; // 페이지의 끝 번호 계산

	     // 검색 조건이 있는지 확인
	     ProductVOtwo productVOtwo = new ProductVOtwo();
	     productVOtwo.setStart(start);
	     productVOtwo.setEnd(end);
	     
	     if (searchTitle != null && !searchTitle.isEmpty()) {
	         productVOtwo.setTitle(searchTitle); // 검색어가 있으면 설정
	     }

	     // 상품 목록 가져오기 (페이징 처리된 목록)
	     List<ProductVO> productlist = product_dao.pagingselect(productVOtwo);

	     // 전체 상품 수 가져오기
	     int row_total = product_dao.getrowtotal(productVOtwo);

	     // 페이지 메뉴 만들기
	     String pageMenu = Paging.getPaging("productlist.do", page, row_total, itemsPerPage, Common.ProductList.BLOCKPAGE);;

	     // Model 객체에 데이터를 추가
	     model.addAttribute("productlist", productlist);
	     model.addAttribute("pageMenu", pageMenu);

	     // JSP 페이지로 이동
	     return VIEW_PATH + "list.jsp";
	 }
	
	//상품 상세페이지
	@RequestMapping("/productdetail.do")
	public String productdetail(@RequestParam("productnum") int productnum, Model model ) {
		ProductVO productdetail = product_dao.selectdetail(productnum);
		model.addAttribute("product", productdetail);
	    return VIEW_PATH + "listdetail.jsp";
	}
	
	
	
	
}
