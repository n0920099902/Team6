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
<title>輸入新密碼</title>
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
<body>

	<div class="register-photo">
		<div class="image-holder"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-8">
					<div class="card">
						<div class="card-header">
							<h1>請輸入新密碼</h1>
						</div>
						<h3 style="color:red">${message }</h3>
						<form:form class="form" method="post" modelAttribute="member"
							action="${contextRoot}/users/updateUserPassword/${member.id }">
							<form:hidden path="id" />
							<form:hidden path="access" />
							<form:hidden path="account" />
							<table>
								<tr>
									<td>請輸入新密碼:&nbsp; <form:password path="password"
											id="pasword" />
									</td>
								</tr>
								<tr>
									<td>請重新輸入新密碼:&nbsp; <form:password
											path="confimation_password" id="confimation_password" />
									</td>
								</tr>
							</table>
							<div class="form-group">
								<form:button class="btn btn-primary btn-block" type="submit">變更密碼</form:button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>