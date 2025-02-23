package com.side.project;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import dao.CartitemsDAO;
import dao.OrderDetailDAO;
import dao.OrdersDAO;
import vo.CartitemsVO;
import vo.MemberVO;
import vo.OrderDetailVO;
import vo.OrderListVO;
import vo.OrdersVO;
import vo.ProductVO;

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
	// OrderDetailDAO orderdetail_dao;
	CartitemsDAO cartitems_dao;

	/*
	 * @RequestMapping(value = "/complete", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public Map paymentComplete(@RequestParam("imp_uid") String
	 * impUid) { Map response = new HashMap();
	 * 
	 * try { // Iamport API를 통해 결제 정보 검증 (여기서는 단순 검증 로직, 실제 API 연동 필요) boolean
	 * isPaymentValid = checkPayment(impUid);
	 * 
	 * if (isPaymentValid) { // 결제 정보 저장 (예제 테이블 기준, orders 및 order_detail에 저장 가능)
	 * OrdersVO order = new OrdersVO(); order.setImpuid(impUid);
	 * order.setMemberId(getLoggedInMemberId()); // 세션에서 가져오기 // orderdate는 DB에서
	 * SYSDATE로 설정됨 order.setTotalPrice(getTotalPriceFromIamport(impUid)); // API를
	 * 통해 가져와야 함
	 * 
	 * orders_dao.insertpaymentorder(order);
	 * 
	 * response.put("status", "completed"); response.put("imp_uid", impUid);
	 * response.put("merchant_uid", order.getMerchantUid());
	 * response.put("paid_amount", order.getTotalPrice()); } else {
	 * response.put("status", "failed"); } } catch (Exception e) {
	 * response.put("error", e.getMessage()); } return response; }
	 */

	/*
	 * private static final String IMP_KEY = "6482105521256214"; // 아임포트 API 키
	 * private static final String IMP_SECRET =
	 * "YfQBhATjbUPAk4ncvzm6r3C89ZCHJ62CrdOQRRSQ5ynoKLWYMDuXNOWC0QM6va2n5YZxBb5f74WaBkaG";
	 * // 아임포트 API Secret
	 */

	@RequestMapping(value = "/orders/complete", method = RequestMethod.POST)
	@ResponseBody
	public String completePayment(@RequestParam("imp_uid") String impuid, HttpSession session, Model model) {
	    
	    try {
	        System.out.println("impuid 가져옴! : " + impuid);
	        
	        MemberVO login = (MemberVO) session.getAttribute("login"); // 로그인한 사용자 ID 가져오기
	        String accessToken = getAccessToken(); // 액세스 토큰 발급 메서드 호출
	        
	        System.out.println("Access Token: " + accessToken); // 액세스 토큰 출력

	        
	        OrdersVO orders = new OrdersVO();
	        orders.setImpuid(impuid);
	        System.out.println("impuid: " + impuid);
	        orders.setMemberid(login.getMemberid());
	        System.out.println("memberid: " + login.getMemberid());
	        
	        // 데이터베이스 처리 부분을 점검
	        orders_dao.paymentorder(orders);

	        
	        // 세션에서 사용자 정보와 관련된 주문 상세 정보를 가져옴
	        String orderName = login.getMembername();
	        String orderZipCode = login.getZip_code();
	        String orderAdress1 = login.getAddress1();
	        String orderAdress2 = login.getAddress2();
	        String orderAdress3 = login.getAddress3();
	        
	        // 장바구니 번호를 가져온 후 장바구니 번호로 장바구니 조회
	        int cartnum = orders_dao.getcartnum(login.getMemberid());
	        System.out.println("결제 후 장바구니 번호 조회 : " + cartnum);
	        
	        List<CartitemsVO> orderitems = orders_dao.selectorderitems(cartnum);
	        
	        if (orderitems == null || orderitems.isEmpty()) {
	            // 장바구니 아이템이 없는 경우 처리
	            model.addAttribute("errorMessage", "장바구니에 아이템이 없습니다.");
	            return "errorPage";
	        }
	        
	        
	        int ordernum = orders.getOrdernum();
	        System.out.println("ordernum = "+ ordernum);
	        // 주문 상세 정보를 DB에 삽입
	        
	        for (CartitemsVO item : orderitems) {
	            OrderDetailVO orderDetail = new OrderDetailVO();
	            
	            orderDetail.setOrdernum(orders.getOrdernum()); // 주문 번호
	            orderDetail.setProductnum(item.getProductnum()); // 상품 번호
	            orderDetail.setQuantity(item.getQuantity()); // 수량
	            orderDetail.setBuyername(orderName); // 주문자 이름
	            orderDetail.setBuyerzipcode(orderZipCode); // 우편번호
	            orderDetail.setBuyeradress1(orderAdress1); // 주소1
	            orderDetail.setBuyeradress2(orderAdress2); // 주소2
	            orderDetail.setBuyeradress3(orderAdress3); // 주소3
	            
	            // 주문 상세 정보를 DB에 삽입
	            orders_dao.insertorderdetail(orderDetail); // 주문 상세정보를 DB에 삽입
	        }
	        
	        return "결제 완료";
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 발생 시 로그를 출력
	        return "결제 처리 중 오류가 발생했습니다.";
	    }
	}

	// 액세스 토큰 발급 메서드
	private String getAccessToken() throws Exception {
		String url = "https://api.iamport.kr/users/getToken";
		String impKey = "6482105521256214"; // Iamport API Key
		String impSecret = "YfQBhATjbUPAk4ncvzm6r3C89ZCHJ62CrdOQRRSQ5ynoKLWYMDuXNOWC0QM6va2n5YZxBb5f74WaBkaG"; // Iamport
																												// API

		// 요청 파라미터 구성
		String payload = "{\"imp_key\": \"" + impKey + "\", \"imp_secret\": \"" + impSecret + "\"}";

		// HTTP 요청 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity entity = new HttpEntity(payload, headers);
		RestTemplate restTemplate = new RestTemplate();

		// 요청 실행
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

		// 액세스 토큰 추출
		String jsonResponse = response.getBody();
		String accessToken = extractAccessToken(jsonResponse);

		return accessToken;
	}

	// 응답에서 액세스 토큰 추출
	private String extractAccessToken(String jsonResponse) {
		JSONObject json = new JSONObject(jsonResponse);
		return json.getJSONObject("response").getString("access_token");
	}
	
	//주문목록 확인
	@RequestMapping("/orderlist.do")
	private String orderlist(Model model,String memberid,HttpSession session) {
		//주문목록 가져오기
		session.getAttribute(memberid);
		
		List<OrderListVO> orderlist = orders_dao.selectorderslist(memberid);
		
	    // 콘솔 출력 (디버깅용)
	    for (OrderListVO order : orderlist) {
	        System.out.println("주문번호: " + order.getOrdernum());
	        System.out.println("결제시간: " + order.getPaymenttime());
	        System.out.println("총 가격: " + order.getTotalprice());
	        System.out.println("구매자 이름: " + order.getBuyername());
	        System.out.println("주소1: " + order.getBuyeradress1());
	        System.out.println("주소3: " + order.getBuyeradress3());
	        System.out.println("구매 수량: " + order.getQuantity());
	        System.out.println("배송 상태: " + order.getResult());
	        System.out.println("상품 이름: " + order.getProductname());
	        System.out.println("------------------------------");
	    }
		model.addAttribute("orderlist", orderlist);
		
		//List<OrderDetailVO> orderdetail = orders_dao.selectorderdetaillist(memberid);
		
		//orders에서 가져오기
		//List<OrdersVO> orders = orders_dao.selectorderslist(memberid);
		
		//product에서 가져오기
		//List<ProductVO> product = orders_dao.selectproductlist(memberid);
		
		// ★★★★★★★★★★ 3개 말고 하나의 리스트로 쿼리의 join을 이용해 한번에 가져오기! vo를 생성해 필요한 데이터를 추가 vo이름은 OrderlistVO로 할것
		
		//model.addAttribute("orderdetail", orderdetail);
		//model.addAttribute("orders", orders);
		//model.addAttribute("product", product);
		
		return VIEW_PATH + "orderlist.jsp";
	}

}
