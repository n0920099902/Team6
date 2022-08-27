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

    // var rid =document.getElementById('rID').value;
    // sessionStorage.setItem('rID', JSON.stringify(rid));
    
	var buy  = JSON.parse(sessionStorage.getItem('buy'));

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
	  						detail_box
							        //   .append('<h5 class="dishName" id="dishName">' + this.dishName + '</h5>')
	  								//   .append('<div class="dishPrice">' + "$" + this.dishPrice + '<button type="button" class="cartBut btn-danger">加入購物車</button>' +'</div>')
									//   .append('<p class="dishId" style="display:none;"name="dishId">'+ this.dishId + '</p>' )
									//   .append('<input id="quntity${d.id}" type="number" name="quantity" class="quantity" min="0"style="width: 20%; margin-right: 40%" value="1" required>')

									.append('<h5 class="dishId" style="display:none;"name="dishId">'+ this.dishId + '</h5>')
                                    .append('<h5 class="dishName">' + this.dishName + '</h5>')
									.append('<div class="dishPrice">' + "$" + this.dishPrice + '</div>')
									.append('<input id="quntity${d.id}" type="number" name="quantity" class="quantity" min="0"style="width: 20%; margin-right: 40%" value="1" required>')
									.append('<button type="button" class="cartBut btn-danger">加入購物車</button>')



							// .append('<p class="dishId" style="display:none;"name="dishId">'+ this.dishId + '</p>' )
				          	// .append('<strong class="dishName">' + this.dishName + '</strong>')
							// .append('<input id="quntity${d.id}" type="number" name="quantity" class="quantity" min="1">' + this.quantity +'</>')
					        // .append('<i id="i1" class="dishPrice" />' + "$" + this.dishPrice)
					        // .append('<button id="ssd" type="button" class="ssd cartBut">Add Shopping Cart!</button>')
	  						
							var img_box=$('<div class="img-box"></div>')
	  						img_box.append('<img src=' + imgsrc + ' />')
	  						
	  						var box=$('<div class="box"></div>')
	  						box.append(img_box)
	  						   .append(detail_box)
	  						
	  						var category=$('<div class="col-sm-6 col-lg-4"></div>')
	  						category.append(box)
	  						
	  						$('.row').append(category)
	  					});	


	// var rid =document.getElementById('rID').value;
    // sessionStorage.setItem('rID', JSON.stringify(rid));
    
	// var buy  = JSON.parse(sessionStorage.getItem('buy'));
	
	// var mbuttons = document.getElementsByClassName('cartBut');
	// for (var i = 0; i < mbuttons.length; i++) {
	// 	mbuttons[i].addEventListener("click", add);
	// }
	$('.cartBut').click(function() {
		alert('加入購物車');
		

		
		let name = console.log($(this).parent().find(".dishName").text());
		let id = console.log($(this).parent().find(".dishId").text());
	    let quantity = document.getElementById("quantity").value;
		//let price = console.log($(this).parent().find(".quantity").text());
	    let price = $(this).parent().find(".dishPrice").text().split("$")[1];

		let temp = -1;
		// var buttonId = event.target.id;
		// var rowId = buttonId.split("_")[1];

		// let name = document.getElementById('n' + rowId).value;
		// let id = +(document.getElementById('id' + rowId).value);
		// let quantity = +(document.getElementById('quantity' + rowId).value);
		// let price = +(document.getElementById('price' + rowId).value);



		var dish = {
			id: id,
			name : name,
			quantity : quantity,
			price : price
		};
				if(buy.length==0){
				buy.push(dish);
				}
				else{
					for(let i=0;i<buy.length;i++){
						var d=buy[i];
						if(dish.name==d.name){
							temp=1;
						}
					}
					if(temp==1){
						for(let i=0;i<buy.length;i++){
							var d=buy[i];
							if(dish.name==d.name){
								d.quantity+=dish.quantity;
							}
						}
					}
					if(temp==-1){
						buy.push(dish);
					}
				}

		sessionStorage.setItem('buy', JSON.stringify(buy));
// 		var obj = JSON.parse(sessionStorage.buy);

// 		alert(JSON.stringify(obj));
		document.getElementById('quantity' + rowId).value=1;

	})


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