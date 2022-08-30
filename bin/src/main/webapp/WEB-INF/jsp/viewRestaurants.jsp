<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>餐廳總覽</title>
</head>
<script>
	$.ajax({
		type : 'post',
		url : 'http://localhost:8080/my-app/restaurant/viewRestaurants',
		data : JSON.stringify(
			{
				"name" : name,
				"address" : address,
				"phone" : phone,
				"startDate" : startDate,
				"endDate" : endDate,
				"startTime" : startTime,
				"endTime" : endTime,
				"fk_type_id" : RestaurantType,
				"fk_user_id" : Users,
			}
		),
		contentType : 'application/json; charset=UTF-8',
		dataType : 'json',
		success : function(data) {

		}

	})
</script>
<body>
	<h1>餐廳總覽頁面</h1>
	<form action="${contextRoot}/restaurant/search" method="get">
		搜尋:<input type="text" name="keyword" placeholder="想要搜尋的餐廳">
		<button>GO</button>
	</form>

	<table id="dishes" class="table table-striped table-hover">
		<thead>
			<tr>
				<th hidden="hidden">#</th>
				<th>店家帳號</th>
				<th>店家名稱</th>
				<th>店家地址</th>
				<th>店家電話</th>
				<th>營業開始時間</th>
				<th>營業結束時間</th>
				<th>營業開始時間</th>
				<th>營業結束時間</th>
				<th>設定</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="restaurant" items="${allRestaurant}">
				<tr>
					<td>${restaurant.users.account}</td>
					<td>${restaurant.name}</td>
					<td>${restaurant.address}</td>
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
	</table>
</body>
</html>