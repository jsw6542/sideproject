<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
  </script>
  
<script>
	//장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		form.bookCount = $(".quantity_input").val();
		$.ajax({
			url: '/cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				cartAlert(result);
			}
		})
	});

	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
				
			
</script>

<body>
	<div class = "productlist">
		<h2>
			상품명 : ${ProductVO.name}
		</h2>
		<h2>
			가격 : ${ProductVO.price}
		</h2>
	</div>	

	<div class="button_set">
   		<a class="btn_cart">장바구니 담기</a>
    	<a class="btn_buy">바로구매</a>
	</div>
		

</body>
</html>