<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
</head>
<body>

<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>

<header>
    <h1 class="text-center my-4">관리자 페이지</h1>
</header>

<div class="container">
    <div class="mb-4">
        <h2>상품 관리</h2>
        <div>
            <a class="btn btn-primary" href="admin/productlist.do">상품 리스트</a>
            <a class="btn btn-success" href="productinsert_form.do">상품 등록</a>
        </div>
    </div>

    <div class="mb-4">
        <h2>주문 관리</h2>
        <div>
            <a class="btn btn-primary" href="orderlist.do">주문 리스트</a><!-- 주문리스트에서 상세보기로 -->
            <a class="btn btn-secondary" href="orderstatusupdate.do">주문 상태 업데이트</a>
        </div>
    </div>

    <div class="mb-4">
        <h2>고객 관리</h2>
        <div>
            <a class="btn btn-primary" href="memberlist.do">고객 리스트</a>
        </div>
    </div>
    
    <div class="mb-4">
    	<h2>고객 관리</h2>
    	<div>
    		<a class="btn btn-primary" href="boardlist.do">게시판 목록</a>
    	</div>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
