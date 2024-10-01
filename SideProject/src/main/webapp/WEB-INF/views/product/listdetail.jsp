<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지 및 장바구니 담기</title>


	<script>
	function send(f) {
		let quantity = f.quantity.value.trim();
	
		if(quantity == ''){
			alert("수량을 입력하세요");
			return;
		}
		
		//장바구니 담기 버튼 클릭 시 로그인이 안되어 있을때 알림
		let login = <%= (session.getAttribute("login") != null) %>;
		
		if(!login) {
			alert("로그인 후 이용해주세요!");
			return;
		}
		
		f.action = "insertitems.do";
		f.submit();
	
	
	}
	</script>
	
	
	<!-- 아래 스크립트 결제 연동 테스트용 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<script>
	
	function requestPay() {
		IMP.init("imp00468062");
		
		IMP.request_pay(
				  {
				    pg: /* "{PG사 코드}.{상점 ID}" */ "kakaopay.TC0ONETIME",
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
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <div class="product_detail">
        <img src="resources/product_img/${product.productimage_path}" alt="${product.productname}">
        <div class="product_info">
            <h2>${product.productname}</h2>
            <p>${product.content}</p>
            <p class="price">${product.price}원</p>
            <%-- <p>재고 수량: ${product.productquantity}</p> 재고 수량은 굳이 안넣어도 된다--%> 
            
            <form method="post" action="insertitems.do">
            	
                <input type="hidden" name="productnum" value="${product.productnum}">
                
                <label for="quantity">구매 수량:</label>
                <input type="number" id="quantity" name="quantity" value="1" min="1" required>
               
                <input type="button" value="장바구니 담기" onclick="send(this.form);">
                <button onclick="requestPay()">결제하기</button> <!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ결제하기 버튼 테스트용ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ-->
            </form>
        </div>
    </div>
    <!-- Bootstrap core JS -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->
    
    <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>