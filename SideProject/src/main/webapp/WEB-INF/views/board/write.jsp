<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

<script>
	function send(f) {
				
		let board_type = f.board_type.value;
		let title = f.title.value;
		let content = f.content.value;

				
		if( board_type == '' ) {
			alert("글 종류를 입력해주세요");
			return;
		}
				
		if( title == '') {
			alert("제목을 입력해주세요");
			return;
		}
		
		if( content == '' ) {
			alert("내용을 입력해주세요");
			return;
		}
		
		if( !confirm('글을 등록하시겠습니까?') ){
			return;
		}
				
		f.action = "boardinsert.do";
		f.submit();
				
	}
		
	/* function resultFn() {
	
				
		if(xhr.readyState == 4 & xhr.status == 200) {
					
			let data = xhr.responseText;
					
					
			if(data == 'no') {
				alert("글 작성 실패");
				return;
			}
					
			alert("글 작성이 완료되었습니다!");
			location.href="boardlist.do";
		}
	} */
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	<div class="wrapper">
		<form method="POST" enctype="multipart/form-data">
		<input type="hidden" name="memberid" value="${login.memberid}">
			<div>
	   			 <h2>게시판 글쓰기</h2>
	
	   			 <div>
	    			 <label for="board_type">글 종류</label>
	   			     <select name="board_type" id="board_type">
	   			         <option value="qa">문의사항</option>
	   			         <option value="notion">공지사항</option>
	   			         <option value="review">리뷰</option>
	   			     </select>
	  			 </div>
	
	  			 <div>
	   			     <label for="title">제목</label>
	   			     <input name="title" id="title" size="10" maxlength="15">
	  			 </div>
	
	   			 <div>
	  			     <label for="content">내용</label>
	   			     <textarea name="content" id="content" rows="10" cols="150"></textarea>
	  			 </div>
	
	   			 <div>
	   			     <label for="boardimage">사진첨부</label>
	   			     <input type="file" name="boardimage" id="boardimage">
	   			 </div>
	
	  			  <div>
	   			     <input type="button" value="글 등록" onclick="send(this.form)">
	   			     <input type="button" value="글 목록" onclick="location.href='list.do'">
	   			 </div>
			</div>
		</form>
	</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>