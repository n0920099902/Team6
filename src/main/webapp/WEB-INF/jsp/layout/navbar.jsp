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
<%-- <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" /> --%>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${contextRoot}/restaurant">咖哩拌飯外賣</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="${contextRoot}/">主頁<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="${contextRoot}/restaurant">餐廳主頁 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/restaurant/add">新增餐廳</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/restaurant/viewRestaurants">餐廳總覽(後台)</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/test">測試頁面</a></li>

				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/Users/register">後台會員新增</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/Users/select">後台會員管理</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/listPhoto">測試商品</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/restaurant/cart">購物車</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/shoppincar/Test">購物車前端頁面測試</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/listPhoto">測試商品</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/restaurant/cart">購物車</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
					aria-expanded="false"> 
					<c:if test="${empty member}">
							<a href="${contextRoot}/login">
								<button class="btn btn-primary">會員登入</button>
							</a>
						</c:if> <c:if test="${!empty member}">
							<a href="#"
								class="d-block link-dark text-decoration-none dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false"> <c:choose>
									<c:when test="${!empty member.photo}">
										<img src="${contextRoot}/img/sticker.jpeg" width="45"
											height="45" class="rounded-circle">
									</c:when>
									<c:otherwise>
										<img width="45" height="45" alt=""
											src="${contextRoot}/member/img?id=${member.id}">
									</c:otherwise>
								</c:choose> <span> ${member.account } </span>
								</a></c:if></a></li>
<!-- 						<div class="dropdown-menu"> -->
<!-- 							<a class="dropdown-item" href="#">Action</a> <a -->
<!-- 								class="dropdown-item" href="#">Another action</a> <a -->
<!-- 								class="dropdown-item" href="#">Something else here</a> -->
<!-- 						</div></li> -->
				<!-- 會員登入/登入成功圖案 -->
				<!-- 				<div class="dropdown text-end"> -->

				<%-- 					<c:if test="${empty member}"> --%>
				<%-- 						<a href="${contextRoot}/login"> --%>
				<!-- 							<button class="btn btn-primary">會員登入</button> -->
				<!-- 						</a> -->
				<%-- 					</c:if> --%>

				<%-- 					<c:if test="${!empty member}"> --%>
				<!-- 						<a href="#" -->
				<!-- 							class="d-block link-dark text-decoration-none dropdown-toggle" -->
				<%-- 							data-bs-toggle="dropdown" aria-expanded="false"> <c:choose> --%>
				<%-- 								<c:when test="${!empty member.photo}"> --%>
				<%-- 									<img src="${contextRoot}/img/sticker.jpeg" width="45" --%>
				<!-- 										height="45" class="rounded-circle"> -->
				<%-- 								</c:when> --%>
				<%-- 								<c:otherwise> --%>
				<!-- 									<img width="45" height="45" alt="" -->
				<%-- 										src="${contextRoot}/member/img?id=${member.id}"> --%>

				<%-- 								</c:otherwise> --%>
				<%-- 							</c:choose> <span> ${member.account } </span> --%>

<!-- 				</a> -->
<!-- 							<ul class="dropdown-menu text-small"> -->
<!-- 								<li><a class="dropdown-item" -->
<%-- 									href="${contextRoot}/users/userCentre">會員中心</a></li> --%>
<!-- 								<li><hr class="dropdown-divider"></li> -->
<!-- 								<li><a class="dropdown-item" -->
<%-- 									href="${contextRoot}/member/logout">登出</a></li> --%>
							</ul>
		</div>
		<!-- 會員登入/登入成功圖案 -->

		</ul>
		</div>
	</nav>

	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>