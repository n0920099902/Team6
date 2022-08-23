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

<body>
	<h1>輸入新密碼頁面測試</h1>
	<form:form class="form" method="post" modelAttribute="member"
		action="${contextRoot}/users/updateUserPassword/${member.id }">
		<form:hidden path="id" />
		<form:hidden path="access" />
		<form:hidden path="account" />
		<table>
			<tr>
				<td>請輸入新密碼:&nbsp; <form:password path="password" id="pasword" />
				</td>
			</tr>
			<tr>
				<td>請重新輸入新密碼:&nbsp; <form:password path="confimation_password"
						id="confimation_password" />
				</td>
			</tr>

		</table>
		<form:button>
							變更密碼
						</form:button>
	</form:form>


</body>

</html>