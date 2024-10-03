<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form>
        <input type="hidden" name="boardidx" value="${vo.boardidx }">
        
        <h2>글 수정하기</h2>

        <!-- 아이디 -->
        <div>
            <label>아이디</label>
            <div>${vo.memberid }</div>
        </div>

        <!-- 글종류 -->
        <div>
            <label>글종류</label>
            <div>${vo.board_type }</div>
        </div>

        <!-- 제목 -->
        <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title" value="${vo.title }">
        </div>

        <!-- 내용 -->
        <div>
            <label for="content">내용</label>
            <textarea name="content" id="content">${vo.content }</textarea>
        </div>

        <!-- 수정/삭제 버튼 -->
        <div>
            <input type="button" value="수정" onclick="modify(this.form)">
            <input type="button" value="삭제" onclick="del(this.form)">
        </div>
    </form>
</body>
</html>