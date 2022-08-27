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
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
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
  						var col=$('<div class="col"></div>')
  						var card=$('<div class="card" id="card1"</div>')
  						card.append('<img width="400px" height="150px"  class="card-img-top" id="img1" src=' + imgsrc + ' />')
  							.append('<p class="dishId" style="display:none;"name="dishId">'+ this.dishId + '</p>' )
				          	.append('<strong class="dishName">' + this.dishName + '</strong>')
					        .append('<i id="i1" class="dishPrice" />' + "$" + this.dishPrice)
					        .append('<button id="ssd" type="button" class="ssd cartBut">Add Shopping Cart!</button>')
					    col.append(card)
  						$(".row").append(col)	
												  
  					});	


	// var rid =document.getElementById('rID').value;
    // sessionStorage.setItem('rID', JSON.stringify(rid));
    
	// var buy  = JSON.parse(sessionStorage.getItem('buy'));
	
	// var mbuttons = document.getElementsByClassName('cartBut');
	// for (var i = 0; i < mbuttons.length; i++) {
	// 	mbuttons[i].addEventListener("click", add);
	// }

	$('.cartBut').click(function () {
		alert('加入購物車');
		//let dishName = $(this).find("strong1").text();
		let name = console.log($(this).parent().find(".dishName").text());
		let id = console.log($(this).parent().find(".dishId").text());
	
		let price = console.log($(this).parent().find(".dishPrice").text());

		let temp = -1;
		// var buttonId = event.target.id;
		// var rowId = buttonId.split("_")[1];

		// let name = document.getElementById('strong1' + rowId).value;
		// let id = +(document.getElementById('"dishId"'+ dishId).value);
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
	<a href="" id="keepBuy"><button>修改訂單</button></a> 
		<h1>${restaurant.name} 菜單</h1>
		<input type="hidden" id="restaurantId" value="${restaurant.id}">
		<div class="album py-4 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				</div>
			</div>
		</div>
	</div>
		
<!-------------------------------------------------------------------------------------------------------->	
		
		<h2>評論</h2>
		
		<table id="retailerTable" class="table table-striped">
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
	<script type="text/javascript">
		$(document).ready( function () {
		   $('#retailerTable').DataTable(
			{  
				 "lengthMenu":[10, 5, 2, 1],
				 "language": {
				  "lengthMenu": "顯示 MENU 項結果",
				  "search": "搜尋:",
				  "info": "顯示第 START 至 END 項結果，共 TOTAL 項",
				  "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
				  "paginate": {
						 "first": "第一頁",
						 "previous": "上一頁",
						 "next": "下一頁",
						 "last": "最後一頁"
					 }
					
				 }
			   }); 
		} );
	   </script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</body>

<jsp:include page="layout/footer.jsp" />
</html>
<script type="text/javascript">
var rid  = JSON.parse(sessionStorage.getItem('rID'));
document.getElementById("rID").value=rid;

document.getElementById("keepBuy").href = "${pageContext.request.contextPath}/cart/eidtOrder"+rid;
</script>