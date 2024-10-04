<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지에서 댓글을 달 수 있게 함. 비밀글로 문의 게시판까지 통합되게 함</title>
</head>
<body>
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
        <c:if test="${login.memberid != null}">
            <input type="button" value="댓글쓰기"
                   onclick="location.href='reply_form.do?idx=${vo.boardidx}'">
        </c:if>
        <%-- <c:if test="${vo.memberid == login.nickname}"> --%>
        <c:if test="${vo.memberid == login.nickname}"> <!-- 글작성자일경우 수정,삭제권한 -->
            <input type="button" value="수정"
                   onclick="location.href='boardmodify_form.do?boardidx=${vo.boardidx}'">
            <input type="button" value="삭제"
                   onclick="location.href='delete.do?boardidx=${vo.boardidx}'">
        </c:if>
        <input type="button" value="목록" onclick="location.href='boardlist.do'">
    </div>
</div>

<!-- 댓글 목록 -->
<div style="width: 400px; border: 1px solid #000; margin-top: 20px;">
    <div style="text-align: center;">댓글</div>

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
</body>
</html>