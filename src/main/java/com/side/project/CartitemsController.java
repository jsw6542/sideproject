package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartitemsDAO;

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
	
	//장바구니에 아이템 넣기
	@RequestMapping("/insertitems.do")
	public String insertitem() {
		
		
		return VIEW_PATH + "selectpw.jsp";
	}
	
}
