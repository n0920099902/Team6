<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>新增訊息頁面</title>
</head>
<body>

	<div class="container">

		<div class="row justify-content-center">
			<div class="col-8">
				<h1>新增留言頁面</h1>
				<div class="card">
					<div class="card-header">新增留言</div>
					<div class="card-body">

						<form:form class="form" method="post"
							modelAttribute="workMessages"
							action="${contextRoot}/postMessages">

							<form:textarea path="text" class="form-control" />
							<br />

							<button type="submit" class="btn btn-primary">Submit</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
         
         <br />
        <div class="row justify-content-center">
			<div class="col-8">
				<div class="card">
					<div class="card-header">最新留言時間 
					<span><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE" value="${latestMsg.added}"/></span>
					   </div>
					<div class="card-body">
                    ${latestMsg.text}
					</div>
				</div>
			</div>
		</div>

	</div>



</body>
</html>