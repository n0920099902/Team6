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


</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
		<a class="navbar-brand" href="${contextRoot}/restaurant"><h2>饗訂</h2></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample06" aria-controls="navbarsExample06"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExample06">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${contextRoot}/"><h5>主頁 </h5><span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/menu/dish"><h5>餐廳</h5></a></li>
				
			
				<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/restaurant/cart"><h5>購物車</h5></a></li>
				
						<li class="nav-item"><a class="nav-link"
					href="${contextRoot}/sign"><h5>會員註冊</h5></a></li>

				
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

					<div class="dropdown-menu" aria-labelledby="dropdown06">
						<a class="dropdown-item" href="${contextRoot}/users/userCentre">會員中心</a>
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