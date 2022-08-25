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
<title>餐廳總覽</title>
</head>
<body>
	<h1>餐廳總覽頁面</h1>
	<form action="${contextRoot}/restaurant/search" method="get">
		搜尋:<input type="text" name="keyword" placeholder="想要收搜尋的商品">
		<button>GO</button>
	</form>

	<c:forEach var="restaurant" items="${allRestaurant}">
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="card">
					<div class="card-body">
						<div>${restaurant.name}</div>
						<div class="edit-link">
							<a
								href="${contextRoot}/restaurant/editRestaurant/${restaurant.id}">編輯</a>
							<a onclick="return confirm('確認刪除?')"
								href="${contextRoot}/restaurant/deleteRestaurant/${restaurant.id}">刪除</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br />
	</c:forEach>

</body>
</html>