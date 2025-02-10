<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>마이페이지</title>



</head>
<body>
    <%@ include file="/WEB-INF/views/layout/header_main.jsp" %>

    <div class="wrapper">
        <div class="container my-5">
            <div class="row">
                <!-- 사이드바 (내 정보, 주문 목록, 내가 작성한 글 탭) -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <ul class="nav flex-column nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link active" id="mypageinfo-tab" data-bs-toggle="pill" href="#mypage-info" role="tab" aria-controls="mypage-info" aria-selected="true">내 정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="orderhistory-tab" data-bs-toggle="pill" href="#orderhistory" role="tab" aria-controls="orderhistory" aria-selected="false">주문 목록</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="myposts-tab" data-bs-toggle="pill" href="myposts" role="tab" aria-controls="myposts" aria-selected="false">내가 작성한 글</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- 탭 내용 -->
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-body">
                            <div class="tab-content" id="mytabcontent">
                                <!-- 내 정보 탭 내용 -->
                                <div class="tab-pane fade show active" id="mypage-info" role="tabpanel" aria-labelledby="mypage-info-tab">
                                    <div class="mypage-container">
                                        <div class="mypage-item row">
                                            <div class="col-3"><strong>이름</strong></div>
                                            <div class="col-9">${login.membername}</div>
                                        </div>
                                        <div class="mypage-item row">
                                            <div class="col-3"><strong>가입날짜</strong></div>
                                            <div class="col-9">${login.regdate}</div>
                                        </div>
                                        <div class="mypage-item row">
                                            <div class="col-3"><strong>닉네임</strong></div>
                                            <div class="col-9">${login.nickname}</div>
                                        </div>
                                        <div class="mypage-item row">
                                            <div class="col-3"><strong>이메일</strong></div>
                                            <div class="col-9">${login.email1} @ ${login.email2}</div>
                                        </div>
                                        <div class="mypage-item row">
                                            <div class="col-3"><strong>주소</strong></div>
                                            <div class="col-9">${login.address1} ${login.address3}</div>
                                        </div>
                                        <div class="button-container text-center my-4">
                                            <a href="membermodify_form.do" class="btn btn-light">정보 수정하기</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- 주문 목록 탭 내용 --> <!-- 이름 다 수정해야함 -->
                                <div class="tab-pane fade" id="#orderhistory" role="tabpanel" aria-labelledby="orderhistory-tab">
                                    <div class="mypage-container">
                                        <h5>주문 목록</h5>
                                        <ul>
                                            <c:forEach var="order" items="${orderList}">
                                                <li>
                                                    <strong>주문번호:</strong> ${order.orderNumber} - 
                                                    <strong>상품명:</strong> ${order.productName} - 
                                                    <strong>가격:</strong> ${order.price}
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>

                                <!-- 내가 작성한 글 탭 내용 -->
                                <div class="tab-pane fade" id="myposts" role="tabpanel" aria-labelledby="myposts-tab">
                                    <div class="mypage-container">
                                        <h5>내가 작성한 글</h5>
                                        <ul>
                                            <c:forEach var="post" items="${myPosts}">
                                                <li>
                                                    <a href="boarddetail.do?boardidx=${post.boardidx}">${post.title}</a> 
                                                    <p>작성일: ${post.board_created_at}</p>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <%@ include file="/WEB-INF/views/layout/footer.jsp" %>
</body>
</html>