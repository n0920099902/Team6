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

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<!-- bootstrap 5.1.3 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- jQuery 3.6.0 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- 自定義CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<h2>${message }</h2>
	<form action="${contextRoot}/member/login" method="POST"
		enctype="multipart/form-data">
<!-- 		<div class="imgcontainer"> -->
<%-- 			<img src="${contextRoot}/img/login.png" alt="Avatar" class="avatar"> --%>
<!-- 		</div> -->
		<div class="container">
			<label for="uname"><b>會員帳號 </b></label> <input type="text"
				placeholder="Enter Username" name="mAccount" id="mAccount" required>
			<label for="psw"><b>會員密碼</b></label><i id="checkEye"
				class="fas fa-eye-slash"></i> <input type="password"
				placeholder="Enter Password" name="mPassword" id="mPassword"
				required>

			<button type="submit">登入</button>
			<label class="right"> <span class="psw"> <a
					href="${contextRoot}/sign"><h5>點我加入會員</h5></a></span>
			</label> <br />
			<label><span class="right"><span class="psw"><a
						href="${contextRoot}/users/forgotPassword"><h5>忘記密碼</h5></a></span></label>
		</div>
		<div class="container">
			快速登入:
			<button class=" btn btn-outline-primary fastLogin"
				style="margin: 4px, 2px; padding: 6px 12px; width: 5em">Admin</button>
			<button class=" btn btn-outline-success fastLogin2"
				style="margin: 4px, 2px; padding: 6px 12px; width: 5em">Shop1</button>
			<button class=" btn btn-outline-success fastLogin3"
				style="margin: 4px, 2px; padding: 6px 12px; width: 5em">Shop3</button>
			<button class=" btn btn-outline-success fastLogin4"
				style="margin: 4px, 2px; padding: 6px 12px; width: 5em">User1</button>
			<button class=" btn btn-outline-success fastLogin5"
				style="margin: 4px, 2px; padding: 6px 12px; width: 5em">User2</button>
		</div>
	</form>


</body>
<script type="text/javascript">
	//快速登入
	$(".fastLogin").click(function() {
		$("#mAccount").val("admin");
		$("#mPassword").val("admin1234");
	});
	$(".fastLogin2").click(function() {
		$("#mAccount").val("shop01");
		$("#mPassword").val("1234");
	});
	$(".fastLogin3").click(function() {
		$("#mAccount").val("shop03");
		$("#mPassword").val("1234");
	});
	$(".fastLogin4").click(function() {
		$("#mAccount").val("user1234");
		$("#mPassword").val("1234");
	});
	$(".fastLogin5").click(function() {
		$("#mAccount").val("user123");
		$("#mPassword").val("1234");
	});
	//密碼可視切換
	$("#checkEye").click(function() {
		if ($(this).hasClass('fa-eye')) {
			$("#mPassword").attr('type', 'password');
		} else {
			$("#mPassword").attr('type', 'text');
		}
		$(this).toggleClass('fa-eye').toggleClass('fa-eye-slash');
	});

	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.history.back(); //返回上一頁
	})
</script>
</html>