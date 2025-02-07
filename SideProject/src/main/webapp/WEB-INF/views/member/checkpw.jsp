<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
	<body>
		<div>
			<c:if test="${pw == null }">
				<td>등록된 계정이 존재하지 않습니다</td>
			</c:if>
			<c:if test="${pw != null }">
				<td>비밀번호는 ${pw }입니다<br>로그인 후 비밀번호를 변경해주세요<td>
			</c:if>
		</div>
		<div>
			<input type="button" value="로그인 페이지" onclick="location.href='login_form.do'">
			<input type="button" value="홈으로" onclick="location.href='home.do'">
		</div>
	</body>
</html>