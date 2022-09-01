<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	//DataTable
	$(document).ready(function() {
		$('#allRestaurantsTable').DataTable({
			"lengthMenu" : [ 10, 5, 2, 1 ],
			"language" : {
				"lengthMenu" : "顯示 MENU 項結果",
				"search" : "搜尋:",
				"info" : "顯示第 1 至 10 項結果，共 TOTAL 項",
				"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
				"scrollCollapse" : true,
				"scrollX" : "1000px",
				"scrollY" : "2000px",
				"paginate" : {
					"first" : "第一頁",
					"previous" : "上一頁",
					"next" : "下一頁",
					"last" : "最後一頁"
				}

			}
		});
	});
</script>
<jsp:include page="layout/navbar.jsp" />
<head>
<meta charset="UTF-8">
<title>餐廳總覽</title>
</head>
<script type="text/javascript">
	//Ajax顯示
	$(document).ready(function() {
		var settings = {
		"url" : "http://localhost:8080/my-app/restaurant/api/viewRestaurantBackPage",
		"method" : "GET",
		"timeout" : 0,
		"headers" : {
		"Content-Type" : "application/json"
	},
		"data" : JSON.stringify({
		"Name" : "name",
		"Address" : "address",
		"Phone" : "phone",
		"StartDate" : "startDate",
		"EndDate" : "endDate",
		"StartTime" : "startTime",
		"EndTime" : "endTime",
		"restaurantType" : "restaurantType",
		"users" : "users"
	}),
	};

		$.ajax(settings).done(function(response) {
		console.log(response);
	});
});

	// 		$(document).ready(function() {
	// 			$.ajax({
	// 				type : 'GET',
	// 				url : 'http://localhost:8080/my-app/restaurant/api/viewRestaurantBackPage',
	// 				contentType : 'application/json; charset=UTF-8',
	// 				dataType : 'json',
	// 				success : function(data) {
	// 					console.log(data);
	// 					$.each(data, function (index, value) {
	// 						var tr = "<tr>";
	// 						tr += '<td style="display:none;">' + value.id +'</td>'
	// 						tr += "<td>" + value.users.account +"</td>"
	// 						tr += "<td>" + value.name +"</td>"
	// 						tr += "<td>" + value.address +"</td>"
	// 						tr += "<td>" + value.restaurantType.type +"</td>"
	// 						tr += "<td>" + value.phone +"</td>"
	// 						tr += "<td>" + value.users.account +"</td></tr>"
	// 				},
	// 				error : function(data) {
	// 					console.log(data);
	// 				}
	// 			})
	// 		})
	// 	})

	//Ajax
	$(document)
			.ready(
					function() {
						$('#submitBtn')
								.click(
										function() {
											var name = document
													.getElementById('rName').value;
											var address = document
													.getElementById('rAddress').value;
											var phone = document
													.getElementById('rPhone').value;
											var startDate = document
													.getElementById('rStartDate').value;
											var endDate = document
													.getElementById('rEndDate').value;
											var startTime = document
													.getElementById('rStartTime').value;
											var endTime = document
													.getElementById('rEndTime').value;
											var restaurantType = document
													.getElementById('restaurantType').value;
											var users = document
													.getElementById('users').value;

											$
													.ajax({
														type : 'post',
														url : 'http://localhost:8080/my-app/restaurant/api/editRestaurantPageByAdmin',
														data : JSON
																.stringify({
																	"Name" : name,
																	"Address" : address,
																	"Phone" : phone,
																	"StartDate" : startDate,
																	"EndDate" : endDate,
																	"StartTime" : startTime,
																	"EndTime" : endTime,
																	"restaurantType" : restaurantType,
																	"users" : users,
																}),
														contentType : 'application/json',
														dataType : 'json',
														success : function(data) {
															Swal.fire('新增成功',
																	'',
																	'success')
															$(
																	'list_data_json tbody tr td')
																	.remove();
															renderData(data);
														},
														error : function(data) {
															console.log(data);
														}
													})
										})
					})
</script>
<body>
	<h1>餐廳總覽頁面</h1>
	<%-- 	<form action="${contextRoot}/restaurant/search" method="get"> --%>
	<!-- 		搜尋:<input type="text" name="keyword" placeholder="想要搜尋的餐廳"> -->
	<!-- 		<button>GO</button> -->
	<%-- 	</form> --%>

	<table id="restaurantsTable" class="table table-striped table-hover">
		<thead class="container">
			<tr class="col-md-center">
				<th hidden="hidden">#</th>
				<!-- 								<th scope="col">店家帳號</th> -->
				<th scope="col">店家名稱</th>
				<th scope="col">店家地址</th>
				<!-- 								<th scope="col">餐廳類別</th> -->
				<th scope="col">店家電話</th>
				<th scope="col">營業開始時間</th>
				<th scope="col">營業結束時間</th>
				<th scope="col">營業開始時間</th>
				<th scope="col">營業結束時間</th>
				<!-- 				<th scope="col">設定</th> -->
			</tr>
		</thead>
		<tbody>
			<tr>
				<!-- 				<td><input type="number" id="users"></td> -->
				<td><input type="text" id="rName"></td>
				<td><input type="text" id="rAddress"></td>
				<!-- 				<td><input type="number" id="restaurantType"></td> -->
				<td><input type="text" id="rPhone"></td>
				<td><select id="rStartDate">
						<option value="星期日">星期日</option>
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
				</select></td>
				<td><select id="rEndDate">
						<option value="星期日">星期日</option>
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
				</select></td>
				<td><input type="time" id="rStartTime"></td>
				<td><input type="time" id="rEndTime"></td>


				<!-- 		<tbody> -->
				<%-- 			<c:forEach var="restaurant" items="${allRestaurant}"> --%>
				<!-- 				<tr> -->
				<%-- 					<td>${restaurant.users.account}</td> --%>
				<%-- 					<td>${restaurant.name}</td> --%>
				<%-- 					<td>${restaurant.address}</td> --%>
				<%-- 					<td>${restaurant.restaurantType.type}</td> --%>
				<%-- 					<td>${restaurant.phone}</td> --%>
				<%-- 					<td>${restaurant.startDate}</td> --%>
				<%-- 					<td>${restaurant.endDate}</td> --%>
				<%-- 					<td>${restaurant.startTime}</td> --%>
				<%-- 					<td>${restaurant.endTime}</td> --%>
				<!-- 					<td><a -->
				<%-- 						href="${contextRoot}/restaurant/api/editRestaurantPageByAdmin/${restaurant.id}">編輯</a></td> --%>
				<!-- 					<td><a onclick="return confirm('確認刪除?')" -->
				<%-- 						href="${contextRoot}/restaurant/deleteRestaurant/${restaurant.id}">刪除</a></td> --%>
				<!-- 			</tr> -->
				<%-- 			</c:forEach> --%>
				<!-- 		</tbody> -->

			</tr>
		</tbody>
	</table>
	<button type="button" id="submitBtn">送出</button>


	<!--  顯示頁面 -->
	<table id="allRestaurantsTable" class="table table-striped table-hover">
		<thead class="container">
			<tr class="col-md-center">
				<th hidden="hidden">#</th>
				<th scope="col">店家帳號</th>
				<th scope="col">店家名稱</th>
				<th scope="col">店家地址</th>
				<th scope="col">餐廳類別</th>
				<th scope="col">店家電話</th>
				<th scope="col">營業開始時間</th>
				<th scope="col">營業結束時間</th>
				<th scope="col">營業開始時間</th>
				<th scope="col">營業結束時間</th>
				<th scope="col">設定</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

</body>
</html>