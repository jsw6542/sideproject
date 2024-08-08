<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 확인 페이지</title>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<script>
	
	function requestPay() {
		IMP.init("imp00468062");
		
		IMP.request_pay(
				  {
				    pg: "kakaopay.TC0ONETIME",
				    pay_method: "card",
				    merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
				    name: "노르웨이 회전 의자",
				    amount: 64900,
				    buyer_email: "gildong@gmail.com", 
				    buyer_name: "홍길동",
				    buyer_tel: "010-4242-4242",
				    buyer_addr: "서울특별시 강남구 신사동",
				    buyer_postcode: "01181",
				  },
				  function(rsp) {
					    if ( rsp.success ) {
					    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					    	jQuery.ajax({
					    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
					    		type: 'POST',
					    		dataType: 'json',
					    		data: {
						    		imp_uid : rsp.imp_uid
						    		//기타 필요한 데이터가 있으면 추가 전달
					    		}
					    	}).done(function(data) {
					    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					    		if ( everythings_fine ) {
					    			var msg = '결제가 완료되었습니다.';
					    			msg += '\n고유ID : ' + rsp.imp_uid;
					    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					    			msg += '\결제 금액 : ' + rsp.paid_amount;
					    			msg += '카드 승인번호 : ' + rsp.apply_num;
					    			
					    			alert(msg);
					    		} else {
					    			//[3] 아직 제대로 결제가 되지 않았습니다.
					    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
					    		}
					    	});
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
					        
					        alert(msg);
					    }
				  });
	}
	
	</script>
</head>
<body>
    <div class="cart-container">
        <h1>장바구니</h1>

        <c:forEach var="item" items="${cartitems}">
            <div class="cart-item">
                <div>상품 번호 : ${item.productnum}</div>
                <div>상품 이름 : ${item.productname}</div>
                <div>가격 : ${item.price}원</div>
                <div>수량 : ${item.quantity}개</div>
                <div>합계 : ${item.price * item.quantity}원</div>
            </div>
            
        </c:forEach>
	<button onclick="requestPay()">결제하기</button><!-- 결제하기 버튼 -->
    </div>
</body>
</html>