<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>아르카나</title>
	
	<style>
	#cartButton {
   	 	position: relative;
  	 	top: 8px; /* 원하는 위치로 조정 */
	}
	</style>
</head>
<body>
<div class="wrapper">
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

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</div>
</body>
</html>
