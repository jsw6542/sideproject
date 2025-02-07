<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		
		<script>
			function send(f) {
				let name = f.membername.value.trim();
				let id = f.memberid.value.trim();
				let email1 = f.email1.value.trim();
				let email2 = f.email2.value.trim();
				
				if(name == '') {
					alert("이름을 입력하세요")
					return;
				}
				
				if(id == '') {
					alert("아이디를 입력하세요")
					return;
				}
				if(email1 == '') {
					alert("이메일을 입력하세요")
					return;
				}
				if(email2 == '') {
					alert("이메일을 입력하세요")
					return;
				}
				
				f.action="selectpw.do";
				f.submit();
				
			}
		</script>
	</head>
	<body>
		<form action = "checkpw.jsp" method="post">
				<div>
					<label for="name">이름</label>
					<input id="name" name="membername">
				</div>
				<div>
					<label for="id">아이디</label>
					<input id="name" name="memberid">
				</div>
				<div>
					<label for="email">이메일</label>
                
                	<input class="box" id="domain-txt" name="email1" size="15">
                	@
	                <input class="box" id="direct-input" name="direct_input" style="display: none;" placeholder="도메인 직접 입력" size="15">
	                <select class="box" id="domain-list" name="email2" onchange="checkDirectInput(this)">
	                    <option value="">선택</option>
	                    <option value="naver.com">naver.com</option>
	                    <option value="google.com">google.com</option>
	                    <option value="hanmail.net">hanmail.net</option>
	                    <option value="nate.com">nate.com</option>
	                    <option value="daum.net">daum.net</option>
	                </select>
	                <input type="text" id="direct-input" name="direct_email" style="display: none;" placeholder="직접 입력">
				</div>
				<div>
					<input type="button" value="비밀번호 찾기" onclick="send(this.form)">
				</div>

				<p align="center" style="color: red;" >${selectpwfail }</p>
			</form>
	</body>
</html>