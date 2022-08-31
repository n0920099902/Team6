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
			<!-- 	取得餐廳ID -->
	<input type="number" id="rID" name="rID" value="${rid }" hidden="" >



			<div class="container">
				<input type="hidden" id="restaurantId" value="${restaurant.id}" >
				<div class="heading_container heading_center">
					<h2> ${restaurant.name} Menu </h2>
				</div>
			<div>	<a href="" id="keepBuy"><button>送出訂單</button></a> </div>
				<div id="categories" class="heading_container heading_center">
					
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
							<th scope="col">評分</th>
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
    //返回餐廳繼續購買
    var rid =document.getElementById('rID').value;
    sessionStorage.setItem('rID', JSON.stringify(rid));
    //訂單session
	var buy  = JSON.parse(sessionStorage.getItem('buy'));
	
		$(document).ready(function() {
			var restId = $("#restaurantId").val();
			listDishesForRest(restId);
	        getComments(restId);
//底下程式碼還在做修改,請先不要去刪除			
// 			listAllDishCategories(restId);
			
// 			function listAllDishCategories(restId) {
// 				$.ajax({
// 	  	            url: "http://localhost:8080/my-app/dish/category?restId=" + restId,
// 	  	            type: "GET",
// 	  	            dataType: "JSON",
// 	  	            contentType : "application/json; charset=utf-8",
// 	  	            success: function (data, status)
// 	  	            {
// 	  					var div = $('#categories');
// 	  					$(data).each(function () {
// 	  						div.append('<h2>' + this.dishTypeCategory + '</h2>').append('<br>')
// 	                    });     
// 	  	            },
// 	  	            error: function (xhr, desc, err)
// 	  	            {
// 	  	            	console.log(desc);
// 	  	            	console.log(err);
// 	  	            }
// 	  	        })
// 			}
			
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
							detail_box.append('<h5 class="dishId" style="display:none;"name="dishId">'+ this.dishId + '</h5>')
									  .append('<h5 class="dishName">' + this.dishName + '</h5>')
									  .append('<div class="dishPrice">' + "$" + this.dishPrice + '</div>')
									  .append('<input id="quantity" type="number" name="quantity" class="quantity" min="0"style="width: 20%; margin-right: 40%" value="1" required>')
									  .append('<button type="button" class="cartBut btn-danger" id="c_'+this.dishId +'">加入購物車</button>')
					
	  						var img_box=$('<div class="img-box"></div>')
	  						img_box.append('<img src=' + imgsrc + ' />')
	  						
	  						var box=$('<div class="box"></div>')
	  						box.append(img_box)
	  						   .append(detail_box)
	  						
	  						var category=$('<div class="col-sm-6 col-lg-4"></div>')
	  						category.append(box)
	  						
	  						$('.row').append(category)

	  						
	  						return data;
	  					});	

	

	// var mbuttons = document.getElementsByClassName('cartBut');
	// for (var i = 0; i < mbuttons.length; i++) {
	// 	mbuttons[i].addEventListener("click", add);
	// }	
	$('.cartBut').click(function() {
		alert('加入購物車');
		// let name = console.log($(this).parent().find(".dishName").text());
		// let id = console.log($(this).parent().find(".dishId").text());

		let name = $(this).parent().find(".dishName").text();
		console.log(name);

		let id = $(this).parent().find(".dishId").text();
        console.log(id);
	    
		let quantity = $(this).parent().find(".quantity").val();
		console.log(quantity);
		
	    let price = $(this).parent().find(".dishPrice").text().split("$")[1];
		console.log(price);

		let photo = $(this).parent().parent().find("img").attr("src");
		console.log(photo);			
		// var buttonId = event.target.id;
		// var rowId = buttonId.split("_")[1];
		// let name = document.getElementById('n' + rowId).value;
		// let id = +(document.getElementById('id' + rowId).value);
		// let quantity = +(document.getElementById('quantity' + rowId).value);
		// let price = +(document.getElementById('price' + rowId).value);
		// var rid =document.getElementById('rID').value;
        // sessionStorage.setItem('rID', JSON.stringify(rid));
        var buy  = JSON.parse(sessionStorage.getItem('buy'));	
		let temp = -1;
		var dish = {
			id: id,
			name : name,
			quantity : quantity,
			price : price,
			photo : photo
		};
				if(buy.length==0){
					var buy=[];
				buy.push(dish);
				}
				else{
					for(let i=0;i<buy.length;i++){
						var d=buy[i];
						if(dish.id==d.id){
							temp=1;
						}
					}
					if(temp==1){
						for(let i=0;i<buy.length;i++){
							var d=buy[i];
							if(dish.id==d.id){
								d.quantity=parseInt(d.quantity)+parseInt(dish.quantity);
							}
						}
					}
					if(temp==-1){
						buy.push(dish);
					}
				}

			
		sessionStorage.setItem('buy', JSON.stringify(buy));
		var buy = JSON.parse(sessionStorage.buy);

		
		// alert(JSON.stringify(buy));
		// document.getElementById('quantity' + rowId).value=1;

	})
				


	  	            },
	  	            error: function (xhr, desc, err){
	  	            	console.log(desc);
	  	            	console.log(err);
	  	            }
	  	        });
			}
		});

		
	//顯示評論
	 function getComments(restId) {
            $.ajax({
                  url: "http://localhost:8080/my-app/comment?restId=" + restId,
                  type: "GET",
                  dataType: "JSON",
                  contentType : "application/json; charset=utf-8",
                  success: function (data, status)
                  {
                	  console.log(data);
                      $(data).each(function (index, element) {
//                     	  var cmt = '<p>'+element.id+'</p>';

                        var str = '';
                        for(let i=0;i<element.score;i++){
                        	str+='<img alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">';
                        }
                        var cmt = '<tr>'+                
                                        '<td>' + element.accountName + '</td>'+
                                        '<td>' + element.comments + '</td>'+
                                        '<td>' + str + '</td>'+
                                        '<td>' + element.time + '</td>'+
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

	</script>
<jsp:include page="layout/footer.jsp" />
</html>
<script type="text/javascript">
	var rid  = JSON.parse(sessionStorage.getItem('rID'));
	document.getElementById("rID").value=rid;
	
	document.getElementById("keepBuy").href = "${pageContext.request.contextPath}/cart/eidtOrder";
	</script>