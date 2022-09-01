<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="layout/navbar.jsp" />
<html>

	<head>
		<title> Comment </title>
		<link href="../../css/font-awesome.min.css" rel="stylesheet" />
		<link href="../../css/style.css" rel="stylesheet" />
		<link href="../../css/responsive.css" rel="stylesheet" />
	</head>
	<body>
		<section class="food_section layout_padding">
			<!-- 	取得餐廳ID -->
			<input type="number" id="rID" name="rID" value="${rid}" hidden="" >
			<div class="container">
				<input type="hidden" id="restaurantId" value="${restaurant.id}" >
				<div class="heading_container heading_center">
					<h2> ${restaurant.name} 評論 </h2>
				</div>
				<div class="heading_container heading_center">
				</div>
				<ul id="categories" class="v-effect-link">
				</ul>
				<div class="filters-content">
					<div class="row grid">
					</div>
				</div>
					<h2>Comment</h2>
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
	
		$(document).ready(function() {
			var restId = $("#restaurantId").val();
			listDishesForRest(restId);
	        getComments(restId);
		
			
			function listDishesForRest(restId, categoryId) {
				var url = "http://localhost:8080/my-app/dish?showMode=portal&restId=" + restId

					$.ajax({
	  	            url: url,
	  	            type: "GET",
	  	            dataType: "JSON",
	  	            contentType : "application/json; charset=utf-8",
	  	            success: function (data, status){
	  	            	if (data.length == 0) {
	  	            		$('.row').append('<div class="col-sm-4"></div><div class="col-sm-4"><h1>商品即將上架</h1></div>')
	  	            	}
	  					$(data).each(function () {
	  						console.log(data)
					
	  					});	

	 	
	$('.cartBut').click(function() {
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