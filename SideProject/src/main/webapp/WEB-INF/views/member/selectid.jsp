<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	
		<script>
		function send(f) {
			let name = f.membername.value.trim();
			let email1 = f.email1.value.trim();
			let email2 = f.email2.value.trim();
			
			if(name == '') {
				alert("이름을 입력하세요")
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
			
			f.action="selectid.do";
			f.submit();
			
		}
		</script>
	</head>
<body>
		<!-- 아이디 찾기 페이지 -->
	<form action="selectid.jsp" method="post">
			<div>
				<label for="name">이름</label>
				<input id="name" name="membername">
			</div>
			<div>
                <label for="email">이메일</label>
                
                <input class="box" id="email1" name="email1" size="15">
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
                <input type="text" id="direct-email" name="direct_email" style="display: none;" placeholder="직접 입력">
            </div>
            <div>
				<input type="button" value="아이디 찾기" onclick="send(this.form)">
            </div>
            </form>
</body>
</html>