package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.OrderDetailDAO;

public class OrderDetailController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/";
	
	public OrderDetailController(OrderDetailDAO orderdetail_dao) {
		this.orderdetail_dao =  orderdetail_dao;
	}
	
	OrderDetailDAO orderdetail_dao;
	
	//상세주문 페이지 이동
	@RequestMapping("/orderdetail_form.do")
	public String orderdetail_form() {
		return VIEW_PATH + "orderdetail.jsp";
	}
	
	
	
}
