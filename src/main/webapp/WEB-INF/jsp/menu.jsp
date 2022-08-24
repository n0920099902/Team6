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

<style>

 .card{
 	   margin-bottom: 30px;
}
	 
 #card1{
   		border-style: ridge;
 		border-radius: 23px;
	 	border-color: #FF7575;
	 	border-width: 8px;
}	 
 
 #img1{
 		border-radius: 100px;
 		
}

 #strong1{
		  font-size: 25px;
}

#i1{
	font-size: 15px;
	text-decoration: underline;
}
 
 #button1{
 		  border-radius: 100px;
}

 
</style>
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
  						var col=$('<div class="col"></div>')
  						var card=$('<div class="card" id="card1"</div>')
  						card.append('<img width="400px" height="150px"  class="card-img-top" id="img1" src=' + imgsrc + ' />')
  							.append('<p style="display:none;">' + this.dishId)
				          	.append('<strong id="strong1">' + this.dishName + '</strong>')
					        .append('<i id="i1" />' + "$" + this.dishPrice)
					        .append('<button id="button1" type="button" class="btn btn-danger">Add Shopping Cart!</button>')
					    col.append(card)
  						$(".row").append(col)
  								  
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
		<div class="album py-4 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="layout/footer.jsp" />
</html>