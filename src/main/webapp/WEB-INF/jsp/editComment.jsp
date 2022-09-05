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
<link href="../../css/font-awesome.min.css" rel="stylesheet" />
<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/responsive.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>評論後台修改刪除</title>
</head>
<body style="background:url(${pageContext.request.contextPath}/img/abstract-textured-white-background.jpg) ;background-size:cover; "> 


	<div class="container">
		<div class="row justify-content-center">
			<!--至中-->
			<div class="col-4">
			<br><br>
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;評論修改</h1>
				<br><br>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">修改評論</h5>
<%-- 						<form:form class="form" method="post" modelAttribute="comment" --%>
<%-- 							action="${contextRoot}/comment/editComment"> --%>
							
<%-- 							<form:input type="hidden" path="id"/> --%>
<%-- 							<form:input type="text" path="time"/> --%>
<%-- 							<form:textarea path="comments" class="form-control" /> --%>
<!-- 							<br /> -->
<!-- 							<button type="submit">確認</button> -->

<%-- 						</form:form> --%>

<form action="${contextRoot}/comment/editComment" method="post">
<input type="number" name="id" value="${comment.id }" hidden="">
<textarea rows="" cols="" name="comments" >${comment.comments }</textarea>
<br>
<button type="submit" class="btn btn-primary">確認</button>
</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
<input type ="button" onclick="history.back()" value="回上一頁"></input>
</body>
<jsp:include page="layout/footer.jsp" />
</html>