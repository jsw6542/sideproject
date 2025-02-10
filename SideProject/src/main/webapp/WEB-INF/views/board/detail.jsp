<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아르카나 게시판 상세페이지</title>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
<div>
    <div>제목</div>
    <div>${vo.title}</div>
    
    <div>닉네임</div>
    <div>${vo.memberid}</div>

    <div>등록일</div>
    <div>${vo.board_created_at}</div>

    <div>내용</div>
    <div>
        ${vo.content}
        <c:if test="${vo.boardimage != 'no_file'}">
            <img src="resources/board_img/${vo.boardimage }" width="300">
        </c:if>
    </div>

    <div>조회수</div>
    <div>${vo.readhit}</div>

    <div>
        <%-- <c:if test="${vo.memberid == login.nickname}"> --%>
        <c:if test="${vo.memberid == login.nickname}"> <!-- 글작성자일경우 수정,삭제권한 -->
            <input type="button" value="수정"
                   onclick="location.href='boardmodify_form.do?boardidx=${vo.boardidx}'">
            <input type="button" value="삭제"
                   onclick="location.href='delete.do?boardidx=${vo.boardidx}'">
        </c:if>
        
    </div>
</div>

<!-- 댓글 목록 -->
<div>

    <ul>
        <c:forEach var="r" items="${list}">
            <li style="border-bottom: 1px solid #ddd; padding: 10px;">
                <!-- 아이디 -->
                <div>${r.memberid}</div>
                <!-- 댓글 -->
                <div>${r.content}</div>
                <!-- 작성일 -->
                <div>${r.regdate}</div>
                <!-- 조회수 -->
                <div>${r.readhit}</div>
            </li>
        </c:forEach>
    </ul>
</div>

<c:if test="${login.memberid != null}">
    <div style="width: 400px; margin-top: 20px;">
        <form action="reply_write.do" method="post">
            <input type="hidden" name="boardidx" value="${vo.boardidx}">
            <input type="hidden" name="memberid" value="${login.memberid}">
            <textarea name="content" rows="4" cols="50" placeholder="댓글을 입력하세요"></textarea>
            <br>
            <input type="submit" value="댓글 작성">
            <input type="button" value="목록" onclick="location.href='boardlist.do'">
        </form>
    </div>
</c:if>


<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>