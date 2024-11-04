<%@page import="vo.MemberVO"%>
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

            // 장바구니 상품명과 총 금액 계산
            let productNames = [];
            let totalPrice = 0;
            <c:forEach var="item" items="${cartitems}">
                productNames.push("${item.productname}");
                totalPrice += ${item.price} * ${item.quantity}; // 총 금액 계산
            </c:forEach>
            
            const combinedNames = productNames.join(', '); // 상품명 결합

            // 세션에서 로그인 정보 가져오기
            const memberEmail1 = "${login.email1}"; // 로그인한 회원의 이메일
            const memberEmail2 = "${login.email2}"; // 로그인한 회원의 이메일
            const memberName = "${login.membername}"; // 로그인한 회원의 이름
            const memberTel = "${login.member_phone}"; // 로그인한 회원의 전화번호
            const memberAddr1 = "${login.address1}"; // 로그인한 회원의 주소
            const memberAddr2 = "${login.address3}"; // 로그인한 회원의 주소
            const memberPostcode = "${login.zip_code}"; // 로그인한 회원의 우편번호
            
            const buyerEmail = `${memberEmail1}@${memberEmail2}`; // 이메일 결합
            const buyerAddr = `${memberAddr1} ${memberAddr2}`; // 주소 결합

            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME",
                pay_method: "card",
                merchant_uid: `payment-${crypto.randomUUID()}`, // 주문 고유 번호
                name: combinedNames, // 모든 상품 이름
                amount: totalPrice, // 총 금액
                buyer_email: buyerEmail, // 구매자 이메일
                buyer_name: memberName, // 구매자 이름
                buyer_tel: memberTel, // 구매자 전화번호
                buyer_addr: buyerAddr, // 구매자 주소
                buyer_postcode: memberPostcode, // 구매자 우편번호
            }, function (rsp) {
                if (rsp.success) {
                    // 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                    jQuery.ajax({
                        url: "/payments/complete", // cross-domain error가 발생하지 않도록 주의해주세요
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            imp_uid: rsp.imp_uid // 필요한 데이터 전달
                        }
                    }).done(function (data) {
                        // 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (data.status === 'completed') {
                            var msg = '결제가 완료되었습니다.';
                            msg += '\n고유ID : ' + rsp.imp_uid;
                            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                            msg += '\n결제 금액 : ' + rsp.paid_amount;
                            msg += '\n카드 승인번호 : ' + rsp.apply_num;

                            alert(msg);
                        } else {
                            alert("결제가 완료되지 않았습니다.");
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
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <div class="cart-container">
        <h1>장바구니</h1>
		
		
		<c:if test="${emptyCart == true }">
			<p>장바구니가 비어 있습니다.</p>
		</c:if>
		
		<c:if test="${emptyCart != true }">
		<c:set var="totalprice" value="0" /> <!-- 총 가격을 저장할 변수 0으로 설정 -->
		
        <c:forEach var="item" items="${cartitems}">
            <div class="cart-item">
                <div>상품 번호 : ${item.productnum}</div>
                <div>상품 이름 : ${item.productname}</div>
                <div>가격 : ${item.price}원</div>
                <div>수량 : ${item.quantity}개</div>
                <div>합계 : ${item.price * item.quantity}원</div>
                ----------------------------------
            </div>
            
            <c:set var="totalprice" value="${totalprice + (item.price * item.quantity) }" />
            
        </c:forEach>
        	
        	<div class="cart-total">
            	<strong>총가격 : ${totalprice }원</strong>
            </div>
         </c:if>   
	<button onclick="requestPay()">결제하기</button><!-- 결제하기 버튼 -->
	
    </div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>    
</body>
</html>