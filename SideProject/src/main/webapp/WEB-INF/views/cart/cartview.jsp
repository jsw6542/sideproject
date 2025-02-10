<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 확인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
    <script>
        function requestPay() {
            IMP.init("imp00468062");

            // 장바구니 상품명과 총 금액 계산
            let productNames = [];
            let totalprice = 0;
            <c:forEach var="item" items="${cartitems}">
                productNames.push("${item.productname}");
                totalprice += ${item.price} * ${item.quantity}; // 총 금액 계산
            </c:forEach>
            
            const combinedNames = productNames.join(', '); // 상품명 결합

            // 세션에서 로그인 정보 가져오기
            const email1 = "${login.email1}"; // 로그인한 회원의 이메일
            const email2 = "${login.email2}"; // 로그인한 회원의 이메일
            const membername = "${login.membername}"; // 로그인한 회원의 이름
            const memberphone = "${login.member_phone}"; // 로그인한 회원의 전화번호
            const address1 = "${login.address1}"; // 로그인한 회원의 주소
            const address2 = "${login.address3}"; // 로그인한 회원의 주소
            const zip_code = "${login.zip_code}"; // 로그인한 회원의 우편번호
            const merchantuid = "${merchantuid}";
      
            
            const buyeremail = "${login.email1}@${login.email2}"; // 이메일 결합
            const buyeraddr = "${login.address1} ${login.address3}";

            console.log(" 스크립트 실행 시작!"); // 맨 처음 로그 추가
            
            IMP.request_pay({
                pg: "kakaopay.TC0ONETIME",
                pay_method: "card",
                merchant_uid: merchantuid, // 주문 고유 번호
                name: combinedNames, // 모든 상품 이름
                amount: totalprice, // 총 금액
                buyer_email: buyeremail, // 구매자 이메일
                buyer_name: membername, // 구매자 이름
                buyer_tel: memberphone, // 구매자 전화번호
                buyer_addr: buyeraddr, // 구매자 주소
                buyer_postcode: zip_code, // 구매자 우편번호
            }, function (rsp) {
            	console.log(" 결제 응답 1 : ", rsp);  // 응답 로그 확인
                if (rsp.success) {
                	console.log(" 결제 응답 2 : ", rsp);  // 응답 로그 확인
                    jQuery.ajax({
                        url: "orders/complete", // cross-domain error가 발생하지 않도록 주의해주세요
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            imp_uid: rsp.imp_uid // 필요한 데이터 전달
                        }
                    }).always(function (data) {
                    	console.log("결제 응답:", rsp);  // 응답 전체 확인
                        console.log("imp_uid:", rsp.imp_uid);  
                        // 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (rsp.status === "paid") {

                            var msg = '결제가 완료되었습니다.';
                            msg += '\n고유ID : ' + rsp.imp_uid;
                            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                            msg += '\n결제 금액 : ' + rsp.paid_amount;
					
                            alert(msg);
                            alert('결제 완료');
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
            
            console.log(" 스크립트 실행 완료!"); // 마지막 로그 추가
        }
    </script>
    
<script>
    function deletecartitem(productnum) {
        // 확인 메시지
        if (confirm("삭제하시겠습니까?")) {
            // 상품 번호를 서버로 전송
            let url = "/project/cart/delete";  // 장바구니 상품 삭제 URL
            let param = "productnum=" + productnum;

            console.log("상품 삭제 요청: " + param);  // 로그 추가: 파라미터 확인

            // fetch를 사용하여 AJAX 요청
            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: param
            })
            .then(response => {
                console.log("서버 응답 받음:", response);  // 로그 추가: 응답 확인
                
                // 응답 상태가 정상인지 확인
                if (!response.ok) {
                    throw new Error('서버 응답이 실패했습니다. 상태 코드: ' + response.status);
                }

                // JSON 형식 응답 파싱
                return response.json();
            })
            .then(data => {
                console.log("서버에서 받은 데이터:", data);  // 로그 추가: 받은 데이터 확인

                if (data.status === "success") {
                    // 성공적으로 삭제되었으면 화면에서 해당 상품 삭제
                    alert("삭제가 완료되었습니다.");

                    // 상품을 화면에서 제거
                    let cartItemElement = document.getElementById("productnum_" + productnum);
                    if (cartItemElement) {
                        cartItemElement.remove();  // DOM에서 해당 상품 삭제
                    } else {
                        console.log("DOM에서 상품을 찾을 수 없음: productnum_" + productnum);  // 로그 추가: 상품 ID 확인
                    }
                } else {
                    console.log("삭제 실패: " + data.message);  // 로그 추가: 실패 메시지
                    alert("삭제 실패: " + data.message);
                }
            })
            .catch(error => {
                console.error("상품 삭제 중 오류 발생:", error);  // 로그 추가: 에러 발생 시
                alert("상품 삭제에 실패했습니다.");
            });
        }
    }
</script>
</head>

<body>
<div class="wrapper">
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <div class="cart-container">
        <h1>장바구니</h1>
		
		
		<c:if test="${emptyCart == true }">
			<p>장바구니가 비어 있습니다.</p>
		</c:if>
		
		<c:if test="${emptyCart != true }">
		<c:set var="totalprice" value="0" /> <!-- 총 가격을 저장할 변수 0으로 설정 -->
		
        <c:forEach var="item" items="${cartitems}">
            <div id="productnum_${item.productnum}" class="cart-item">
                <div>상품 번호 : ${item.productnum}</div>
                <div>상품 이름 : ${item.productname}</div>
                <div>가격 : ${item.price}원</div>
                <div>수량 : ${item.quantity}개</div>
                <div>합계 : ${item.price * item.quantity}원</div>
                <button onclick = "deletecartitem('${item.productnum}')">삭제</button> <!-- 삭제 버튼 추가 -->
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</div>
</body>
</html>