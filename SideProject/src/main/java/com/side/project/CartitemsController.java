package com.side.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartitemsDAO;
import dao.ProductDAO;
import vo.CartVO;
import vo.CartitemsVO;


@Controller
public class CartitemsController {
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/cartitems/";
	
	public CartitemsController(CartitemsDAO cartitems_dao) {
		this.cartitems_dao = cartitems_dao;	
	}
	
	CartitemsDAO cartitems_dao;
	ProductDAO product_dao;
	
	//장바구니 목록 가져오기
	@RequestMapping("/cartlistview.do")
	public String selectcartitemslist(HttpSession session,Model model) {
		//cartvo에 있는 memberid로 장바구니를 가져와서 productnum을 가져온다.
		CartVO cart = (CartVO) session.getAttribute("cart");
		
		
		
		int cartnum = cart.getCartnum();
		System.out.println("장바구니 목록 가져오기 cartnum = "+cartnum);
		
			
		
		//cartitems에 있는 cartnum으로 장바구니에 담은 상품번호 가져오기
		//productnum으로 상품 정보를 가져와서 표시
		List<CartitemsVO> cartitems = cartitems_dao.selectcartitems(cartnum); 
		
		model.addAttribute("cartitems", cartitems);
				
		return "/WEB-INF/views/cart/cartview.jsp";
	}
	
}
