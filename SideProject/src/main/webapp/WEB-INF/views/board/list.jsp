<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아르카나 게시판 목록</title>
<!-- 임시style -->
<style>
        .post-list {
            list-style-type: none; /* 기본 리스트 스타일 제거 */
            padding: 0; /* 패딩 제거 */
        }
        .post-item {
            border: 1px solid #ccc; /* 경계선 추가 */
            margin: 10px 0; /* 위아래 여백 추가 */
            padding: 10px; /* 내부 여백 추가 */
            border-radius: 5px; /* 모서리 둥글게 */
        }
        .post-title {
            font-weight: bold; /* 제목 굵게 */
        }
    </style>
</head>
<body>
	<h1>게시판 목록</h1>

    <ul class="post-list">
        <c:forEach var="board" items="${boardlist}">
            <li class="post-item">
                <div class="post-title">
                    <a href="boarddetail.do?boardidx=${board.boardidx}">${board.title}</a>
                </div>
                <div>작성자: ${board.memberid}</div>
                <div>작성일: ${board.board_created_at}</div>
                <div>조회수: ${board.readhit}</div>
            </li>
        </c:forEach>
    </ul>	
    <div>
        <c:if test="${not empty pageMenu}">
            ${pageMenu}
        </c:if>
    </div>
    
    <div>
        <a href="boardinsert.do" class="boardinsert-button">글쓰기</a>
    </div>
</body>
</html>