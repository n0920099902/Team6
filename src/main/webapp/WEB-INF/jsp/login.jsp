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
<title>Login</title>
</head>
<body>
${message }
	<form action="${contextRoot}/member/login"
		method="POST" enctype="multipart/form-data">
		<div>
			會員帳號： <input type="text" name="mAccount" required>
		</div>
		<div>
			會員密碼： <input type="password" name="mPassword" required>
		</div>
		<button>登入</button>
		</form>
	<a href="${contextRoot}/sign">註冊</a>
</body>
</html>