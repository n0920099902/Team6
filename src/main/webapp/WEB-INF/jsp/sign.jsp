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
<style type="text/css">
.register-photo {
  background:#f1f7fc;
  padding:80px 0;
}

.register-photo .image-holder {
  display:table-cell;
  width:auto;
  background:url("${contextRoot}/img/memberadd2.jpg ");
  background-size:cover;
}

.register-photo .form-container {
  display:table;
  max-width:900px;
  width:90%;
  margin:0 auto;
  box-shadow:1px 1px 5px rgba(0,0,0,0.1);
}

.register-photo form {
  display:table-cell;
  width:400px;
  background-color:#ffffff;
  padding:40px 60px;
  color:#505e6c;
}

@media (max-width:991px) {
  .register-photo form {
    padding:40px;
  }
}

.register-photo form h2 {
  font-size:24px;
  line-height:1.5;
  margin-bottom:30px;
}

.register-photo form .form-control {
  background:#f7f9fc;
  border:none;
  border-bottom:1px solid #dfe7f1;
  border-radius:0;
  box-shadow:none;
  outline:none;
  color:inherit;
  text-indent:6px;
  height:40px;
}

.register-photo form .form-check {
  font-size:13px;
  line-height:20px;
}

.register-photo form .btn-primary {
  background:#f4476b;
  border:none;
  border-radius:4px;
  padding:11px;
  box-shadow:none;
  margin-top:35px;
  text-shadow:none;
  outline:none !important;
}

.register-photo form .btn-primary:hover, .register-photo form .btn-primary:active {
  background:#eb3b60;
}

.register-photo form .btn-primary:active {
  transform:translateY(1px);
}

.register-photo form .already {
  display:block;
  text-align:center;
  font-size:12px;
  color:#6f7a85;
  opacity:0.9;
  text-decoration:none;
}

</style>

<meta charset="UTF-8">
<title>sign</title>
</head>
<body>
<div class="register-photo">
	<div class="form-container">
		<div class="image-holder"></div>
	<form action="${contextRoot}/member/sign" method="POST"
		enctype="multipart/form-data">	
			<h2 class="text-center"><strong>會員註冊</strong></h2>
		<div>
			會員帳號： <input type="text" name="mAccount" required>
		</div>
		<div>
			會員密碼： <input type="password" name="mPassword" required>
		</div>
		<div>
			會員信箱： <input type="email" name="mEmail" required>
		</div>
		<div>
			會員電話： <input type="text" id="mPhone" name="mPhone" onblur="ckPhone()"
				onfocus="defaultPhoneOut()" required><span
				style="color: red" id="phoneout"></span>
		</div>
		<div>
			會員生日： <input type="date" name="mBirthday" required>
		</div>
		<div>
			<!-- 			權限 -->
			<input type="text" name="mAccess" value="User" hidden="" required>
		</div>

		<div>
			會員圖片： <input type="file" name="Img" onchange="openFile(event)">
		</div>

		<img id="output" height="200" style="display: none">
		<div class="form-group">
				<button class="btn btn-primary btn-block" type="submit">送出</button>
		</div>	
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