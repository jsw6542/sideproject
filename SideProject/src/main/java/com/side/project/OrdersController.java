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
	
	/*
	 * @RequestMapping("/payments/complete")
	 * 
	 * @ResponseBody public String completePayment(@RequestParam("imp_uid") String
	 * impUid, HttpSession session) { // 1. 세션에서 로그인한 사용자 정보 가져오기 MemberVO loginUser
	 * = (MemberVO) session.getAttribute("login");
	 * 
	 * // 2. 결제가 성공적으로 완료되었는지 확인하는 로직 추가 (ex. 결제 API 사용) boolean isPaymentSuccessful
	 * = checkPayment(impUid); // 가정: 결제 확인 메서드
	 * 
	 * if (isPaymentSuccessful) { // 3. ORDERS 테이블에 새로운 주문 삽입 OrdersVO order = new
	 * OrdersVO(); order.setMemberid(loginUser.getMemberid());
	 * orders_dao.insertorder(order); // 주문 삽입
	 * 
	 * // 4. 방금 삽입된 주문 번호 가져오기 int orderNum = order.getOrdernum();
	 * 
	 * // 5. ORDER_DETAIL 테이블에 각 장바구니 상품을 삽입 List<CartitemsVO> cartItems =
	 * cartitems_dao.getCartItemsByMemberId(loginUser.getMemberid()); for
	 * (CartitemsVO cartItem : cartItems) { OrderDetailVO orderDetail = new
	 * OrderDetailVO(); orderDetail.setOrdernum(orderNum);
	 * orderDetail.setProductnum(cartItem.getProductnum());
	 * orderDetail.setQuantity(cartItem.getQuantity());
	 * orderDetail.setOrdername(loginUser.getMembername());
	 * orderDetail.setOrderphone(loginUser.getMember_phone());
	 * orderDetail.setOrder_adress1(loginUser.getAddress1());
	 * orderDetail.setOrder_adress2(loginUser.getAddress2());
	 * orderDetail.setOrder_adress3(loginUser.getAddress3());
	 * 
	 * orderdetail_dao.insertOrderDetail(orderDetail); // 주문 상세 정보 삽입 }
	 * 
	 * return "결제가 성공적으로 완료되었습니다."; } else { return "결제가 실패하였습니다."; } }
	 */
	
}
