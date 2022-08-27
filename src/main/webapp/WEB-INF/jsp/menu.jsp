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

<script>
	$(document).ready(function() {
		var restId = $("#restaurantId").val();
		console.log(restId);
		listDishesForRest(restId);
		getComments(restId);
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
		
		function getComments(restId) {
			$.ajax({
  	            url: "http://localhost:8080/my-app/comment?restId=" + restId,
  	            type: "GET",
  	            dataType: "JSON",
  	            contentType : "application/json; charset=utf-8",
  	            success: function (data, status)
  	            {
  					$(data).each(function (index) {
						var cmt = '<tr>'+				
										'<td>' + this.accountName + '</td>'+
										'<td>' + this.comments + '</td>'+
										'<td>' + this.time + '</td>'+
								  '</tr>';
							
						$('#commentBody').append(cmt);							  
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

			<div class="container">
				<input type="hidden" id="restaurantId" value="${restaurant.id}">
				<div class="heading_container heading_center">
					<h2> ${restaurant.name} Menu </h2>
				</div>
			
				<div class="filters-content">
					<div class="row grid">
					</div>
				</div>
				<h2>評論</h2>
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">帳號</th>
							<th scope="col">評論內容</th>
							<th scope="col">評論時間</th>
						</tr>
					</thead>
					<tbody id="commentBody">
					</tbody>
				</table>
			</div>
</section>

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