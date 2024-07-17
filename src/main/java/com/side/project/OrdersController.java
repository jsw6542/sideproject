package com.side.project;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import dao.OrdersDAO;

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
}
