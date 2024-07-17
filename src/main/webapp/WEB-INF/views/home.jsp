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
	<a href="join_form.do">회원가입</a>
	<a href="login_form.do">로그인</a>
	<!-- 로그인시 -->
	<!-- 상단에 표시 -->
	<a href="mypage.do">마이페이지</a>
	<!-- 관리자 로그인시 -->
	<c:if test="${login != null && login.id == 'admin' }">
		<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁ관리자 페이지 추가 예정 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ-->
		<a href="productadd_form.do">상품추가페이지</a>
		<a href="productdelete_form.do">상품삭제페이지</a>
	</c:if>
	<!-- 메인페이지 -->
	상품목록
	사진들 보이고 이름을 클릭하면 상세설명
	사진
	<%-- <input type="button" name=${productVO.name }> / 가격  --%>
	<a href="productdetail_form.do">상품 상세 설명 페이지이동</a>
	
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
