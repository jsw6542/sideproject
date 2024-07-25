package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartitemsDAO;
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
	
	//장바구니 목록 가져오기
	@RequestMapping("/selectcartitemslist")
	public String selectcartitemslist(HttpSession session) {
		//cartvo에 있는 memberid로 장바구니를 가져와서 productnum을 가져온다.
		CartVO cart = (CartVO) session.getAttribute("cart");
		int cartnum = cart.getCartnum();
		
		//productnum으로 상품 정보를 가져와서 표시
		
		
		
		return VIEW_PATH + "cartlist";
	}
	
}
