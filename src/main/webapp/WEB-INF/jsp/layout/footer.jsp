<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/headers.css" rel="stylesheet" />

</head>
<body>
	<footer
		class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
		<div class="col-md-4 d-flex align-items-center">
			<a href="${contextRoot}/"
				class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
				<svg class="bi" width="30" height="24">
					<use xlink:href="#bootstrap"></use></svg>
			</a> <span class="text-muted">© 2022 FeastEat, Inc</span>
		</div>

		<ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text" href="${contextRoot}/webSocket">聯絡客服<svg
						class="bi" width="24" height="24">
						<use xlink:href="#twitter"></use></svg></a></li>
			<li class="ms-3"><a class="text-muted" href="#"><svg
						class="bi" width="24" height="24">
						<use xlink:href="#instagram"></use></svg></a></li>
			<li class="ms-3"><a class="text-muted" href="#"><svg
						class="bi" width="24" height="24">
						<use xlink:href="#facebook"></use></svg></a></li>
		</ul>
	</footer>

</body>
</html>