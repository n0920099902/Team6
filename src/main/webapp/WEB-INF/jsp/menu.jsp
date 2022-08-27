<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="layout/navbar.jsp" />
<html>
	<head>
  		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="author" content="" />
        <link rel="icon" href="${pageContext.request.contextPath}/imgages/shortcut.ico">
		<title> Menu </title>
		<link href="../../css/font-awesome.min.css" rel="stylesheet" />
		<link href="../../css/style.css" rel="stylesheet" />
		<link href="../../css/responsive.css" rel="stylesheet" />
	</head>
	<body>
		<section class="food_section layout_padding">
			<div class="container">
				<input type="hidden" id="restaurantId" value="${restaurant.id}">
	      		<div class="heading_container heading_center">
	        		<h2> ${restaurant.name} Menu </h2>
	      		</div>
	      		
	      		<div class="filters-content">
	        		<div class="row grid">
	        		</div>
	      		</div>
	     	</div>
	     </section>
		
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
	
<!-------------------------------------------------------------------------------------------------------->	
	
</body>
	<script>
		$(document).ready(function() {
			var restId = $("#restaurantId").val();
			listDishesForRest(restId);
			
			function listDishesForRest(restId) {
				$.ajax({
	  	            url: "http://localhost:8080/my-app/dish?showMode=portal&restId=" + restId,
	  	            type: "GET",
	  	            dataType: "JSON",
	  	            contentType : "application/json; charset=utf-8",
	  	            success: function (data, status){
	  					$(data).each(function () {
	  						console.log(data)
	  						var imgsrc = "data:image/png;base64," + this.dishPhoto;
	  						
	  						var detail_box=$('<div class="detail-box"></div>')
	  						detail_box.append('<h5>' + this.dishName + '</h5>')
	  								  .append('<div class="options">' + "$" + this.dishPrice + '<button type="button" class="btn btn-danger">加入購物車</button>' +'</div>')
	  						
	  						var img_box=$('<div class="img-box"></div>')
	  						img_box.append('<img src=' + imgsrc + ' />')
	  						
	  						var box=$('<div class="box"></div>')
	  						box.append(img_box)
	  						   .append(detail_box)
	  						
	  						var category=$('<div class="col-sm-6 col-lg-4"></div>')
	  						category.append(box)
	  						
	  						$('.row').append(category)
	  					});	
	  	            },
	  	            error: function (xhr, desc, err){
	  	            	console.log(desc);
	  	            	console.log(err);
	  	            }
	  	        });
			}
		});
	</script>
<jsp:include page="layout/footer.jsp" />
</html>