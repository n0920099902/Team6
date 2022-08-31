<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />


<html>
<head>
<link href="${contextRoot}/css/addRestaurant.css" rel="stylesheet" />


<meta charset="UTF-8">
<title>餐廳新增頁面</title>
</head>
<body>
	
	<div id="form-main">
		<div id="form-div">
			<form class="form" id="form1"
				action="${contextRoot}/uploadRestaurant" method="post"
				enctype="multipart/form-data">

				<p class="name">
					<input name="restaurantName" type="text"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="餐廳名稱：" id="name" />
				</p>
				<p class="name">
					<input type="text"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="餐廳電話：" id="restaurantPhone" name="restaurantPhone"
						onblur="ckPhone()" onfocus="defaultPhoneOut()" required /><label
						for="restaurantPhone"></label><span style="color: red"
						id="phoneout"></span>
				</p>

				<p class="name">
					<input name="restaurantAddress" type="text"
						class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
						placeholder="餐廳地址：" id="name" />
				</p>

				<div>
					<h5>餐廳類別：</h5>
					<select name="restaurantType">
						<c:forEach items="${allRestaurantType}" var="rt">
							<option value="${rt.id}">${rt.type}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<h5>營業時間：</h5>
					<select name="startDate" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
						<option value="星期日">星期日</option>
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
					</select>～ <select name="endDate">
						<option value="星期日">星期日</option>
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
					</select> <br/><input type="time" name="startTime" required>～ <input
						type="time" name="endTime" required>
				</div>
				<div>
					餐廳圖片: <input type="file" name="restaurantImg"
						onchange="openFile(event)">
				</div>
				<img id="output" height="200" style="display: none">
				<p class="text">
					<textarea name="remark"
						class="validate[required,length[6,300]] feedback-input"
						id="remark" placeholder="備註:"  rows="5" cols="33"></textarea>
					
		
				</p>

				<div class="submit">
					<input type="submit" value="SEND" id="button-blue" />
					<div class="ease"></div>
				</div>
			</form>
		</div>
		
		<jsp:include page="layout/footer.jsp" />
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

	function defaultPhoneOut() {
		document.getElementById("phoneout").innerHTML = "";
	}

	function ckPhone() {
		let phone = document.getElementById("restaurantPhone").value;
		if (phone != "" && phone.search(/^09\d{8}$/) == -1) {
			document.getElementById("phoneout").innerHTML = "輸入格式錯誤";
		}
	}
</script>

</html>