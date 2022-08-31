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
	<h1>修改頁面測試</h1>

	<div class="m-5">
		<form:form action="${contextRoot}/restaurant/editRestaurantAdmin"
			modelAttribute="restaurant" method="post"
			enctype="multipart/form-data">
			uID: ${restaurant.users.id }<form:hidden path="users.id" />
			<br />
			rID: ${restaurant.id }<form:hidden path="id" />
			<br/>
			rtID: ${restaurant.restaurantType.id }

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
			<!-- 						<div> -->
			<!-- 				備註:<br /> -->
			<%-- 				<form:textarea id="remark" path="remark" rows="5" cols="33"></form:textarea> --%>
			<!-- 			</div> -->
			<button type="submit">修改</button>
		</form:form>
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