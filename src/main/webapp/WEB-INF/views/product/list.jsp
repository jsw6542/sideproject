<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .product_list {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
        padding: 20px;
    }
    .product_item {
        border: 1px solid #ddd;
        border-radius: 5px;
        overflow: hidden;
        width: 300px;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    .product_item img {
        width: 100%;
        height: auto;
        cursor: pointer;
    }
    .product_info {
        padding: 15px;
    }
    .product_info h2 {
        font-size: 18px;
        margin: 0;
    }
    .product_info p {
        color: #555;
        font-size: 14px;
        margin: 5px 0;
    }
    .product_info .price {
        font-size: 16px;
        font-weight: bold;
        color: #000;
    }
</style>
</head>
<body>
			<h1>상품</h1>
		<div class="product_list">
			<c:forEach var="product" items="${ productlist }">
				<div class="product_item">
					<img src="resources/product_img/${product.productimage_path}"
						alt="${product.productname}" width="300" height="300"
						onclick="location.href='productdetail.do?productnum=${product.productnum}'">
           		 	<h2>${product.productname}</h2>
           		 	<p>${product.content}</p>
            		<p>${product.price}원</p>
				</div>
			</c:forEach>
		</div>
</body>
</html>