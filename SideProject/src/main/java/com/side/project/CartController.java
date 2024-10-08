package com.side.project;

import java.util.List;

//import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.CartitemsDAO;
import vo.CartitemsVO;
import vo.CartVO;
import vo.ProductVO;

@Controller
public class CartController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/cart/";
	
	public CartController(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	 
	CartDAO cart_dao;
	CartitemsDAO cartitems_dao;
	
	//장바구니에 아이템 넣기
	@RequestMapping("/insertitems.do")
	public String insertitem(HttpSession session,@RequestParam int productnum, @RequestParam int quantity) {
		CartVO cart = (CartVO) session.getAttribute("cart");
		int cartnum = cart.getCartnum();
		
		CartitemsVO cartItem = new CartitemsVO();
		cartItem.setCartnum(cartnum);
		System.out.println("장바구니번호 : "+cartnum);
		cartItem.setProductnum(productnum);
		System.out.println("상품번호 : "+productnum);
		cartItem.setQuantity(quantity);
		System.out.println("수량 : "+ quantity);
		
		cart_dao.insertitem(cartItem);
		
		return "redirect:/home.do"; //새로고침 없이 적용하기
	}
	
	//장바구니에 상품이 있는지 확인
	//@RequestMapping("/checkcart.do")
	/*@ResponseBody
	public String checkcart(@RequestParam String memberid) {
		int checkcart = cart_dao.checkcart(memberid);
		
		if(checkcart == 0) {
			return "no";
		} else {
			return "yes";
		}
	}*/
	
}
