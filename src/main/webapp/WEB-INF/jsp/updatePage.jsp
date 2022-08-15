<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>修改會員資料</title>
</head>
<body>
<div class="container">

		<div class="row justify-content-center">
			<div class="col-8">
				<h1>修改頁面</h1>
				<div class="card">
					<div class="card-header">修改會員</div>
					<div class="card-body">

		<form:form class="form" method="post" modelAttribute="update"
		action="${contextRoot}/postMember">
		<table>
			<tr>
				<td><form:label path="account">account :</form:label></td>
				<td><form:input type="text" path="account" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><form:label path="password">password:</form:label></td>
				<td><form:input type="text" path="password" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><form:label path="email">email   :</form:label></td>
				<td><form:input type="text" path="email" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><form:label path="phone">phone   :</form:label></td>
				<td><form:input type="text" path="phone" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><form:label path="birthday">birthday   :</form:label></td>
				<td><form:input type="text" path="birthday" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><form:label path="access">access  :</form:label></td>
				<td><form:input type="text" path="access" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><form:label path="remark">remark  :</form:label></td>
				<td><form:input type="text" path="remark" /></td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td><button type="submit">Submit</button></td>
			</tr>
		</table>
			<br />
		</form:form>
					</div>
				</div>
			</div>
		</div>


</div>

</body>
</html>
