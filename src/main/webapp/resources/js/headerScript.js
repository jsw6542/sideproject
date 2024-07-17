	function send(f) {
		let id = f.user_id.value.trim();
		let pw = f.user_pwd.value.trim();

		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}

		if (pw == '') {
			alert("비밀번호를 입력하세요");
			return;
		}

		f.action = "login.do";
		f.submit();

	}

	function openPopup() {
		document.getElementById("register-popup").style.display = "block";
	}

	function closePopup() {
		document.getElementById("register-popup").style.display = "none";
	}
