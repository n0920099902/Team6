<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>評論後台修改刪除</title>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<!--至中-->
			<div class="col-4">
				<h1>評論修改</h1>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">修改評論</h5>
<%-- 						<form:form class="form" method="post" modelAttribute="comment" --%>
<%-- 							action="${contextRoot}/comment/editComment"> --%>
							
<%-- 							<form:input type="hidden" path="id"/> --%>
<%-- 							<form:input type="text" path="time"/> --%>
<%-- 							<form:textarea path="comments" class="form-control" /> --%>
<!-- 							<br /> -->
<!-- 							<button type="submit">確認</button> -->

<%-- 						</form:form> --%>

<form action="${contextRoot}/comment/editComment" method="post">
<input type="number" name="id" value="${comment.id }" hidden="">
<textarea rows="" cols="" name="comments" >${comment.comments }</textarea>
<br>
<button type="submit">確認</button>
</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>