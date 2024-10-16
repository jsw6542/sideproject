<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
</head>
<body>
<div class="form-section">
    <h2>상품 정보 수정</h2>
    <form method="POST" enctype="multipart/form-data" action="updateProduct.do">
        <table>
            <tr>
                <td>상품 이름</td>
                <td><input type="text" name="productname" value="${product.productname}"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" name="price" value="${product.price}"></td>
            </tr>
            <tr>
                <td>설명</td>
                <td><input type="text" name="content" value="${product.content}"></td>
            </tr>
            <tr>
                <td>사진</td>
                <td><input type="file" name="productimage">
                    <img src="${product.imagePath}" alt="Product Image" width="100"> <!-- 기존 이미지 표시 -->
                </td>
            </tr>
            <tr>
                <td><label for="quantity">재고 수량 선택:</label></td>
                <td>
                    <select id="quantity" name="productquantity">
					    <c:forEach var="i" begin="1" end="100">
					        <option value="${i}" ${i == product.quantity ? 'selected' : ''}>${i}</option>
					    </c:forEach>
					</select>
                    <input type="submit" value="상품수정">
                </td>
            </tr>
        </table>
        <input type="hidden" name="productid" value="${product.productid}">
    </form>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>