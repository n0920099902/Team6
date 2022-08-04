<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">

		<div class="row justify-content-center">
			<div class="col-8">
				<h1>修改留言頁面</h1>
				<div class="card">
					<div class="card-header">修改留言</div>
					<div class="card-body">

						<form:form class="form" method="post"
							modelAttribute="workMessages"
							action="${contextRoot}/message/editMessage">
							
							<form:input type="hidden" path="id" />
						    <form:input type="hidden" path="added" />

							<form:textarea path="text" class="form-control" />
							<br />

							<button type="submit" class="btn btn-primary">Submit</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>


</div>

</body>
</html>