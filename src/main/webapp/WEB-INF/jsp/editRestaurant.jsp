<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<jsp:include page="layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>餐廳修改頁面</title>
</head>
<body>
	<h1>餐廳修改頁面測試</h1>
	<form:form class="form" method="post" modelAttribute="restaurant"
		action="${contextRoot}/restaurant/editRestaurant">

		<form:input type="hidden" path="id" />
		<div>
			餐廳名稱:
			<form:input type="text" path="name" value="${restaurant.name }" />
		</div>
		<div>
			餐廳電話:
			<form:input type="text" path="phone" value="${restaurant.phone }" />
		</div>
		<div>
			餐廳地址:
			<form:input type="text" path="address" value="${restaurant.address }" />
		</div>
		<div>
			餐廳類別: <select name="restaurantType">
				<c:forEach items="${allRestaurantType}" var="rt">
					<option value="${rt.rest_type_id}">${rt.rest_type}</option>
				</c:forEach>
			</select>
		</div>
		營業時間:
		<form:select type="date" path="startDate" value="${startDate }">
			<form:option value="Sun">星期日</form:option>
			<form:option value="Mon">星期一</form:option>
			<form:option value="Tue">星期二</form:option>
			<form:option value="Wed">星期三</form:option>
			<form:option value="Thu">星期四</form:option>
			<form:option value="Fri">星期五</form:option>
			<form:option value="Sat">星期六</form:option>
		</form:select>
		<form:select type="date" path="endDate" value="${endDate }">
			<form:option value="Sun">星期日</form:option>
			<form:option value="Mon">星期一</form:option>
			<form:option value="Tue">星期二</form:option>
			<form:option value="Wed">星期三</form:option>
			<form:option value="Thu">星期四</form:option>
			<form:option value="Fri">星期五</form:option>
			<form:option value="Sat">星期六</form:option>
		</form:select>
		<form:input type="time" path="starttime" />
		<form:input type="time" path="endtime" />
		<div>
			圖
			<form:input type="file" path="photo" />
		</div>
		<div>
			備註:<br />
			<form:textarea path="remark" value="${restaurant.remark }" />
		</div>
		<button type="submit">修改</button>
	</form:form>
</body>
<script>
	
</script>
</html>