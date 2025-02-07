<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아르카나 게시판 목록</title>

<style>
    /* 기본 스타일 */
    html, body {
        height: 100%;
        margin: 0;
    }

    .wrapper {
        display: flex;
        flex-direction: column;
        min-height: 100%;
    }

	.content {
    flex-grow: 1; /* 이 부분이 콘텐츠 영역을 늘려서 푸터를 하단에 고정시킴 */
	}

    /* 게시판 헤더 스타일 */
    .post-header {
        display: flex;
        justify-content: space-between;
        padding: 10px;
        background-color: #f8f9fa;
        font-weight: bold;
    }

    .post-header div {
        text-align: center;
        flex: 1;
    }

    /* 게시물 리스트 스타일 */
    .post-list {
        list-style-type: none;
        padding: 0;
        margin: 0;
    }

    .post-item {
        display: flex;
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    .post-item div {
        flex: 1;
        text-align: center;
    }

    .post-item a {
        color: #007bff;
        text-decoration: none;
    }

    /* 반응형 스타일 */
    @media (max-width: 991px) {
        .post-header {
            display: block; /* 작은 화면에서 세로로 정렬 */
        }

        .post-header div {
            display: block;
            margin-bottom: 10px;
        }

        .post-item {
            flex-direction: column; /* 리스트 항목들을 세로로 나열 */
            align-items: flex-start; /* 왼쪽 정렬 */
        }

        .post-item div {
            width: 100%; /* 항목 너비 100%로 설정 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
        }

        .post-item a {
            display: block;
            margin-top: 5px;
        }
    }

    /* 버튼 스타일 */
    .boardinsert-button {
        display: inline-block;
        padding: 10px 15px;
        margin-top: 20px;
        background-color: #007bff;
        color: white;
        text-align: center;
        text-decoration: none;
        border-radius: 5px;
    }

    /* 작은 화면에서 글쓰기 버튼 크기 조정 */
    @media (max-width: 576px) {
        .boardinsert-button {
            width: 100%;
            text-align: center;
        }
    }
    
    
</style>
</head>


<body>
<div class="wrapper">
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <h1>게시판 목록</h1>
    
    <!-- 게시판 헤더 -->
    <div class="post-header">
        <div>번호</div>
        <div>제목</div>
        <div>작성일</div>
        <div>작성자</div>
        <div>조회수</div>
    </div>
    
    <ul class="post-list">
        <c:forEach var="board" items="${boardlist}">
            <li class="post-item">
                <div>${board.boardidx}</div>
                <div>
                    <a href="boarddetail.do?boardidx=${board.boardidx}">${board.title}</a>
                </div>
                <div>${board.board_created_at}</div>
                <div>${board.memberid}</div>
                <div>${board.readhit}</div>
            </li>
        </c:forEach>
    </ul>
    
    <!-- 페이지네이션 -->
    <div>
        <c:if test="${not empty pageMenu}">
            ${pageMenu}
        </c:if>
    </div>
    
    <!-- 글쓰기 버튼 -->
    <div style="text-align: right;">
    	<c:if test="${login != null }">
        <a href="boardinsert_form.do" class="boardinsert-button">글쓰기</a>
    	</c:if>
    </div>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>    
    <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</div>
</body>

</html>