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
	
	
</head>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>

<div class="container my-5">
    <div class="row">
        <!-- 상품 이미지 -->
        <div class="col-md-6">
            <div class="card mb-4">
                <img src="resources/product_img/${product.productimage_path}" class="card-img-top" alt="${product.productname}">
            </div>
        </div>

        <!-- 상품 정보 -->
        <div class="col-md-6">
            <div class="card p-4">
                <h2 class="mb-3">${product.productname}</h2>
                <p class="text-muted mb-3">${product.content}</p>
                <p class="price h3 text-danger mb-4">${product.price}원</p>
                
                <!-- 구매 수량 입력 -->
                <form method="post" action="insertitems.do">
                    <input type="hidden" name="productnum" value="${product.productnum}">
                    
                    <div class="mb-3">
                        <label for="quantity" class="form-label">구매 수량</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" class="form-control" required>
                    </div>
                    
                    <!-- 버튼들 -->
                    <div class="d-flex justify-content-between">
                        <input type="button" value="장바구니 담기" class="btn btn-primary" onclick="send(this.form);">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>