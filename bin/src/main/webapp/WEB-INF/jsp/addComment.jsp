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
<title>新增評論頁面</title>
</head>
<body>
	<div class="container">

		<div class="row justify-content-center">
			<!--至中-->
			<div class="col-4">
				<h1>建立評論</h1>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">新增評論</h5>
						
						<form:form class="form" method="post" modelAttribute="addCommentDto"
							action="${contextRoot}/postComment">
							<form:label path="orderId">訂單編號:${orderId}</form:label>
							<form:textarea path="comments" class="form-control" />
							
							<br />
							<button type="reset">取消</button>
							<button type="submit">張貼</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<br />
		

	</div>
</body>
</html>