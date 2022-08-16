<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>註冊頁面</title>
</head>
<body>
	<form action="contextRoot/rigister"
		method="POST" enctype="multipart/form-data">
		<div>
			會員帳號： <input type="text" name="account" required>
		</div>
		<div>
			會員密碼： <input type="password" name="password" required>
		</div>
		<div>
			會員信箱： <input type="email" name="email" required>
		</div>
		<div>
			會員電話： <input type="tel" id="mPhone" name="phone"  onblur="ckPhone()" onfocus="defaultPhoneOut()" required><span style="color: red" id="phoneout"></span>
		</div>
		<div>
			會員生日： <input type="date" name="Birthday" required >
		</div>
		<div>
			<!-- 			權限 -->
			<input type="text" name="access" value="Shop" hidden="" required>
		</div>

		<div>
			會員圖片： <input type="file" name="Img" onchange="openFile(event)">
		</div>

		<img id="output" height="200" style="display: none">
		<button>新增</button>
	</form>
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
		let phone = document.getElementById("mPhone").value;
		if (phone != "" && phone.search(/^09\d{8}$/) == -1) {
			document.getElementById("phoneout").innerHTML = "輸入格式錯誤";
		}
	}
</script>
</html>