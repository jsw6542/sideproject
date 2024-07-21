<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴페이지</title>

<script src="/sideproject/resources/js/httpRequest.js"></script>
		
		<script>
			function send(f) {
				
				let id = f.memberid.value;
				let id_chk f.idchk.value;
				let pwd = f.pwd.value;
				let pwd_chk = f.pwd_chk.value;
				
				if( id != id_chk ) {
					alert("일치하는 회원 정보를 찾을 수 없습니다 !\n아이디나 비밀번호를 확인해주세요");
					return;
				}
				
				if( pwd != pwd_chk ) {
					alert("일치하는 회원 정보를 찾을 수 없습니다 !\n아이디나 비밀번호를 확인해주세요");
					return;
				}
				
				if( !confirm('탈퇴 하시겠습니까?') ){
					return;
				}
				
				let url= "delete.do";
				let param = "memberid="+id+"&pwd="+pwd;			
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
	<input type="hidden" name="memberid" value="${login.memberid}">
	<input type="hidden" name="pwd" value="${login.pwd}">
		<table>
			<caption>회원 탈퇴</caption>
				
				<tr>
					<td>아이디</td>
					<td><input type="text" name="idchk"></td>
				</tr>
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