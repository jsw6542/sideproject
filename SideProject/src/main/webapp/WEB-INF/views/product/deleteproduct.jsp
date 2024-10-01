<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>상품삭제페이지 삭제페이지가 필요할까? 페이지 없이 삭제버튼으로 한번에 처리가능</title>
		
		<script src="/sideproject/resources/js/httpRequest.js"></script>
		
		<script>
			function send(f) {
				
				let name = f.productname.value;
				let num = f.productnum.value;
				
				
				
				if( !confirm('삭제 하시겠습니까?') ){
					return;
				}
				
				let url= "delete.do";
				let param = "productname="+name+"&productnum="+num;			
				sendRequest(url, param, resultFn, "post");
				
			}
		
			function resultFn() {
	
				
				if(xhr.readyState == 4 & xhr.status == 200) {
					
					let data = xhr.responseText;
					
					
					if(data == 'no') {
						alert("삭제 실패");
						return;
					}
					
					alert("삭제 완료!");
					location.href="productlist.do";
				}
			}
		</script>
		
	</head>
	
	<body>
	<form>
	<input type="hidden" name="productnum" value="${product.productnum}">
	<input type="hidden" name="pwd" value="${login.pwd}">
		<table>
			<caption>상품삭제</caption>
				
				<tr>
					<td>삭제할 상품 이름</td>
					<td><input type="text" name="productname"></td>
				</tr>
				
				<tr>
					<td>
					<input type = "button" value="삭제하기" onclick="send(this.form);">
					</td>
				</tr>
				
				
		</table>
	</form>
	</body>
</html>