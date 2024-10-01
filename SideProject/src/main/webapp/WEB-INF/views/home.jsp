<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>아르카나</title>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    
                   <c:forEach var="recent" items="${recentlist}">  
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="resources/product_img/${recent.productimage_path}"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><c:out value="${recent.productname }"/></h5>
                                    <!-- Product price-->
                                    <c:out value="${recent.price}"/>원
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
       							 	<a class="btn btn-outline-dark mt-auto" href="productdetail.do?productnum=${recent.productnum}">자세히 보기</a>
   								</div>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                   
                 </div>
              </div>
        </section>
        <div class="product_list">
			<c:forEach var="product" items="${ productlist }">
				<div class="product_item">
					<img src="resources/product_img/${product.productimage_path}"
						alt="${product.productname}" width="300" height="300"
						onclick="location.href='productdetail.do?productnum=${product.productnum}'">
           		 	<h2>${product.productname}</h2>
           		 	<p>${product.content}</p>
            		<p>${product.price}원</p>
				</div>
			</c:forEach>
		</div>
        
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>

<h1>
	
	안녕하세요   
	환영합니다
	<!--비로그인시-->
	<c:if test="${login == null }">
		<a href="join_form.do">회원가입</a>
		<a href="login_form.do">로그인</a>
		<a href="write_form.do">게시판 글쓰기</a>
	</c:if>
	<!-- 로그인시 -->
	<c:if test="${login != null }">
		<a href="mypage.do">마이페이지</a>
		<a href="logout.do">로그아웃</a>
		<a href="orderinfo.do">주문정보</a><!-- 구현예정 -->
		<a href="delete_form.do">회원탈퇴</a><!-- 마이페이지안에 넣기 -->
		<a href="cartlistview.do">장바구니</a>
		<!-- 따로 탭 넣어야함 -->
		<!-- 게시판 구현해야함 -->
	</c:if>
	<!-- 추후에 네비게이션 바를 이용해 카테로리로 상품을 나열 -->
	
	
	<!-- ㅁㅁ관리자 로그인 페이지를 따로 만들지 고민중ㅁㅁ 관리자 로그인시 관리자 페이지로 이동 -->
	<c:if test="${login != null && login.memberid == 'admin' }">
		관리자페이지<!-- ㅁㅁㅁㅁㅁㅁㅁㅁㅁ관리자 페이지 추가 예정 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ-->
		<a href="productadd_form.do">상품추가페이지</a>
		<a href="productdelte_form.do">상품삭제페이지</a>
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
