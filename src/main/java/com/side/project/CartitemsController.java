package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CartitemsDAO;
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
	
	
	
}
