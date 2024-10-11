package com.side.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.CartitemsDAO;
import dao.ProductDAO;
import vo.CartVO;
import vo.CartitemsVO;
import vo.OrdersVO;


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
	ProductDAO product_dao;
	CartDAO cart_dao;
	
	//장바구니 목록 가져오기
	@RequestMapping("/cartlistview.do")
	public String selectcartitemslist(HttpSession session, Model model) {
	    // 세션에서 cart 객체를 가져오기
	    CartVO cart = (CartVO) session.getAttribute("cart");

	    // cart가 null인 경우와 memberid가 없는 경우 처리
	    if (cart == null || cart.getMemberid() == null) {
	        model.addAttribute("emptyCart", true); // 장바구니가 비어 있음을 알리는 플래그 설정
	        return "/WEB-INF/views/cart/cartview.jsp"; // 장바구니가 비었을 때 바로 JSP로 이동
	    }

	    // 장바구니 번호 가져오기
	    int cartnum = cart.getCartnum();
	    System.out.println("장바구니 목록 가져오기 cartnum = " + cartnum);

	    // 장바구니에 담긴 상품 가져오기
	    List<CartitemsVO> cartitems = cartitems_dao.selectcartitems(cartnum);

	    // 장바구니에 상품이 없으면 emptyCart 플래그 설정
	    if (cartitems == null || cartitems.isEmpty()) {
	        model.addAttribute("emptyCart", true); // 장바구니가 비었을 때
	    } else {
	        model.addAttribute("cartitems", cartitems); // 장바구니에 상품이 있을 때
	    }

	    return "/WEB-INF/views/cart/cartview.jsp";
	}
	
	//결제 후 db저장
	
	
}
