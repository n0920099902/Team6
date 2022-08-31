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
<title>請輸入您的郵件</title>
</head>
<body>
	<h1>請輸入您的郵件</h1>

	<form action="${contextRoot }/users/send/email" method="post">
		請輸入您的郵件: <input type="text" name="email">
		<button type="submit">送出</button>
	</form>
</body>
</html>