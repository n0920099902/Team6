<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<head>
<meta charset="UTF-8">
<title>會員修改頁面</title>
</head>
<style type="text/css">
.register-photo {
	background: #f1f7fc;
	padding: 80px 0;
}

.register-photo .image-holder {
	display: table-cell;
	width: auto;
	background: url(https://image.ibb.co/ciMdh8/640x426.png);
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
	border-right-width: 15px;
	border-left-width: 15px;
	margin-right: 15px;
	margin-left: 40px;
	box-shadow: none;
	margin-top: 20px;
	text-shadow: none;
	outline: none !important;
	width: 220px;
}

.register-photo form .btn-primary:hover, .register-photo form .btn-primary:active
	{
	background: #eb3b60;
    
	
}

.register-photo form .btn-primary:active {
	transform: translateY(10px);
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
<body>
	<div class="register-photo">
		<div class="image-holder"></div>
		<div class="container">

			<div class="row justify-content-center">
				<div class="col-8">
					<div class="card">
						<div class="card-header">
							<h2>修改會員資料</h2>
						</div>
						<div class="card-body" style="padding-top: 0px">

							<form:form class="form" method="post" modelAttribute="member"
								action="${contextRoot}/users/updateUser"
								enctype='multipart/form-data'
								style="padding-left: 25%;">
								<form:input type="hidden" path="id" />
								<ul>
									<li>帳號:&nbsp;<form:hidden path="account" />${member.account }</li>
									<form:input type="hidden" path="access" />
									<li>修改電子郵件:&nbsp;<form:input type="email" path="email"
											value="${member.email }" /></li>
									<li>修改電話:&nbsp;<form:input type="text" path="phone"
											value="${member.phone }" onblur="ckPhone()"
											onfocus="defaultPhoneOut()" /> <span style="color: red"
										id="phoneout"></span></li>
									<c:if test="${member.access == 'User' }">
										<li>修改出生年月日:&nbsp;<form:input type="date" path="birthday"
												value="${member.birthday }" /></li>
									</c:if>
									<li>修改大頭貼:<form:input type="file" path="Image"
											onchange="openFile(event)" /></li>
								</ul>
								<img id="output" height="200" style="display: none">
								<div class="form-group">
									<form:button class="btn btn-primary btn-block" type="submit">送出</form:button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
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