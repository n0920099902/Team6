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
<title>修改密碼</title>
</head>
<body>
	<h1>請輸入舊密碼</h1>

	<form:form class="form" method="post" modelAttribute="member"
		action="${contextRoot}/users/checkUserOldPassword/${member.id }"
		enctype='multipart/form-data'>

		<form:hidden path="id" />
		<form:hidden path="access" />
		<table>
			<tr>
				<td><form:label path="account">帳號:${member.account }</form:label></td>
			</tr>
			<tr>
				<td>請輸入舊密碼:&nbsp; <form:password path="password"/></td>
			</tr>
		</table>
		<form:button>
		 下一步
		</form:button>
	</form:form>
</body>
</html>