<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="layout/navbar.jsp" />
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon"
	href="${pageContext.request.contextPath}/imgages/shortcut.ico">
<title>Menu</title>
<link href="../../css/font-awesome.min.css" rel="stylesheet" />
<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/responsive.css" rel="stylesheet" />
</head>
<body>
	<!-- 		<section class="food_section layout_padding"> -->
	<!-- 			<!-- 	取得餐廳ID -->
	
	<%-- 	<input type="number" id="rID" name="rID" value="${rid }" hidden="" > --%>



	<!-- 			<div class="container"> -->
	<%-- 				<input type="hidden" id="restaurantId" value="${restaurant.id}" > --%>
	<!-- 				<div class="heading_container heading_center"> -->
	<%-- 					<h2> ${restaurant.name} Menu </h2> --%>
	<!-- 				</div> -->
	<!-- 			<div>	<a href="" id="keepBuy"><button>送出訂單</button></a> </div> -->
	<!-- 				<div id="categories" class="heading_container heading_center"> -->

	<!-- 				</div> -->
	<!-- 				<div class="filters-content"> -->
	<!-- 					<div class="row grid"> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<section>
		<div>	
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
	var rid = document.getElementById('rID').value;
	sessionStorage.setItem('rID', JSON.stringify(rid));
	//訂單session
	var buy = JSON.parse(sessionStorage.getItem('buy'));

	$(document)
			.ready(
					function() {
						var restId = $("#restaurantId").val();
						listDishesForRest(restId);
						getComments(restId);
						

			
	//顯示評論
	function getComments(restId) {
		$
				.ajax({
					url : "http://localhost:8080/my-app/comment?restId="
							+ restId,
					type : "GET",
					dataType : "JSON",
					contentType : "application/json; charset=utf-8",
					success : function(data, status) {
						console.log(data);
						$(data)
								.each(
										function(index, element) {
											//                     	  var cmt = '<p>'+element.id+'</p>';

											var str = '';
											for (let i = 0; i < element.score; i++) {
												str += '<img alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">';
											}
											var cmt = '<tr>' + '<td>'
													+ element.accountName
													+ '</td>' + '<td>'
													+ element.comments
													+ '</td>' + '<td>' + str
													+ '</td>' + '<td>'
													+ element.time + '</td>'
													+ '</tr>';

											$('#commentBody').append(cmt);
										});
					},
					error : function(xhr, desc, err) {
						console.log(desc);
						console.log(err);
					}
				});
	}
</script>
<jsp:include page="layout/footer.jsp" />
</html>
<script type="text/javascript">
	var rid = JSON.parse(sessionStorage.getItem('rID'));
	document.getElementById("rID").value = rid;

	document.getElementById("keepBuy").href = "${pageContext.request.contextPath}/cart/eidtOrder";
</script>