<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
        
    }
</script>

<script src="/project/resources/js/httpRequest.js"></script>

<script>
	function send_check(f) {

		let name = f.membername.value.trim();
		let pwd = f.pwd.value.trim();
		let nickname = f.nickname.value.trim();
		let email1 = f.email1.value.trim();
		let id = f.memberid.value.trim();
		let zipcode = f.zip_code.value.trim();
		let pwdchk = f.pwdchk.value.trim();
		let email2 = f.email2.value.trim();
		let input_email = f.direct_input.value;
		

		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}

		if (pwd == '') {
			alert("비밀번호를 입력하세요");
			return;
		}

		if (pwdchk == '') {
			alert("비밀번호를 입력하세요")
			return;
		}

		if (nickname == '') {
			alert("닉네임을 입력하세요");
			return;
		}

		if (name == '') {
			alert("이름을 입력하세요");
			return;
		}

		if (email1 == '') {
			alert("이메일을 입력하세요");
			return;
		}
		
		if (zipcode == '') {
			alert("주소를 입력하세요");
			return;
		}
		
		if (email2 == '') {
			alert("이메일을 입력하세요");
			return;
		}

		if (pwd != pwdchk) {
			alert("비밀번호가 일치하지 않습니다");
			return;
		}

		if (f.check1.value != "yes") {
			alert("id중복검사하세요~");
			return;
		}

		if (f.check2.value != "yes") {
			alert("닉네임중복검사하세요~");
			return;
		}

		f.action = "join.do?inputEmail="+input_email;

		f.submit();
		alert("회원가입이 완료되었습니다");

	}

	//id

	function check_id(f) {

		let id = f.memberid.value.trim();

		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}

		let url = "checkid.do";
		let param = "memberid=" + id;

		sendRequest(url, param, checkFn, "post");
	}

	function checkFn() {

		if (xhr.readyState == 4 & xhr.status == 200) {

			let data = xhr.responseText;

			if (data == 'no') {
				alert("이미 사용중인 id입니다");
				return;
			}
			let joingtform = document.getElementById('joingt');
			let check = joingtform.check1.value = "yes";

			alert("사용 가능한 id입니다");
		}
	}

	//닉네임

	function check_nickname(f) {

		let nickname = f.nickname.value;

		let url = "checknickname.do";
		let param = "nickname=" + nickname;

		sendRequest(url, param, checknicknameFn, "post");
	}

	function checknicknameFn() {

		if (xhr.readyState == 4 & xhr.status == 200) {

			let data = xhr.responseText;

			if (data == 'no') {
				alert("이미 사용중인 닉네임입니다");
				return;
			}

			let joingtform = document.getElementById('joingt');
			let check = joingtform.check2.value = "yes";

			alert("사용 가능한 닉네임입니다");
		}
	}
</script>

</head>

<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <form id="joingt" action="join.do" method="post">
        <input type="hidden" name="check1" value="no">
        <input type="hidden" name="check2" value="no">
        
        <div class="form-container">
            <h2>회원가입</h2>

            <div class="form-group">
                <label for="name">이름</label>
                <input id="name" name="membername" size="15">
            </div>

            <div class="form-group">
                <label for="email1">이메일</label>
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

            <div class="form-group">
                <label for="id">아이디</label>
                <input id="id" name="memberid" size="15">
                <input type="button" value="중복검사" onclick="check_id(this.form);">
            </div>
            
            <div class="form-group">
                <label for="zip_code">우편번호</label>
                <input type="text" id="sample4_postcode" name="zip_code" placeholder="우편번호">
                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소">
                <input type="text" id="sample4_jibunAddress" name="address2" placeholder="지번주소">
                <span id="guide" style="color:#999;display:none"></span>
                <input type="text" id="sample4_detailAddress" name="address3" placeholder="상세주소">
            </div>

            <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" size="15">
            </div>

            <div class="form-group">
                <label for="pwdchk">비밀번호 확인</label>
                <input type="password" id="pwdchk" name="pwdchk" size="15">
            </div>

            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input id="nickname" name="nickname" size="15">
                <input type="button" value="중복검사" onclick="check_nickname(this.form);">
            </div>

            <div class="form-actions">
                <input type="button" value="가입하기" onclick="send_check(this.form);">
                <input type="button" value="뒤로가기" onclick="location.href='home.do'"> <!-- home.do를 초기화면 url로 수정 -->
            </div>
        </div>
    </form>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>  
</body>
</html>