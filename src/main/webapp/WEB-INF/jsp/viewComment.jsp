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
<title>查看評論</title>
</head>
<body>

<div class="container">
	<h1 style="text-align:center">查看訂單評論</h1>
</div>
<br>
<br>
<br>
<br>

<c:if test="${empty comment }">
<h4 style="text-align:center">${message }</h4>

<div style="text-align:center">
<a href="${contextRoot}/comment/add/${orderId}" class="card-link"><button type="button" class="btn btn-outline-primary">去評論</button></a>
</div>
</c:if>

<c:if test="${!empty comment }">
<div class="row justify-content-center">
			<div class="col-4">
				<div class="card">
					<div class="card-header" >
					<div>
					<b>留言時間:&emsp; </b>
					<span><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${comment.time}"/></span>
					</div>
					</div>
					<div class="card-body">
					<div>
					<div>
					<b>評價:&emsp;</b>
					<c:forEach begin="1" end="${comment.score }">
  <img alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">
                    </c:forEach></div>
                    <br>
                    <b>內文:&emsp;</b>
					<div >${comment.comments}</div>
					<br>
					<div class="row justify-content-center">
					<div class="edit-link">
					<a href="${contextRoot}/comment/editComment/${comment.id}" class="card-link"><button type="button" class="btn btn-primary">修改</button></a>
					<a onclick="return confirm('是否刪除')" href="${contextRoot}/comment/deleteComment/${comment.id}" class="card-link"><button type="button" class="btn btn-danger">刪除</button></a>
					</div>
					</div>
					</div>
				</div>
				<br/>
			</div>
			</div>
		</div>
</c:if>
</body>
</html>