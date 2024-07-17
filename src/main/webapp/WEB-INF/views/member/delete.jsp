<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="/sideproject/resources/js/httpRequest.js"></script>
		
		<script>
			function send(f) {
				
				let id = f.id.value;
				let pwd = f.pwd.value;
				let pwd_chk = f.pwd_chk.value;
				
				if( pwd != pwd_chk ) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				if( !confirm('탈퇴 하시겠습니까?') ){
					return;
				}
				
				let url= "delete.do";
				let param = "id="+id+"&pwd="+pwd;			
				sendRequest(url, param, resultFn, "post");
				
			}
		
			function resultFn() {
	
				
				if(xhr.readyState == 4 & xhr.status == 200) {
					
					let data = xhr.responseText;
					
					
					if(data == 'no') {
						alert("탈퇴 실패");
						return;
					}
					
					alert("탈퇴 완료!");
					location.href="logout.do";
				}
			}
		</script>
		
	</head>
	
	<body>
	<form>
	<input type="hidden" name="id" value="${login.id}">
	<input type="hidden" name="pwd" value="${login.pwd}">
		<table>
			<caption>회원 탈퇴</caption>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="chk"></td>
				</tr>
				
				<tr>
					<td>
					<input type = "button" value="탈퇴하기" onclick="send(this.form);">
					</td>
				</tr>
				
				
		</table>
	</form>
	</body>
</html>