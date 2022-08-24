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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
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
<<<<<<< HEAD
  						$(".card").append('<img width="300" height="300" class="img-thumbnail" class="card-img-top" src=' + imgsrc + ' />')
  						          .append('<strong><font size="5">' + this.dishName + '</strong>')
  						          .append('<td><i><u><font size="3">' + "$" + this.dishPrice + '</td>')
  						          .append('<button type="button" class="btn btn-danger">Add Shopping Cart!</button>')
=======
  						var col=$('<div class="col"></div>')
  						var card=$('<div class="card" id="card1"</div>')
  						card.append('<img width="400px" height="150px"  class="card-img-top" id="img1" src=' + imgsrc + ' />')
  							.append('<p style="display:none;">' + this.dishId)
				          	.append('<strong id="strong1">' + this.dishName + '</strong>')
					        .append('<i id="i1" />' + "$" + this.dishPrice)
					        .append('<button id="button1" type="button" class="btn btn-danger">Add Shopping Cart!</button>')
					    col.append(card)
  						$(".row").append(col)
  								  
>>>>>>> Dish5
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
<<<<<<< HEAD
<div class="py-5 text-center container">
	<h1>${restaurant.name} 菜單</h1>
	<input type="hidden" id="restaurantId" value="${restaurant.id}">
	
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
		<div class="col">
			<div class="card" style="border:15px #cccccc groove;" cellpadding="10" border='0'>
<!--          <img width: "50px", height: "50px" class="img-thumbnail" src="" class="card-img-top">  -->
				<img width="0" height="0" src="" class="card-img-top">
			</div>
=======
	<div class="py-5 text-center container">
		<h1>${restaurant.name} 菜單</h1>
		<input type="hidden" id="restaurantId" value="${restaurant.id}">
		<div class="album py-4 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				</div>
>>>>>>> Dish5
			</div>
		</div>
		</div>
		</div>
		</div>
		
<!-------------------------------------------------------------------------------------------------------->	
		
		<h2>評論</h2>
		
		<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">No.</th>
				<th scope="col">帳號</th>
				<th scope="col">評論內容</th>
				<th scope="col">評論時間</th>
			</tr>
		</thead>
		<tbody>
		
			<tr>
				<th scope="row">1</th>
				<td>${comment.id}</td>
				<td>${comment.comments}</td>
				<td>${comment.time}</td>
			</tr>
			
		</tbody>
	</table>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
<jsp:include page="layout/footer.jsp" />
</html>