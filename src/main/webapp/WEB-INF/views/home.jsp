<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>작동되는지 테스트페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
	<link href="resources/css/styles.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
<h1>
	
	안녕하세요   
	환영합니다
	<!--비로그인시-->
	<c:if test="${login == null }">
		<a href="join_form.do">회원가입</a>
		<a href="login_form.do">로그인</a>
	</c:if>
	<!-- 로그인시 -->
	<c:if test="${login != null }">
		<a href="mypage.do">마이페이지</a>
		<a href="logout.do">로그아웃</a>
		<a href="orderinfo.do">주문정보</a><!-- 구현예정 -->
		<a href="delete_form.do">회원탈퇴</a><!-- 마이페이지안에 넣기 -->
		<a href="cartlistview.do">장바구니</a> <!-- ★★★★★★상품을 장바구니에 넣을 때 장바구니 유무 확인 후 장바구니 생성 or 상품 추가★★★★★★ -->
	</c:if>

	<!-- 관리자 로그인시 관리자 페이지로 이동 -->0
	<c:if test="${login != null && login.memberid == 'admin' }">
		<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁ관리자 페이지 추가 예정 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ-->
		<a href="productadd_form.do">상품추가페이지</a>
		<a href="productdelete_form.do">상품삭제페이지</a>
	</c:if>
	
	<!-- 메인페이지 -->
	<!-- 메인페이지에 상품 몇개 보여주기 -->
	<a href="productlist.do">상품 리스트 페이지 이동</a>
	<a href="productdetail_form.do">상품 상세 설명 페이지이동</a>
	
	<a href="payment.do">결제 페이지 이동</a>
</h1>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
