<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link href="${contextRoot}/css/w3.css" rel="stylesheet" />
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet" href="${contextRoot}/css/w3-theme-teal.css">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css"> -->
<link rel="stylesheet" href="${contextRoot}/css/css_family=Roboto.css">
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto"> -->
<link rel="stylesheet" href="${contextRoot}/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="w3-sidebar w3-black w3-collapse w3-top w3-large w3-padding"
  style="z-index: 3; width: 200px; font-weight: bold;" id="mySidebar">
  <br> <a href="javascript:void(0)"
   class="w3-button w3-hide-large w3-display-topleft"
   style="width: 100%; font-size: 22px">Close Menu</a>
  <div class="w3-container">
   <h3 class="w3-padding-64">
    <b>你的訂單</b>
   </h3>
  </div>
  <div class="w3-bar-block">
   <c:if test="${!empty member}"><li class="nav-item"><a class="nav-link"
	href="${contextRoot}/restaurant/cart">購物車</a></li></c:if>
	<c:if test="${empty member}"><li class="nav-item"><a class="nav-link"href="${contextRoot}/cart/noLoginCart">購物車</a></li></c:if>
    <a href="${contextRoot}/admInindex" class="w3-bar-item w3-button w3-hover-white">系統管理首頁</a>
   <a href="${contextRoot}/admInindex" class="w3-bar-item w3-button w3-hover-white">系統管理首頁</a>
   <a href="${contextRoot}/addfoods" class="w3-bar-item w3-button w3-hover-white">新增食材</a>
   <a href="${contextRoot}/showAllFoods123" class="w3-bar-item w3-button w3-hover-white">管理食材</a>
   <a href="${contextRoot}/showAllUsers" class="w3-bar-item w3-button w3-hover-white">管理使用者</a>
   <a href="#packages" class="w3-bar-item w3-button w3-hover-white">管理活動</a>
   <a href="#contact" class="w3-bar-item w3-button w3-hover-white">回覆使用者</a>
  </div>
 </nav>
</body>
</html>