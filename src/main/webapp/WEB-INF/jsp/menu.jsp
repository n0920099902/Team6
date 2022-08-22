<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
	
<jsp:include page="layout/navbar.jsp" />

<html>
<head>
<meta charset="UTF-8">
<title>菜單</title>
</head>
<script>
	$(document).ready(function() {
		var restId = $("#restaurantId").val();
		console.log(restId);
		listDishesForRest(restId);
		function listDishesForRest(restId) {
			$.ajax({
  	            url: "http://localhost:8080/my-app/dish?showMode=portal&restId=" + restId,
  	            type: "GET",
  	            dataType: "JSON",
  	            contentType : "application/json; charset=utf-8",
  	            success: function (data, status)
  	            {
  					console.log(data);
  					$(data).each(function () {
  						var imgsrc = "data:image/png;base64," + this.dishPhoto;
  						$(".card").append('<img width: "50px", height: "50px" class="img-thumbnail" class="card-img-top" src=' + imgsrc + ' />')
  						.append('<button type="button">Add Shopping Cart!</button>')
  						
  					});
  	            },
  	            error: function (xhr, desc, err)
  	            {
  	            	console.log(desc);
  	            	console.log(err);
  	            }
  	        });
		}
		
	});	
</script>
<body>
<div class="py-5 text-center container">
	<h1>${restaurant.name} 菜單</h1>
	<input type="hidden" id="restaurantId" value="${restaurant.id}">
	
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<div class="col">
			<div class="card">
<!--          <img width: "50px", height: "50px" class="img-thumbnail" src="" class="card-img-top">  -->
				<img width: "50px", height: "50px" src="" class="card-img-top">
			</div>
		</div>
	</div>
</body>
<jsp:include page="layout/footer.jsp" />
</html>