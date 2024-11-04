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
    

		.post-header div {
        display: inline-block;
        text-align: center;
	    }
	    
	   footer {
		    background-color: rgba(var(--bs-dark-rgb), 1);
		    padding-top: 3rem;
		    padding-bottom: 3rem;
		    text-align: center;
		    position: fixed; /* 고정 위치 */
		    bottom: 0;       /* 화면 아래에 위치 */
		    left: 0;
		    width: 100%;
		    z-index: 100;    /* 다른 요소와 겹치지 않도록 */
		}
	   
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
	<h1>게시판 목록</h1>
	
	<!-- 게시판 헤더 -->
	<div class="post-header">
        <div style="display: inline-block; width: 50px; text-align: center;">번호</div>
        <div style="display: inline-block; width: 300px; text-align: center;">제목</div>
        <div style="display: inline-block; width: 150px; text-align: center;">작성일</div>
        <div style="display: inline-block; width: 100px; text-align: center;">작성자</div>
        <div style="display: inline-block; width: 100px; text-align: center;">조회수</div>
    </div>
	
	
    <ul class="post-list">
        <c:forEach var="board" items="${boardlist}">
            <li class="post-item" style="display: flex; padding: 5px; border-bottom: 1px solid #ccc;">
                <div style="flex: 0 0 50px; text-align: center;">${board.boardidx}</div>
                <div style="flex: 0 0 300px; text-align: center;">
                    <a href="boarddetail.do?boardidx=${board.boardidx}">${board.title}</a>
                </div>
                <div style="flex: 0 0 150px; text-align: center;">${board.board_created_at}</div>
                <div style="flex: 0 0 100px; text-align: center;">${board.memberid}</div>
                <div style="flex: 0 0 100px; text-align: center;">${board.readhit}</div>
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
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>