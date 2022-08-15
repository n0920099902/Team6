<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>查詢頁面</title>
</head>
<body>

 <h1>搜尋</h1>
 
<div class="py-5 text-center container">
			<form action="${contextRoot}/member/search" method="get">
				搜尋:<input type="text" name="search" placeholder="搜尋帳戶">
				<button>GO</button>
			</form>
			
		</div>
 
 
</body>
</html>