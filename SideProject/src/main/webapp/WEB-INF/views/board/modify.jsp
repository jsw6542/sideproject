<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script>
		function modify(f){
			f.action = "boardmodify.do";
			f.submit();
		}
		
		function del(f){
		
			f.action = "boarddelete.do";
			f.submit();
		} 
	</script>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	<form action="boardmodify.do" method="post">
	    <input type="hidden" name="boardidx" value="${vo.boardidx}"> <!-- 글 고유 번호 -->
	
	    <div>
	        <label>제목</label>
	        <input type="text" name="title" value="${vo.title}"><!-- required 입력 필드 비우기 불가능 -->
	    </div>
	
	    <div>
	        <label>닉네임</label>
	        <input type="text" name="memberid" value="${vo.memberid}"><!-- readonly 읽기전용 수정x -->
	    </div>
	
	    <div>
	        <label>등록일</label>
	        <input type="text" name="created_at" value="${vo.board_created_at}">
	    </div>
	
	    <div>
	        <label>내용</label>
	        <textarea name="content" required>${vo.content}</textarea>
	        <c:if test="${vo.boardimage != 'no_file'}">
	            <img src="resources/board_img/${vo.boardimage}" width="300">
	        </c:if>
	    </div>
	
	    <div>
	        <label>조회수</label>
	        <input type="text" name="readhit" value="${vo.readhit}" readonly>
	    </div>
	
	    <div>
	        <input type="submit" value="수정 완료">
	        <input type="button" value="취소" onclick="location.href='boardlist.do'">
	    </div>
	</form>
	
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script> 
	
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>