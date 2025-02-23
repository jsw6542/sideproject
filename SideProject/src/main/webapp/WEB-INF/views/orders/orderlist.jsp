<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
</head>
<body>
<!-- 주문목록 확인 페이지 -->
주문 목록은 장바구니 처럼 디자인

주문번호 구매날짜 상품이름 구매갯수 배송중or배송완료 가격  / 구매자이름 배송지
orders에서 구매날짜 나머지를 orderdetail에서 가져와야함 상품이름은 orderdetail에 있는 productnum에서 가져온다
<!-- 하나의 vo를 만들어서 model을 orderlist로 주고 가져온다 -->
<div class = "orderlist_container">
	<div class = orderlist>
		<c:forEach var="orderlist" items="${orderlist }">
			<div>주문자 : ${orderlist.buyername }</div>
			<div>주문번호 : ${orderlist.ordernum }</div>
			<div>상품 이름 : ${orderlist.productname }</div>
			<div>구매수량 : ${orderlist.quantity }</div>
			<div>배송지 : ${orderlist.buyeradress1 } ${orderlist.buyeradress3 }</div>   
			<div>배송현황 : 
                <c:choose>
                    <c:when test="${orderlist.result == 1}">배송 준비</c:when>
                    <c:when test="${orderlist.result == 2}">배송 중</c:when>
                    <c:when test="${orderlist.result == 3}">배송 완료</c:when>
                    <c:otherwise>정보 없음</c:otherwise>
                </c:choose>
            </div>
            구매날짜 orders에 orderdate를 timestamp로 바꿔야할듯하다
            결제 가격 orders에 totalprice
		 </c:forEach>
		
	</div>


</div>
</body>
</html>


