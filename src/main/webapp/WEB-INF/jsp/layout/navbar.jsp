<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${contextRoot}/restaurant">咖哩拌飯外賣</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/">主頁<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/restaurant">餐廳主頁 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/restaurant/add">新增餐廳</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/restaurant/viewRestaurants">餐廳總覽(後台)</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/restaurant/Test">測試頁面</a>
      </li>
      
      
     <!-- 會員登入/登入成功圖案 -->
			<div class="dropdown text-end">

				<c:if test="${empty users}">
					<a href="${pageContext.request.contextPath}/login.com">
						<button class="btn btn-primary">會員登入</button>
					</a>
				</c:if>

				<c:if test="${!empty users}">
					<a href="#"
						class="d-block link-dark text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="data:image/jpeg;base64,${users.photoBase64 }" width="45" height="45" class="rounded-circle">
						<span>${users.name }</span>

					</a>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
<!-- 						<li><a class="dropdown-item" href="#">會員資訊(建置中)</a></li> -->
<!-- 						<li><hr class="dropdown-divider"></li> -->
						<li><a class="dropdown-item" href="${pageContext.request.contextPath}/logoutaction.controller">登出</a></li>
					</ul>
				</c:if>
			</div>
			<!-- 會員登入/登入成功圖案 -->
    </ul>
  </div>
</nav>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>