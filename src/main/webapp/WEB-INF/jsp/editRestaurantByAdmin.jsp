<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<jsp:include page="layout/navbar2.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<style type="text/css">
.register-photo {
	background: #f1f7fc;
	padding: 80px 0;
}

.register-photo .image-holder {
	display: table-cell;
	width: auto;
	background: url("${contextRoot}/img/memberadd.jpg");
	background-size: cover;
}

.register-photo .form-container {
	display: table;
	max-width: 900px;
	width: 90%;
	margin: 0 auto;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
}

.register-photo form {
	display: table-cell;
	width: 400px;
	background-color: #ffffff;
	padding: 40px 60px;
	color: #505e6c;
}

@media ( max-width :991px) {
	.register-photo form {
		padding: 40px;
	}
}

.register-photo form h2 {
	font-size: 24px;
	line-height: 1.5;
	margin-bottom: 30px;
}

.register-photo form .form-control {
	background: #f7f9fc;
	border: none;
	border-bottom: 1px solid #dfe7f1;
	border-radius: 0;
	box-shadow: none;
	outline: none;
	color: inherit;
	text-indent: 6px;
	height: 40px;
}

.register-photo form .form-check {
	font-size: 13px;
	line-height: 20px;
}

.register-photo form .btn-primary {
	background: #f4476b;
	border: none;
	border-radius: 4px;
	padding: 11px;
	box-shadow: none;
	margin-top: 35px;
	text-shadow: none;
	outline: none !important;
}

.register-photo form .btn-primary:hover, .register-photo form .btn-primary:active
	{
	background: #eb3b60;
}

.register-photo form .btn-primary:active {
	transform: translateY(1px);
}

.register-photo form .already {
	display: block;
	text-align: center;
	font-size: 12px;
	color: #6f7a85;
	opacity: 0.9;
	text-decoration: none;
}
</style>
<meta charset="UTF-8">
<title>餐廳修改頁面</title>
</head>
<body>
	<div class="register-photo">
		<div class="form-container">
			<div class="image-holder"></div>


			<form:form action="${contextRoot}/restaurant/editRestaurantAdmin"
				modelAttribute="restaurant" method="post"
				enctype="multipart/form-data">
				<h2 class="text-center">
					<strong>修改餐廳資料</strong>
				</h2>
				<form:hidden path="users.id" />
				<form:hidden path="id" />
				<table>
					<tr>
						<td>餐廳名稱：&nbsp;${restaurant.name } <form:hidden path="name" /></td>
					</tr>
					<tr>
						<td>餐廳電話：<form:input path="phone" /></td>
					</tr>
					<tr>
						<td>餐廳地址：<form:input path="address" /></td>
					</tr>
				</table>
				<div>
					餐廳類別：
					<form:select path="restaurantType.id">
						<form:option value="-1" label="請挑選" />
						<form:options items="${allRestaurantType}" itemLabel='type'
							itemValue='id' />
					</form:select>
				</div>
				<div>
					營業時間：
					<form:select path="startDate">
						<form:option value="-1" label="請挑選" />
						<form:options items="${DateMap}" />
					</form:select>
					～
					<form:select path="endDate">
						<form:option value="-1" label="請挑選" />
						<form:options items="${DateMap}" />
					</form:select>
					<form:input type="time" path="startTime" min="0:00" max="23:59" />
					～
					<form:input type="time" path="endTime" />
				</div>
				<div>
					餐廳圖片:
					<form:input type="file" path="Image" onchange="openFile(event)" />
				</div>
				<img id="output" height="200" style="display: none">
				<div class="form-group">
					<form:button class="btn btn-primary btn-block" type="submit">修改</form:button>
				</div>
			</form:form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function openFile(event) {
		var input = event.target; //取得上傳檔案
		var reader = new FileReader(); //建立FileReader物件

		reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串

		reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
			var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
			$('#output').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
		};
	}
</script>
</html>