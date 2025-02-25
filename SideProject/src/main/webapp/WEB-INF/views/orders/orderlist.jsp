<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 목록</title>
		
	</head>
<body>
<div class="container mt-4">
    <div class="row">
        <c:forEach var="order" items="${orderlist}">
            <div class="col-md-12 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-dark text-white">
                        <h5 class="mb-0">주문번호: ${order.ordernum}</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>주문자:</strong> ${order.buyername}</p>
                        <p><strong>배송지:</strong> ${order.buyeradress1} ${order.buyeradress3}</p>
                        <p><strong>구매날짜:</strong> ${order.paymenttime}</p>
                        <p><strong>배송현황:</strong>
                            <c:choose>
                                <c:when test="${order.result == 1}">배송 준비</c:when>
                                <c:when test="${order.result == 2}">배송 중</c:when>
                                <c:when test="${order.result == 3}">배송 완료</c:when>
                                <c:otherwise>정보 없음</c:otherwise>
                            </c:choose>
                        </p>

                        <hr>

                        <h6>주문 상품 목록:</h6>
                        <c:forEach var="item" items="${order.items}">
                            <div class="d-flex align-items-center mb-2">
                                <img src="resources/product_img/${item.productimage_path}" alt="${item.productname}" class="img-thumbnail me-3" width="80">
                                <div>
                                    <p class="mb-1"><strong>${item.productname}</strong></p>
                                    <p class="mb-0">수량: ${item.quantity}개 | 가격: ${item.totalprice}원</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS -->
    <script src="js/scripts.js"></script>

    <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</div>
</body>

</html>


