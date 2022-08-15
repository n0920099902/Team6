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
<title>新增頁面</title>
</head>
<body>

	<div>註冊頁面</div>
	<div class="container text-center ">
		<main class="form-signin m-5">


			<!-- 表單開始 -->
			<form action="${contextRoot}/postMember" method="post">
				
				<div class="form-floating"> <label
						for="phone">帳號</label>
					<input type="text" class="form-control" id="account" name="account"
						onblur="ckPhone()" onfocus="defaultPhoneOut()" required><span style="color: red" id="phoneout"></span>
				</div>
				<div class="form-floating"><label for="name">密碼</label>
					<input type="text" class="form-control" id="password" name="password"
						required> 
				</div>
				<div class="form-floating"><label for="birthday">生日</label>
					<input type="date" class="form-control" id=birthday
						name="birthday" required> 
				</div>
				
				<div class="form-floating"><label for="pid">信箱</label><span style="color: red" id="email"></span>
					<input type="text" class="form-control" id="email" name="email"
						maxlength="10" onblur="ckId()" onfocus="defaultIdOut()" required>
					
				</div>
				<div class="form-floating"><label >電話</label>
					<input type="text" class="form-control" id="phone" name="phone"
						required> 
				</div>
				<div class="form-floating"><label >權限</label>
					<input type="text" class="form-control" id="access" name="access"
						required> 
				</div>
				<div class="form-floating"> <label>評論</label>
					<input type="text" class="form-control" id="remark" name="remark"
						required>
				</div>
<!-- 				<div class="form-floating"><label>上傳照片</label> -->
<!-- 					<input type="file" class="form-control" id="photo" name="photo" -->
<!-- 						required>  -->
<!-- 				</div> -->

				<div class=" mb-2">
					<button class="w-25 btn btn-lg btn-primary">註冊</button>
				</div>

			</form>
			<!-- 表單結束 --></main></div>
</body>
</html>