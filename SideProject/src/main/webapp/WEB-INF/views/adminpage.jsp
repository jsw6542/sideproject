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

<nav class="text-center mb-4">
    <a class="btn btn-secondary" href="home.do">홈페이지 가기</a>
</nav>

<div class="container">
    <div class="mb-4">
        <h2>상품 관리</h2>
        <div>
            <a class="btn btn-primary" href="productList.do">상품 리스트</a>
            <a class="btn btn-success" href="productAddForm.do">상품 등록</a>
            <a class="btn btn-warning" href="productEditForm.do">상품 수정</a>
        </div>
    </div>

    <div class="mb-4">
        <h2>주문 관리</h2>
        <div>
            <a class="btn btn-primary" href="orderList.do">주문 리스트</a>
            <a class="btn btn-info" href="orderDetail.do">주문 상세보기</a>
            <a class="btn btn-secondary" href="orderStatusUpdate.do">주문 상태 업데이트</a>
        </div>
    </div>

    <div class="mb-4">
        <h2>고객 관리</h2>
        <div>
            <a class="btn btn-primary" href="customerList.do">고객 리스트</a>
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
