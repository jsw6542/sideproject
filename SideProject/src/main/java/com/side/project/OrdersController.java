package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.OrdersDAO;
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
	
	//결제기능 구현 페이지 이동
	
}
