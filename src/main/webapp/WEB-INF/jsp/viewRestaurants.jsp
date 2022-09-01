<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- <jsp:include page="layout/navbar.jsp" /> --%>
<jsp:include page="layout/navbar2.jsp" />
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
		$('#restaurantsTable').DataTable({
			"lengthMenu" : [ 15, 5, 2, 1 ],
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

<head>
<meta charset="UTF-8">
<title>餐廳總覽</title>
</head>
<body>
	<h1>餐廳總覽頁面</h1>
	<%-- 	<form action="${contextRoot}/restaurant/search" method="get"> --%>
	<!-- 		搜尋:<input type="text" name="keyword" placeholder="想要搜尋的餐廳"> -->
	<!-- 		<button>GO</button> -->
	<%-- 	</form> --%>

	<table id="restaurantsTable" class="table table-striped table-hover"
		style="border: 3px #cccccc solid;">
		<thead style="background: lightgray" class="container">
			<tr class="col-md-center">
				<th scope="col">店家帳號</th>
				<th scope="col">店家名稱</th>
				<th scope="col">店家地址</th>
				<th scope="col">餐廳類別</th>
				<th scope="col">店家電話</th>
				<th scope="col">營業開始時間</th>
				<th scope="col">營業結束時間</th>
				<th scope="col">營業開始時間</th>
				<th scope="col">營業結束時間</th>
				<th scope="col">編輯</th>
				<th scope="col">刪除</th>
			</tr>
		</thead>
		<tbody class="container">
			<c:forEach var="restaurant" items="${allRestaurant}">
				<tr>
					<td>${restaurant.users.account}</td>
					<td>${restaurant.name}</td>
					<td>${restaurant.address}</td>
					<td>${restaurant.restaurantType.type}</td>
					<td>${restaurant.phone}</td>
					<td>${restaurant.startDate}</td>
					<td>${restaurant.endDate}</td>
					<td>${restaurant.startTime}</td>
					<td>${restaurant.endTime}</td>
					<td><a
						href="${contextRoot}/restaurant/editRestaurantPageByAdmin/${restaurant.id}">編輯</a></td>
					<td><a onclick="return confirm('確認刪除?')"
						href="${contextRoot}/restaurant/deleteRestaurant/${restaurant.id}">刪除</a></td>
				</tr>
			</c:forEach>
		</tbody>
		</tbody>
	</table>
</body>
</html>