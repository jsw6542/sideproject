<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/project/resources/js/httpRequest.js"></script>
		
		<script>
			function send(f) {
				let id = f.id.value.trim();
				let pw = f.pwd.value.trim();
				
				if(id == ''){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(pw == ''){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				f.action = "login.do";
				f.submit();
				
				
			}
				
			
		</script>


</head>
<body>
		<form action="login.do" method="post">
			<table border="1">
					<caption>로그인 페이지</caption>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id"></td>
						</tr>
					
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd"></td>
						</tr>
						
						<tr>
							<td colspan="2">
							<input type="button" value="로그인" onclick="send(this.form);">
							<input type="button" value="홈으로" onclick="location.href='home.do'"><!-- home.do를 초기화면 url로 수정 -->
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<input type = "button" value="아이디 찾기" onclick="location.href='selectid_form.do'">
								<input type = "button" value="비밀번호 찾기" onclick="location.href='selectpw_form.do'">
								<input type = "button" value="회원가입" onclick="location.href='join_form.do'">
							</td>
						</tr>
			</table>
			<p align="center" >${loginfail }</p>
		</form>
</body>
</html>