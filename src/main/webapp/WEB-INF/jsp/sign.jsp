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
	background: #f1f7fc;
	padding: 80px 0;
}

.register-photo .image-holder {
	display: table-cell;
	width: auto;
	background: url("${contextRoot}/img/memberadd2.jpg ");
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
<title>sign</title>
</head>
<body>
	<div class="register-photo">
		<div class="form-container">
			<div class="image-holder"></div>
			<form action="${contextRoot}/member/sign" method="POST"
				enctype="multipart/form-data">
				<h2 class="text-center">
					<strong>????????????</strong>
				</h2>
				<div>
					??????????????? <input type="text" name="mAccount" id="mAccount" required>
				</div>
				<div>
					??????????????? <input type="password" name="mPassword" id="mPassword"
						required>
				</div>
				<div>
					??????????????? <input type="email" name="mEmail" id="mEmail" required>
				</div>
				<div>
					??????????????? <input type="text" id="mPhone" name="mPhone" id="mPhone"
						onblur="ckPhone()" onfocus="defaultPhoneOut()" required><span
						style="color: red" id="phoneout"></span>
				</div>
				<div>
					??????????????? <input type="date" name="mBirthday" id="mBirthday" required>
				</div>
				<div>
					<!-- 			?????? -->
					<input type="text" name="mAccess" value="User" hidden="" required>
				</div>

				<div>
					??????????????? <input type="file" name="Img" onchange="openFile(event)">
				</div>

				<img id="output" height="200" style="display: none">
				<div class="form-group">
					<button class="btn btn-primary btn-block" type="submit">??????</button>
				</div>
				<div>
					<a class=" btn btn-outline-success fastSign"
						style="margin: 4px, 2px; padding: 6px 12px; width: 7em">????????????</a>
				</div>
			</form>
</body>
<script type="text/javascript">
	//????????????
	$(".fastSign").click(function() {
		$("#mAccount").val("user1234");
		$("#mPassword").val("1234");
		$("#mEmail").val("b0921829199@gmail.com");
		$("#mPhone").val("0989213447");
		$("#mBirthday").val("1990-01-07");
	});

	function openFile(event) {
		var input = event.target; //??????????????????
		var reader = new FileReader(); //??????FileReader??????

		reader.readAsDataURL(input.files[0]); //???.readAsDataURL????????????????????????base64??????

		reader.onload = function() { //FileReader???????????????????????????????????????
			var dataURL = reader.result; //????????????dataURL??????????????????base64??????
			$('#output').attr('src', dataURL).show(); //???img???src?????????dataURL?????????
		};
	}
	function defaultPhoneOut() {
		document.getElementById("phoneout").innerHTML = "";
	}
	function ckPhone() {
		let phone = document.getElementById("mPhone").value;
		if (phone != "" && phone.search(/^09\d{8}$/) == -1) {
			document.getElementById("phoneout").innerHTML = "??????????????????";
		}
	}
</script>
</html>