<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/styles.css" rel="stylesheet"/>
     <style>
        /* 이미지 크기 조정 */
        .card-img-top {
            height: 150px;  /* 이미지 높이를 줄입니다. 필요에 따라 크기 조정 */
            object-fit: cover;  /* 이미지 비율을 유지하면서 자릅니다 */
        }

        /* 카드 내부 패딩 조정 */
        .card-body {
            padding: 1rem;  /* 패딩을 줄여 카드 높이를 줄입니다 */
        }

        /* 텍스트 크기 조정 */
        .card-body h5 {
            font-size: 1rem;  /* 제목 크기를 줄입니다 */
            margin-bottom: 0.5rem;
        }

        .card-body p {
            font-size: 0.875rem;  /* 설명 크기를 줄입니다 */
            margin-bottom: 0.5rem;
        }

        /* 카드 푸터 패딩 조정 */
        .card-footer {
            padding: 0.5rem;  /* 카드 푸터 패딩을 줄여 공간을 줄입니다 */
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <h1 class="text-center mb-4">상품 목록</h1>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach var="product" items="${productlist}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="resources/product_img/${product.productimage_path}"
                                 alt="${product.productname}" style="cursor: pointer;"
                                 onclick="location.href='productdetail.do?productnum=${product.productnum}'"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><c:out value="${product.productname}"/></h5>
                                    <!-- Product description-->
                                    <%-- <p><c:out value="${product.content}"/></p> --%>
                                    <!-- Product price-->
                                    <p><c:out value="${product.price}"/>원</p>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="productdetail.do?productnum=${product.productnum}">자세히 보기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- 페이지네이션 추가 -->
            <div class="d-flex justify-content-center mt-4">
                <p>${pageMenu}</p>
            </div>
        </div>
    </section>

    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
