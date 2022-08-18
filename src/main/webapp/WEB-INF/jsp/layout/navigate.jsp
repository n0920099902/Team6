<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="p-3 mb-3 border-bottom">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="/"
				class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
				<svg class="bi me-2" width="40" height="32" role="img"
					aria-label="Bootstrap">
						<use xlink:href="#bootstrap"></use></svg>
			</a>

			<!-- 導覽選項 -->
			<ul
				class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="${pageContext.request.contextPath}"
					class="nav-link px-2 link-secondary">線上商店</a></li>
				<li><a
					href="${pageContext.request.contextPath}/getallaction.controller"
					class="nav-link px-2 link-dark">商品頁面</a></li>
				<li><a
					href="${pageContext.request.contextPath}/shoppingCart.com"
					class="nav-link px-2 link-dark">購物車</a></li>

				<%-- 				<c:if test="${users.name=='admin' }"> --%>
					<li><a href="${pageContext.request.contextPath}/add.com"
						class="nav-link px-2 link-dark">新增商品</a></li>
<%-- 				</c:if> --%>


			</ul>
			<!-- 導覽選項 -->

			<!-- 會員登入/登入成功圖案 -->
			<div class="dropdown text-end">

				<c:if test="${empty member}">
					<a href="${contextRoot}/login">
						<button class="btn btn-primary">會員登入</button>
					</a>
				</c:if>

				<c:if test="${!empty member}">
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

					</a>
					<ul class="dropdown-menu text-small">
						<li><a class="dropdown-item"
							href="${contextRoot}/users/userCentre">會員中心</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item"
							href="${contextRoot}/member/logout">登出</a></li>
					</ul>
				</c:if>
			</div>
			<!-- 會員登入/登入成功圖案 -->

		</div>
	</div>
</header>