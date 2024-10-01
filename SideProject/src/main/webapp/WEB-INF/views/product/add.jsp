<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script>
	function send(f){
		
		let productname = f.productname.value;
		let price = f.price.value;
		let content = f.content.value;
		let productimage = f.productimage.value;
		
		if( productname == '') {
			alert("상품 이름을 입력하세요");
			return;
		}
		if( price == '') {
			alert("가격을 입력하세요");
			return;
		}
		if( content == '') {
			alert("상품 설명을 입력하세요");
			return;
		}
		if( productimage == '') {
			alert("사진을 선택하세요");
			return;
		}
		
		f.action = "productadd.do";
		f.submit();
		
	}
	</script>
<body>
<%@ include file="/WEB-INF/views/layout/header_main.jsp"%>
    
	<div class="form-section">
		<h2>상품 정보 입력</h2>
		<form method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<td>상품 이름</td>
					<td><input type="text" name="productname"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><input type="text" name="content"></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="productimage"></td>
				</tr>
			
				<tr>
   					<td><label for="quantity">재고 수량 선택:</label></td>
   					 <td>
   					 	<select id="quantity" name="productquantity">
          	  				<% for (int i = 1; i <= 100; i++) { %>
           	     				<option value="<%= i %>"><%= i %></option>
            				<% } %>
        			  	</select>
        			  	<input type="button" value="상품등록" onclick="send(this.form);">
   					 </td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>