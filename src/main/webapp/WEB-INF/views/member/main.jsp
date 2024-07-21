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
	<div class="main">
		<div class="mainpage">
			<c:if test="${member == null }"> <!-- 비로그인 -->
				<li>
					<a href="login.do">로그인</a>
				</li>
				<li>
					<a href="join.do">회원가입</a>
				</li>
			</c:if>
			<c:if test="${member != null }"> <!-- 로그인 -->
				<c:if test="${member.id == 'admin' }">
					<li>관리자페이지</li>
					
				</c:if>
				<li>
					마이페이지
				</li>
				<li>
					장바구니
				</li>
			</c:if>
		</div>
		
	</div>
</body>
</html>