package com.side.project;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.ProductDAO;
import vo.ProductVO;

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
			System.out.println("테스트1");
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
		System.out.println("테스트2");
		System.out.println(productimage_path);
		
		vo.setProductimage_path(productimage_path); //"resources/game_img/" + filename이였음
		
		//vo의 내용을 db로 전달
		product_dao.insert(vo);
		System.out.println("테스트3");
		/*
		 * String result = "no"; if (res != 0) { result = "yes"; } 였음
		 */
		
		
		return "redirect:home.do"; // + "insertResult.jsp?res=" + result였음
		
	}
	
	//상품 리스트 페이지 이동
	@RequestMapping("/productlist.do")
	public String productlist(Model model) {
		List<ProductVO> productlist = product_dao.selectAll();
		model.addAttribute("productlist", productlist);
		return VIEW_PATH + "list.jsp";
	}
}
