<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>쇼핑몰 메인 화면</title>
</head>
<body>
<h1>
	안녕하세요   
	환영합니다
	<!--비로그인시-->
	<c:if test="${login == null }">
		<a href="join_form.do">회원가입</a>
		<a href="login_form.do">로그인</a>
	</c:if>
	<!-- 로그인시 -->
	<c:if test="${login != null }">
		<a href="mypage.do">마이페이지</a>
		<a href="orderinfo.do">주문정보</a><!-- 구현예정 -->
		<a href="delete_form.do">회원탈퇴</a>
		<a href="cartlist.do">장바구니</a> <!-- 장바구니를 장바구니가 있을때만(장바구니에 상품이 담겨있을때만) 보여지게 할까 생각중 -->
	</c:if>

	<!-- 관리자 로그인시 관리자 페이지로 이동 -->
	<c:if test="${login != null && login.memberid == 'admin' }">
		<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁ관리자 페이지 추가 예정 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ-->
		<a href="productadd_form.do">상품추가페이지</a>
		<a href="productdelete_form.do">상품삭제페이지</a>
	</c:if>
	
	<!-- 메인페이지 -->
	<!-- 메인페이지에 상품 몇개 보여주기 -->
	<a href="productlist.do">상품 리스트 페이지 이동</a>
	<a href="productdetail_form.do">상품 상세 설명 페이지이동</a>
	
	
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
