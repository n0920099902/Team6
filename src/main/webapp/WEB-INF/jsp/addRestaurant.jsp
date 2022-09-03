<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar2.jsp" />


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
<title>餐廳新增頁面</title>
</head>
<body>

	<div class="register-photo">
		<div class="form-container">
			<div class="image-holder"></div>
			<form class="form" id="form1"
				action="${contextRoot}/uploadRestaurant" method="post"
				enctype="multipart/form-data">
				<h2 class="text-center">
					<strong>新增餐廳資料</strong>
				</h2>
				<table>
					<tr>
						<td>餐廳名稱：<input name="restaurantName" type="text"
							class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
							placeholder="餐廳名稱：" id="restaurantName" /></td>
					</tr>
					<tr>
						<td>餐廳電話：<input type="text"
							class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
							placeholder="餐廳電話：" id="restaurantPhone" name="restaurantPhone"
							onblur="ckPhone()" onfocus="defaultPhoneOut()" required /><label
							for="restaurantPhone"></label><span style="color: red"
							id="phoneout"></span></td>
					</tr>
					<tr>
						<td>餐廳地址：<input name="restaurantAddress" type="text"
							class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
							placeholder="餐廳地址：" id="restaurantAddress" /></td>
					</tr>
				</table>
				<div>
					餐廳類別： <select name="restaurantType">
						<c:forEach items="${allRestaurantType}" var="rt">
							<option value="${rt.id}">${rt.type}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					營業時間： <select name="startDate" id="startDate"
						class="form-select form-select-lg mb-3"
						aria-label=".form-select-lg example">
						<option value="星期日">星期日</option>
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
					</select>～ <select name="endDate" id="endDate">
						<option value="星期日">星期日</option>
						<option value="星期一">星期一</option>
						<option value="星期二">星期二</option>
						<option value="星期三">星期三</option>
						<option value="星期四">星期四</option>
						<option value="星期五">星期五</option>
						<option value="星期六">星期六</option>
					</select> <br /> <input type="time" id="startTime" name="startTime"
						required>～ <input type="time" name="endTime" id="endTime"
						required>
				</div>
				<div>
					餐廳圖片: <input type="file" name="restaurantImg"
						onchange="openFile(event)">
				</div>
				<img id="output" height="200" style="display: none">
				<!-- 				<p class="text"> -->
				<!-- 					<textarea name="remark" -->
				<!-- 						class="validate[required,length[6,300]] feedback-input" -->
				<!-- 						id="remark" placeholder="備註:" rows="5" cols="33"></textarea> -->
				<!-- 				</p> -->
				<div>
					<button class="btn btn-primary btn-block" type="submit">送出</button>
				</div>
				<br />
				<div>
					<a class=" btn btn-outline-success fastData"
						style="margin: 4px, 2px; padding: 6px 12px; width: 7em">一鍵輸入</a>
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	//一鍵輸入資料
	$(".fastData").click(function() {
		$("#restaurantName").val("摩斯漢堡");
		$("#restaurantPhone").val("0989213447");
		$("#restaurantAddress").val("台北市大安區信義路三段184號");
		$("#restaurantType").val("1");
		$("#startDate").val("星期日");
		$("#endDate").val("星期六");
		$("#startTime").val("10:00");
		$("#endTime").val("22:00");
	});

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