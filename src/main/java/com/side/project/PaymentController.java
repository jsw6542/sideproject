package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dao.CartDAO;
import dao.OrdersDAO;

@Controller
public class PaymentController {
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	CartDAO cart_dao;
	OrdersDAO orders_dao;
	
	//실제 결제를 구현할 수 있는지 판단해야함
	
	
	//장바구니에 있는 상품 가져오기
	
	//
	
}
