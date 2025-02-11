<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 확인 페이지</title>

<style>
    /* 컨테이너 스타일 */
    .cart-container {
        width: 100%;
        margin: 0 auto;
        padding: 20px;
    }

    /* 각 상품 항목을 위한 flexbox 설정 */
    .cart-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #dee2e6; /* 구분선 */
        padding: 10px 0;
    }

    /* 첫 번째 항목(맨윗줄)에만 검은색 테두리 추가 */
    .cart-item:first-child {
        border-top: 2px solid black; /* 상단 테두리 */
    }
    
    /* 각 항목의 스타일 (상품 이미지, 이름 등) */
    .cart-item div {
        text-align: center;
        flex: 1;
    }

    /* 상품 이미지 크기 설정 */
    .cart-item img {
        max-width: 100px;
        height: auto;
    }


    /* 총 가격을 오른쪽 끝에 배치 */
    .cart-total {
        display: flex;
        justify-content: flex-end;
        margin-top: 20px;
        text-align: right;
    }

    /* 결제 버튼 스타일 */
    .payment-btn {
        display: flex;
        justify-content: flex-end;
        margin-top: 20px;
    }
}
</style>

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
	        let url = "/project/cart/delete";  // 장바구니 상품 삭제 URL

	        console.log("상품 삭제 요청: productnum=" + productnum); // 로그 확인

	        // jQuery AJAX 요청
	        $.ajax({
	            url: url,
	            type: "POST",
	            data: { productnum: productnum },  // form 데이터처럼 전송
	            dataType: "json",  // 서버 응답을 JSON으로 기대
	            success: function(data) {
	                console.log("서버에서 받은 데이터:", data);  // 로그 추가

	                if (data.status === "success") {
	                    alert("삭제가 완료되었습니다.");

	                    // 상품을 화면에서 제거
	                    let cartItemElement = $("#productnum_" + productnum);
	                    console.log(cartItemElement);
	                    if (cartItemElement.length) {
	                        cartItemElement.remove();  // jQuery 방식으로 DOM에서 제거

	                        // 🟢 장바구니가 비었는지 확인
	                        checkIfCartIsEmpty();
	                        
	                 		// 🟢 주문 금액 즉시 업데이트
							updateTotalPrice();

	                    } else {
	                        console.log("DOM에서 상품을 찾을 수 없음: productnum_" + productnum);
	                    }
	                } else {
	                    console.log("삭제 실패: " + data.message);
	                    alert("삭제 실패: " + data.message);
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("상품 삭제 중 오류 발생:", error);  // 에러 로그
	                alert("상품 삭제에 실패했습니다.");
	            }
	        });
	    }
	}
	    
	 // 🟢 주문 금액 즉시 업데이트
	    function updateTotalPrice() {
	        let cartItems = document.querySelectorAll(".cart-item"); // 남아있는 상품들
	        let ctotalprice = 0;
	        
	        // 첫 번째 항목 제외하고 상품 항목만 선택
	        cartItems = Array.from(cartItems).slice(1);  // 첫 번째 항목을 제외하고 나머지 상품만 선택
	        console.log("cart items 조회 : ",cartItems)
	        
	
	        // 🟢 남아있는 상품들의 가격을 다시 합산
	        cartItems.forEach(item => {
	            let priceText = item.querySelector(".product-price").innerText; // 가격 정보
	            let quantityText = item.querySelector(".product-quantity").innerText; // 수량 정보
	
	            let price = parseInt(priceText.replace(/[^\d]/g, ""));
	            let quantity = parseInt(quantityText.replace(/[^\d]/g, ""));
	
	            if (isNaN(price)) price = 0;
	            if (isNaN(quantity)) quantity = 0;
	            
	           
	            
	            console.log("가격 텍스트:", priceText);
	            console.log("수량 텍스트:", quantityText);
	            
	            console.log("가격 : ", price);
	            console.log("수량 : ", quantity);
	            
	            
	            ctotalprice += price * quantity;
	            
	            if (ctotalprice === undefined) {
	                console.log("🚨 ctotalprice가 undefined입니다!");
	            } else if (ctotalprice === null) {
	                console.log("🚨 ctotalprice가 null입니다!");
	            } else if (isNaN(ctotalprice)) {
	                console.log("🚨 ctotalprice가 NaN입니다!");
	            } else {
	                console.log("✅ ctotalprice 값:", ctotalprice);
	            }
	            
	            
	            console.log("ctotalPrice 타입:", typeof ctotalprice);

	        });
	        
	        // 🟢 총 가격 업데이트
		    const totalPriceElement = document.querySelector('.cart-total strong');
		    console.log("totalPriceElement 값 : ", totalPriceElement);  // null이 아니어야 합니다.
		    if (totalPriceElement) {
		        totalPriceElement.innerText = "총가격 : " + ctotalprice + "원";
		        totalPriceElement.classList.add("text-end");  // 클래스 추가
		    }
			
	        // 🟢 장바구니가 비었으면 총 가격 숨기기
	        if (cartItems.length === 0) {
	            document.querySelector(".cart-total").style.display = "none";
	        } else {
	            document.querySelector(".cart-total").style.display = "block";
	        }
	    }
	 
	    function checkIfCartIsEmpty() {
	        let cartItems = document.querySelectorAll(".cart-item");
	        let cartContainer = document.querySelector(".cart-container");
	
	        if (cartItems.length === 0) {
	            let emptyMessage = document.createElement("p");
	            emptyMessage.innerText = "장바구니가 비어 있습니다.";
	            emptyMessage.id = "emptyCartMessage";
	
	            if (!document.getElementById("emptyCartMessage")) {
	                cartContainer.appendChild(emptyMessage);
	            }
	
	            let totalPriceElement = document.querySelector(".cart-total");
	            if (totalPriceElement) {
	                totalPriceElement.style.display = "none";
	            }
	        }
	    }
	</script>
