package com.side.project;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartitemsDAO;
import dao.OrdersDAO;
import vo.CartitemsVO;
import vo.MemberVO;
import vo.OrderDetailVO;
import vo.OrdersVO;

@Controller
public class OrdersController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/";
	
	public OrdersController(OrdersDAO orders_dao) {
		this.orders_dao = orders_dao;
	}
	
	
	 
	OrdersDAO orders_dao;
	CartitemsDAO cartitems_dao;
	OrderDetailVO orderdetail_dao;
	
}
