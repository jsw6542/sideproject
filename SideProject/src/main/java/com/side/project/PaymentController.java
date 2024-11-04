package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.CartDAO;
import dao.OrdersDAO;

@Controller
public class PaymentController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/orderdetail/";
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	CartDAO cart_dao;
	OrdersDAO orders_dao;
	
	
	
	
	@RequestMapping("payment.do")
	public String payment() {
		return VIEW_PATH + "payment.jsp";
	}
	
}
