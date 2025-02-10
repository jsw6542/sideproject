package com.side.project;

import java.util.List;

//import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.CartitemsDAO;
import vo.CartitemsVO;
import vo.MemberVO;
import vo.CartVO;
import vo.ProductVO;

@Controller
public class CartController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;

	public static final String VIEW_PATH = "/WEB-INF/views/cart/";

	public CartController(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}

	CartDAO cart_dao;
	CartitemsDAO cartitems_dao;

	// 장바구니에 아이템 넣기
	@RequestMapping("/insertitems.do")
	public String insertitem(HttpSession session, @RequestParam int productnum, @RequestParam int quantity) {
		CartVO cart = (CartVO) session.getAttribute("cart");
		int cartnum = cart.getCartnum();

		CartitemsVO cartItem = new CartitemsVO();
		cartItem.setCartnum(cartnum);
		System.out.println("장바구니번호 : " + cartnum);
		cartItem.setProductnum(productnum);
		System.out.println("상품번호 : " + productnum);
		cartItem.setQuantity(quantity);
		System.out.println("수량 : " + quantity);

		cart_dao.insertitem(cartItem);

		return "redirect:/home.do"; // 새로고침 없이 적용하기
	}
	
	// 장바구니에 들어있는 상품 삭제
	@RequestMapping(value = "/cart/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCartItem(@RequestParam("productnum") int productnum, HttpSession session) {
	    JSONObject responseJson = new JSONObject(); // JSON 객체 생성
	    
	    try {
	        // 로그인 정보 가져오기
	        MemberVO login = (MemberVO) session.getAttribute("login");
	        
	        // 로그인 정보가 없으면 에러 응답
	        if (login == null) {
	            responseJson.put("status", "error");
	            responseJson.put("message", "로그인 정보가 없습니다.");
	            return responseJson.toString();
	        }
	        
	        // 장바구니 정보가 없으면 에러 응답
	        Integer cartnum = (Integer) session.getAttribute("cartnum");
	        if (cartnum == null) {
	            responseJson.put("status", "error");
	            responseJson.put("message", "장바구니 정보가 없습니다.");
	            return responseJson.toString();
	        }
	        
	        System.out.println("AJAX 장바구니 상품 삭제 요청: productnum = " + productnum);
	        
	        // 장바구니에서 상품 삭제
	        int result = cart_dao.deletecartitem(productnum, login.getMemberid());
	        
	        // 삭제 결과 확인 후 응답
	        if (result > 0) {
	            responseJson.put("status", "success");
	        } else {
	            responseJson.put("status", "error");
	            responseJson.put("message", "상품 삭제에 실패했습니다.");
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        responseJson.put("status", "error");
	        responseJson.put("message", "상품 삭제에 실패했습니다.");
	    }
	    
	    return responseJson.toString(); // JSON 응답 반환
	}

}
