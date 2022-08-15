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
				餐廳地址： 
<!-- 				<select name="address"> -->
<!-- 					<option value="基隆市">基隆市</option> -->
<!-- 					<option value="台北市">台北市</option> -->
<!-- 					<option value="新北市">新北市</option> -->
<!-- 					<option value="桃園縣">桃園縣</option> -->
<!-- 					<option value="新竹市">新竹市</option> -->
<!-- 					<option value="新竹縣">新竹縣</option> -->
<!-- 					<option value="苗栗縣">苗栗縣</option> -->
<!-- 					<option value="台中市">台中市</option> -->
<!-- 					<option value="彰化縣">彰化縣</option> -->
<!-- 					<option value="南投縣">南投縣</option> -->
<!-- 					<option value="雲林縣">雲林縣</option> -->
<!-- 					<option value="嘉義市">嘉義市</option> -->
<!-- 					<option value="嘉義縣">嘉義縣</option> -->
<!-- 					<option value="台南市">台南市</option> -->
<!-- 					<option value="高雄市">高雄市</option> -->
<!-- 					<option value="屏東縣">屏東縣</option> -->
<!-- 					<option value="台東縣">台東縣</option> -->
<!-- 					<option value="花蓮縣">花蓮縣</option> -->
<!-- 					<option value="宜蘭縣">宜蘭縣</option> -->
<!-- 				</select>  -->
				<input type="text" name="restaurantAddress" required />
			</div>
			<div>
				餐廳類別： <select name="restaurantType">
					<c:forEach items="${allRestaurantType}" var="rt">
						<option value="${rt.rest_type_id}">${rt.rest_type}</option>
					</c:forEach>
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
			<div>
				餐廳圖片: <input type="file" name="restaurantImg"
					onchange="openFile(event)">
			</div>
			<img id="output" height="200" style="display: none">
			<div>
				備註:<br />
				<textarea id="remark" name="remark" rows="5" cols="33"></textarea>
			</div>
			<button type="submit">新增</button>
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