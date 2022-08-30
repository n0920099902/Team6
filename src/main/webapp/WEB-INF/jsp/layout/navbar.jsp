<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link rel="icon"
	href="${pageContext.request.contextPath}/images/shortcut.ico">

</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
		<a class="navbar-brand" href="${contextRoot}/restaurant">咖哩拌飯外賣</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample06" aria-controls="navbarsExample06"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample06">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${contextRoot}/">主頁 <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/restaurant">餐廳主頁</a></li>
				<!-- 				<li class="nav-item"><a class="nav-link" -->
				<%-- 					href="${contextRoot}/restaurant/add">新增餐廳</a></li> --%>
				<!-- 				<li class="nav-item"><a class="nav-link" -->
				<%-- 					href="${contextRoot}/restaurant/viewRestaurants">餐廳總覽(後台)</a></li> --%>
<!-- 				<li class="nav-item"><a class="nav-link" -->
<%-- 					href="${contextRoot}/test">測試頁面</a></li> --%>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/sign">會員註冊</a></li>
				<!-- 				<li class="nav-item"><a class="nav-link" -->
				<%-- 					href="${contextRoot}/Users/register">餐廳帳號新增</a></li> --%>
				<!-- 				<li class="nav-item"><a class="nav-link" -->
				<%-- 					href="${contextRoot}/Users/select">後台會員管理</a></li> --%>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/shoppincar/Test">購物車前端頁面測試</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/listPhoto">測試商品</a></li>
				<c:if test="${!empty member}"><li class="nav-item"><a class="nav-link"
					href="${contextRoot}/cart/eidtOrder">購物車</a></li></c:if>
				<c:if test="${empty member}"><li class="nav-item"><a class="nav-link"href="${contextRoot}/cart/noLoginCart">購物車</a></li></c:if>
				<c:if test="${!empty member}">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/restaurant/cart">購物車</a></li>
				</c:if>
				<c:if test="${empty member}">
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/cart/noLoginCart">購物車</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/GM">後台管理</a></li>
				
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/menu/dish">菜單頁面(前台)</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/backend/dish">商品總覽(後台)</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/backend/dish/category">商品種類(後台)</a></li>
			</ul>


		</div>
		<!-- 會員登入/登入成功圖案 -->

		<div class="nav-item dropdown fixed-bottom-end">

			<c:if test="${empty member}">
				<a href="${contextRoot}/login">
					<button class="btn btn-primary">會員登入</button>
				</a>
			</c:if>

			<c:if test="${!empty member}">
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown06"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><c:choose>
							<c:when test="${!empty member.photo}">
								<img src="${contextRoot}/member/img?id=${member.id}" width="35"
									height="35" class="rounded-circle">
							</c:when>
							<c:when test="${empty member.photo}">
								<img width="35" height="35" alt="" class="rounded-circle"
									src="${contextRoot}/img/sticker.jpeg">
							</c:when>
						</c:choose> </a>

					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dropdown06" style="">
						<a class="dropdown-item" href="${contextRoot}/users/userCentre">會員中心</a>
						<c:if test="${member.access == 'Shop' }">
							<a class="dropdown-item" href="${contextRoot}/shop/shopBack">商家後臺</a>
							<a class="dropdown-item" href="${contextRoot}/restaurant/add">新增餐廳</a>
						</c:if>
						<c:if test="${member.access == 'Admin' }">
							<a class="dropdown-item" href="${contextRoot}/Users/select">後台會員管理</a>
							<a class="dropdown-item" href="${contextRoot}/Users/register">餐廳帳號新增</a>
							<a class="dropdown-item"
								href="${contextRoot}/restaurant/viewRestaurants">餐廳總覽(後台)</a>
						</c:if>
						<a class="dropdown-item" href="${contextRoot}/getUsersOrder">歷史訂單</a>
						<hr class="dropdown-divider">
						<a class="dropdown-item" href="${contextRoot}/member/logout">登出</a>
					</div>
				</div>
			</c:if>
		</div>

	</nav>
	<!-- 會員登入/登入成功圖案 -->
</body>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</html>