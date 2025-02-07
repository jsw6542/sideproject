<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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

<style>
    .form-container {
        width: 100%;
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
    }

    .form-group {
        margin-bottom: 1rem;
    }

    .form-group label {
        font-size: 14px;
        font-weight: bold;
    }

    .form-group input {
        width: 100%;
        padding: 0.8rem;
        font-size: 14px;
        margin-top: 0.5rem;
    }

    .buttons {
        display: flex;
        gap: 10px;
        justify-content: space-between;
        margin-top: 1rem;
    }

    .buttons input {
        flex: 1;
    }

    .message {
        color: red;
        font-size: 12px;
        text-align: center;
    }

    /* @media 쿼리: 992px 이상 화면에서 레이아웃 변경 */
    @media (min-width: 992px) {
        .form-container {
            max-width: 500px;
        }
        
        .buttons {
            justify-content: space-evenly;
        }

        .buttons input {
            flex: 0;
            width: auto;
        }
    }
</style>

</head>
<style>
    /* 전체 페이지 높이를 100%로 설정 */
    html, body {
        height: 100%;
        margin: 0;
    }

    /* wrapper를 flexbox로 설정 */
    .wrapper {
        display: flex;
        flex-direction: column;
        min-height: 100vh; /* 최소 높이를 100vh로 설정하여 푸터가 페이지 하단에 위치하도록 함 */
    }

    /* 콘텐츠 영역 */
    .content {
        flex-grow: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .form-container {
        max-width: 400px;
        width: 100%;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-container h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    /* 버튼 그룹 스타일 */
    .buttons input {
        width: 100%;
        margin-bottom: 10px;
    }

   

    /* @media 쿼리: 화면이 576px 이상일 때 */
    @media (max-width: 991px) {
        .form-container {
            max-width: 90%;
        }

        /* 버튼을 한 줄로 정렬 */
        .buttons input {
            width: 100%;
        }
    }

    /* @media 쿼리: 화면이 576px 이하일 때 */
    @media (max-width: 576px) {
        .form-container {
            max-width: 95%;
        }
        
        .buttons input {
            width: 100%;
        }
    }
</style>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <div class="wrapper">
        <div class="content">
            <form action="login.do" method="post" class="form-container">
                <h2>로그인 페이지</h2>
                <div class="form-group">
                    <label for="memberid">아이디</label>
                    <input type="text" id="memberid" name="memberid" class="form-control">
                </div>
                <div class="form-group">
                    <label for="pwd">비밀번호</label>
                    <input type="password" id="pwd" name="pwd" class="form-control">
                </div>
                <div class="buttons">
                    <input type="button" value="로그인" class="btn btn-primary" onclick="send(this.form);">
                    <input type="button" value="홈으로" class="btn btn-light" onclick="location.href='home.do'">
                </div>
                <div class="buttons">
                    <input type="button" value="아이디 찾기" class="btn btn-secondary" onclick="location.href='selectid_form.do'">
                    <input type="button" value="비밀번호 찾기" class="btn btn-secondary" onclick="location.href='selectpw_form.do'">
                    <input type="button" value="회원가입" class="btn btn-success" onclick="location.href='join_form.do'">
                </div>
                <p class="message">${loginfail}</p>
            </form>
        </div>
    </div>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>   

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>    
</body>



</html>