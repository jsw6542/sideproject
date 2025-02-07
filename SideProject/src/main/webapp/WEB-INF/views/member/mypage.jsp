<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	표시할정보
	닉네임
	주소
	이메일
	이름
	회원정보 수정하기 버튼
		<div class="mypage-container">
    	<div class="mypage-item">
        	<span class="label">이름</span>
        	<span class="value">${ login.membername }</span>
    	</div>
	
	    <div class="mypage-item">
	        <span class="label">가입날짜</span>
	        <span class="value">${ login.regdate }</span>
	    </div>
	
	    <div class="mypage-item">
	        <span class="label">닉네임</span>
	        <span class="value">${ login.nickname }</span>
	    </div>
	
	    <div class="mypage-item">
	        <span class="label">이메일</span>
	        <span class="value">${ login.email1 }@${ login.email2 }</span>
	    </div>
	    
	    <div class="mypage-item">
	    	<span class="label">주소</span>
	    	<span class="value">${ login.address1 } ${login.address3 }</span>
	    </div>
	
    	<div class="button-container">
     	   <a href="membermodify_form.do" class="modify-button">정보 수정하기</a>
   	 	</div>
	</div>
	
	
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->	
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>	
</body>
</html>