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
		action="${contextRoot}/message/editMessage">

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
			餐廳類別:
			<form:select path="type" value="${restaurant.type }">
				<form:options itemValue="${restaurant.type }"></form:options>
			</form:select>
		</div>
		營業時間:<form:select type="date" path="startDate" value="${startDate }" />
		<form:select type="date" path="endDate" value="${endDate }" />
		<%-- 		<form:select type="time" path="startTime" value="${startTime }" /> --%>
		<%-- 		<form:input type="time" path="endTime" value="${endTime }" /> --%>
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