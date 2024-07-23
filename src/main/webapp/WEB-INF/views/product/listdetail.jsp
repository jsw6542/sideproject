<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>


	<script>
	function send(f) {
		let quantity = f.quantity.value.trim();
	
		if(quantity == ''){
			alert("수량을 입력하세요");
			return;
		}
	
		f.action = "insertitems.do";
		f.submit();
	
	
	}
	</script>
	

</head>
<body>
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
            </form>
        </div>
    </div>
</body>
</body>
</html>