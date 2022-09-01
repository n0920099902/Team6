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
<title>請輸入驗證碼</title>
</head>
<style type="text/css">
.register-photo {
	background: #f1f7fc;
	padding: 80px 0;
}

/* .register-photo .image-holder { */
/*   display:table-cell; */
/*   width:auto; */
/*   background:url(https://image.ibb.co/ciMdh8/640x426.png); */
/*   background-size:cover; */
/* } */
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
	border-radius: 5px;
	padding: 8px;
	padding-right: 15px;
	padding-left: 15px;
	box-shadow: none;
	margin-top: 0px;
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
</head>
<body>
	<div class="register-photo">
		<div class="image-holder"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-8">
					<div class="card">
						<div class="card-header">
							<h2>請輸入您的驗證碼</h2>
						</div>
						<form action="${contextRoot}/users/confirm/email" method="post">
							請輸入您的驗證碼: <input type="text" name="code">
							<button class="btn btn-primary" type="submit">送出</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>