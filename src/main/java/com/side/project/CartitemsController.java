package com.side.project;

import dao.CartitemsDAO;

public class CartitemsController {
	
	public CartitemsController(CartitemsDAO cartitems_dao) {
		this.cartitems_dao = cartitems_dao;	
	}
	
	CartitemsDAO cartitems_dao;
}
