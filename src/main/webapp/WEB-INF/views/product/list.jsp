<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	모든상품을 간단하게 표시
	이름 가격 이미지 미리보기
	클릭하면 상세정보페이지로이동 listdetail.jsp로 이동
	
			<h1>:::상품 목록:::</h1>
		<div class="product_list">
			<c:forEach var="product" items="${ productlist }">
				<div class="product_item">
						<img src="resources/product_img/${ product.productimage_path }"	
						alt="${product.productname}"
						onclick="locaion.href='productdetail.do?product_id=${product.id}'">
						<h2>상품 이름 : ${product.productname }</h2>
						<p>상품 설명 : ${product.content }</p>
						<p>상품 가격: ${prodcut.price }원</p>
					</div>
				</c:forEach>
		</div>
</body>
</html>