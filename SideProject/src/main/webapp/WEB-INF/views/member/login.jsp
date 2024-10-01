<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        html, body {
            height: 100%;
            margin: 0;
        }
	
		/* flex를 이용해 footer를 아래에 고정 */
        .wrapper {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

		/* flex: 1을 사용하여 남은 공간을 가변적으로 채우며, 페이지 내용이 적더라도 .content 영역이 확장되어 푸터가 항상 하단에 위치하게 됩니다. */
        .content {
            flex: 1;
            padding: 20px;
            /* 콘텐츠 영역 스타일링 */
        }

        #footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
        }
    </style>
<title>로그인페이지</title>

<script src="/project/resources/js/httpRequest.js"></script>
		
		<script>
			function send(f) {
				let id = f.memberid.value.trim();
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
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	<div class="wrapper">
	<div class="content">
	<form action="login.do" method="post" class="form-container">
        <h2>로그인 페이지</h2>
        <div>
            <label for="memberid">아이디</label>
            <input type="text" id="memberid" name="memberid">
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd">
        </div>
        <div class="buttons">
            <input type="button" value="로그인" onclick="send(this.form);">
            <input type="button" value="홈으로" onclick="location.href='home.do'">
        </div>
        <div class="buttons">
            <input type="button" value="아이디 찾기" onclick="location.href='selectid_form.do'">
            <input type="button" value="비밀번호 찾기" onclick="location.href='selectpw_form.do'">
            <input type="button" value="회원가입" onclick="location.href='join_form.do'">
        </div>
        <p class="message">${loginfail}</p>
    </form>
    </div>
    </div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>    
</body>
</html>