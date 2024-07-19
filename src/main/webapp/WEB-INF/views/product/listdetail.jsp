<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
</head>
<body>
    <div class="product_detail">
        <img src="resources/product_img/${product.productimage_path}" alt="${product.productname}">
        <div class="product_info">
            <h2>${product.productname}</h2>
            <p>${product.content}</p>
            <p class="price">${product.price}원</p>
            <p>재고 수량: ${product.productquantity}</p>
            <form method="post" action="additemcart.do">
                <input type="hidden" name="productnum" value="${product.productnum}">
                <button type="submit" class="add_to_cart_button">장바구니에 담기</button>
                바로구매버튼
            </form>
        </div>
    </div>
</body>
</body>
</html>