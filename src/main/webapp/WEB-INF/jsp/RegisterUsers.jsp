<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<%-- <jsp:include page="layout/navbar.jsp" /> --%>
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
	background: url("${contextRoot}/img/memberadd.jpg ");
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
<title>註冊頁面</title>
</head>
<body>
	<div class="register-photo">
		<div class="form-container">
			<div class="image-holder"></div>

			<form action="${pageContext.request.contextPath}/register"
				method="post" enctype="multipart/form-data">

				<h2 class="text-center">
					<strong>店家帳號註冊</strong>
				</h2>
				<div>
					店家帳號： <input type="text" name="account" required id="account"
						onchange="checkAccount()">
				</div>
				<div>
					店家密碼： <input type="password" name="password" id="password" required>
				</div>
				<div>
					店家信箱： <input type="email" name="email" id="email" required>
				</div>
				<div>
					店家電話： <input type="tel" id="mPhone" name="phone" onblur="ckPhone()"
						onfocus="defaultPhoneOut()" required><span
						style="color: red" id="phoneout"></span>
				</div>
				<div>
					<!-- 			權限 -->
					<input type="text" name="access" value="Shop" hidden="" required>
				</div>

				<div>
					店家圖片： <input type="file" name="Img" onchange="openFile(event)">
				</div>

				<img id="output" height="200" style="display: none">
				<div class="form-group">
					<button class="btn btn-primary btn-block" type="submit">送出</button>
				</div>
				<a class=" btn btn-outline-success fastData"
					style="margin: 4px, 2px; padding: 6px 12px; width: 7em">一鍵輸入</a>
			</form>

		</div>
	</div>
</body>
<script type="text/javascript">
	//一鍵輸入
	$(".fastData").click(function() {
		$("#account").val("shop01");
		$("#password").val("1234");
		$("#email").val("shop01@gmail.com");
		$("#mPhone").val("0989213447");
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
		let phone = document.getElementById("mPhone").value;
		if (phone != "" && phone.search(/^09\d{8}$/) == -1) {
			document.getElementById("phoneout").innerHTML = "輸入格式錯誤";
		}
	}
	function checkAccount() {
		const account = document.getElementById("account");
		$.ajax({
			url : "${contextRoot}/member/get/" + account.value,
			success : function(result) {
				if (result) {
					alert("帳號重複");
					account.value = "";
				}
			}
		});
	}
</script>
</html>