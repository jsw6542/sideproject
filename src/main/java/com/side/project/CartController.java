package com.side.project;

import java.util.List;

//import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartDAO;
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
	
	//장바구니 페이지
	/*
	 * @RequestMapping("/cartview.do") public String cartView(Model model,
	 * HttpServletRequest request) { String memberid = (String)
	 * request.getSession().getAttribute("login");
	 * 
	 * }
	 */

	
}
