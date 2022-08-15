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
<title>${name}</title>
</head>
<body>
	<h1>餐廳商品測試</h1>

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<!-- 重複的結構 -->
				<c:forEach items="${allDish }" var="dish">
					<div>
						<div class="col">
							<div class="card">
								<img style="height: 200px"
									src="${contextRoot}/restaurant/downloadImage/${dish.id}"
									class="card-img-top">
								<div class="headline">${dish.name }</div>
								<div class="card-footer text-end">
									<span class="me-5">${dish.price }</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 重複的結構 -->
</body>
</html>