</head>

<body>
	<div class="wrapper">
		<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
		<div class="cart-container">
		    <h1>장바구니</h1>
		
		    <!-- 장바구니가 비어있을 경우 메시지 -->
		    <c:if test="${emptyCart == true }">
		        <p>장바구니가 비어 있습니다.</p>
		    </c:if>
		
		    <!-- 장바구니 항목이 있을 경우 -->
		    <c:if test="${emptyCart != true }">
		        <c:set var="totalprice" value="0" />
		
		        <!-- 상품 항목들 -->
		        <div class="cart-item">
		            <div>상품 이미지</div>
		            <div>상품 이름</div>
		            <div>수량</div>
		            <div>가격</div>
		            <div>합계</div>
		            <div>삭제</div>
		        </div>
		
		        <c:forEach var="item" items="${cartitems}">
		            <div id="productnum_${item.productnum}" class="cart-item">
		                <!-- 상품 이미지 -->
		                <div><img src="resources/product_img/${item.productimage_path}" alt="상품 이미지"></div>
		                <!-- 상품 이름 -->
		                <div>${item.productname}</div>
		                <!-- 수량 -->
		                <div class="product-quantity">${item.quantity}개</div>
		                <!-- 가격 -->
		                <div class="product-price">${item.price}원</div>
		                <!-- 합계 -->
		                <div>${item.price * item.quantity}원</div>

		                <!-- 삭제 버튼 -->
		                <div><button class="btn btn-danger btn-sm" onclick="deletecartitem('${item.productnum}')">삭제</button></div>
		            </div>
		            <c:set var="totalprice" value="${totalprice + (item.price * item.quantity)}" />
		        </c:forEach>
		
		        <!-- 총 가격 -->
		        <div class="cart-total">
		            <strong>총가격 : ${totalprice}원</strong>
		        </div>
		
		        <!-- 결제 버튼 -->
		        <div class="payment-btn">
		            <button class="btn btn-primary">결제하기</button>
		        </div>
		    </c:if>
		</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	</div>
</body>
</html>