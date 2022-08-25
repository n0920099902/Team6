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
		<form action="${contextRoot}/restaurant/editRestaurant"  name="restaurant" method="post"
			enctype="multipart/form-data">
			ID: ${member.id }<input type="hidden" name="id" value="${member.id}" />
			ID: ${restaurant.id }<input type="hidden" name="id" value="${restaurant.id}" />

			<div>
				餐廳名稱：<input type="text" name="restaurantName" value="${restaurant.name }"
					required />
			</div>
			<div>
				餐廳電話： <input type="text" name="restaurantPhone" value="${restaurant.phone }"
					required />
			</div>
			<div>
				餐廳地址： <input type="text" name="restaurantAddress"
					value="${restaurant.address }" required />
			</div>
			<div>
				餐廳類別： <select name="restaurantType">
					<c:forEach items="${allRestaurantType}" var="rt">
						<option value="${rt.rest_type_id}">${rt.rest_type}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				營業時間： <select name="startDate" value="${restaurant.startDate }">
					<option value="星期日">星期日</option>
					<option value="星期一">星期一</option>
					<option value="星期二">星期二</option>
					<option value="星期三">星期三</option>
					<option value="星期四">星期四</option>
					<option value="星期五">星期五</option>
					<option value="星期六">星期六</option>
				</select> ～ <select name="endDate">
					<option value="星期日">星期日</option>
					<option value="星期一">星期一</option>
					<option value="星期二">星期二</option>
					<option value="星期三">星期三</option>
					<option value="星期四">星期四</option>
					<option value="星期五">星期五</option>
					<option value="星期六">星期六</option>
				</select> <input type="time" name="starttime" min="00:00" max="23:59" value="${startTime }" required>～
				<input type="time" name="endtime" value="${endTime }" required>
			</div>
			<div>
				餐廳圖片: <input type="file" name="restaurantImg"
					onchange="openFile(event)">
			</div>
			<img id="output" height="200" style="display: none">
			<div>
				備註:<br />
				<textarea id="remark" name="remark" rows="5" cols="33"></textarea>
			</div>
			<button type="submit">修改</button>
		</form>
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