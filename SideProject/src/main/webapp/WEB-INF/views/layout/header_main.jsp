<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아르카나 메인 페이지</title>


<style>
    .nav-item form {
        margin-bottom: 0; /* form 요소의 마진 제거 */
    }
    .nav-item button {
        margin-right: 10px; /* 버튼 간격 일정하게 설정 */
    }
	/* #cartButton {
        margin-top: 16px; /* 버튼 위쪽에 10px 여백 추가 */
    } */
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">    
</head>
<body>
	<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">아르카나</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="home.do">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="productlist.do">전체상품</a></li>
                    </ul>
                    
                    
                    
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    
                     
                       
                            <!-- 비로그인 상태 -->
                            <c:if test="${login == null }">
                            <li class="nav-item">
                                <form class="d-flex" action="login_form.do" method="get">
                                    <button class="btn btn-outline-dark" type="submit">
                                        로그인
                                    </button>
                                </form>
                            </li>
                            <li class="nav-item">
                                <form class="d-flex" action="join_form.do" method="get">
                                    <button class="btn btn-outline-dark " type="submit">
                                        회원가입
                                    </button>
                                </form>
                            </li>
                            </c:if>
                            <!-- 로그인 상태 -->
                            <li class="nav-item">
                            <c:if test="${login != null && login.memberid == 'admin' }">
                            	<form class="d-flex" action="adminpage.do" method="get">
                                    <button class="btn btn-outline-dark " type="submit">
                                        관리자페이지
                                    </button>
                                </form>
                            </c:if>
                            </li>
                            <c:if test="${login != null }">
                            <li class="nav-item">
                                <form class="d-flex" action="logout.do" method="get">
                                    <button class="btn btn-outline-dark " type="submit">
                                        로그아웃
                                    </button>
                                </form>
                            </li>
                            <li class="nav-item">
                                <form class="d-flex" action="mypage.do" method="get">
                                    <button class="btn btn-outline-dark " type="submit">
                                        마이페이지
                                    </button>
                                </form>
                            </li>
                            </c:if>
                            
                            <!-- 게시판 페이지 가기로 변경해야함 -->
                            <li class="nav-item">
                                <form class="d-flex" action="boardlist.do" method="get">
                                    <button class="btn btn-outline-dark " type="submit">
                                        게시판
                                    </button>
                                </form>
                     
                            </li>

                </ul>
                <!-- Cart Button -->
                <form class="d-flex" method="POST" action="cartlistview.do">
    				<!-- hidden input 필드를 통해 memberid를 서버로 전송 -->
   					<input type="hidden" id="memberidinput" name="memberid" value="${login.memberid}">
   					<!-- 장바구니 버튼 클릭 시 form이 제출되도록 수정 -->
    				<button id="cartButton" class="btn btn-outline-dark" type="submit">
        			Cart
    				</button>
				</form>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">아르카나</h1>
                    <p class="lead fw-normal text-white-50 mb-0">다양한 인형들을 만나보세요!</p>
                </div>
            </div>
        </header>
 <!-- Bootstrap core JS -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>
    
     <!-- Custom JS for Cart Button -->
    
</body>
</html>




	
