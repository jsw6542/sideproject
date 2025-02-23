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
<!-- 주문목록 확인 페이지 -->
주문 목록은 장바구니 처럼 디자인

주문번호 구매날짜 상품이름 구매갯수 배송중or배송완료 가격  / 구매자이름 배송지
orders에서 구매날짜 나머지를 orderdetail에서 가져와야함 상품이름은 orderdetail에 있는 productnum에서 가져온다
<div class = "orderlist_container">
	<div class = orderlist>
		<c:forEach var="orderdetail" items="${orderdetail }">
			<div>주문번호 : ${orderdetail.ordernum }</div>
			<div>구매수량 : ${orderdetail.quantity }</div>
			<div>배송 현황 : 
                <c:choose>
                    <c:when test="${orderdetail.result == 1}">배송 준비</c:when>
                    <c:when test="${orderdetail.result == 2}">배송 중</c:when>
                    <c:when test="${orderdetail.result == 3}">배송 완료</c:when>
                    <c:otherwise>정보 없음</c:otherwise>
                </c:choose>
            </div>
            <div>이름 : ${orderdetail.buyername }</div>
			<div>배송지 : ${orderdetail.buyeradress1 } ${orderdetail.buyeradress3 }</div>   
         </c:forEach>
              
         <c:set var="orders" value=""></c:set>
         <c:forEach var="orders" items="${orders }"> 
			<div>구매날짜 : ${orders.paymenttime }</div>
		 </c:forEach>
		 
		 <c:set var="product" value=""></c:set>
		 <c:forEach var="product" items=${product }>	
			<div>상품 이름 : ${product.productname }</div>
		 </c:forEach>
		
	</div>

</div>
</body>
</html>


