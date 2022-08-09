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
<title>餐廳新增頁面</title>
</head>
<body>
	<h1>新增頁面測試</h1>

	<div class="m-5">
		<form action="${contextRoot}/uploadRestaurant" method="post"
			enctype="multipart/form-data">
			<div>
				餐廳名稱： <input type="text" name="restaurantName" required />
			</div>
			<div>
				餐廳電話： <input type="text" name="restaurantPhone" required />
			</div>
			<div>
				餐廳地址： <input type="text" name="restaurantAddress" required />
			</div>
			<div>
				餐廳類別： <select name="type">
					<option value="">請選擇餐廳類別</option>
					<option value="tw">台式</option>
					<option value="jp">日式</option>
					<option value="america">美式</option>
					<option value="italy">義式</option>
					<option value="vietnam">越式</option>
					<option value="tailand">泰式</option>
				</select>
			</div>
			<div>
				營業時間： <select name="startDate">
					<option value="Sun">星期日</option>
					<option value="Mon">星期一</option>
					<option value="Tue">星期二</option>
					<option value="Wed">星期三</option>
					<option value="Thu">星期四</option>
					<option value="Fri">星期五</option>
					<option value="Sat">星期六</option>
				</select>～ <select name="endDate">
					<option value="Sun">星期日</option>
					<option value="Mon">星期一</option>
					<option value="Tue">星期二</option>
					<option value="Wed">星期三</option>
					<option value="Thu">星期四</option>
					<option value="Fri">星期五</option>
					<option value="Sat">星期六</option>
				</select> <input type="time" name="startTime" required>～ <input
					type="time" name="endTime" required>
			</div>
			<div>備註:<br />
			<textarea id="remark" name="remark" rows="5" cols="33"></textarea>
			</div>
			<button type="submit">新增</button>
		</form>
	</div>
</body>
</html>