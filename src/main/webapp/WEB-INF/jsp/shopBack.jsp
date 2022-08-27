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
<title>商家後臺</title>
</head>
<body>
	<h1>商家後臺測試</h1>
	<a href="${contextRoot}/restaurant/editRestaurant/${member.id}">修改餐廳資料 </a><br/>
	<a href="${contextRoot}/backend/dish/${member.id}">新增商家商品 </a>
	
</body>
</html>