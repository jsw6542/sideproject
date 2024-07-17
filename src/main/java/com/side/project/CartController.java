package com.side.project;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDAO;
import vo.CartVO;

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
	
	//장바구니 페이지 이동
	@RequestMapping("/cart_form.do")
	public String cart_form(CartVO vo) {
		List<CartVO> list = cart_dao.select(vo);
		request.setAttribute("cartlist", list);
		return VIEW_PATH + "cart.jsp";
	}
	
	//장바구니 
	
}
