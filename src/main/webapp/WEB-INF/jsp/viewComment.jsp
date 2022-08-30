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
	<h1>查看評論</h1>
</div>


<c:if test="${empty comment }">
<h3>${message }</h3>
<a href="${contextRoot}/comment/add/${orderId}"><button>新增評論</button></a>
</c:if>

<c:if test="${!empty comment }">
<div class="row justify-content-center">
			<div class="col-4">
				<div class="card" style="width: 18rem;">
					<div class="card-header">評論 
					<span><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${comment.time}"/></span>
					</div>
					<div class="card-body">
					<div>
					<c:forEach begin="1" end="${comment.score }">
  <img alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">
                    </c:forEach></div>
					<div>${comment.comments}</div>
					<div class="edit-link">
					<a href="${contextRoot}/comment/editComment/${comment.id}">修改</a>
					<a onclick="return confirm('是否刪除')" href="${contextRoot}/comment/deleteComment/${comment.id}">刪除</a>
					</div>
					</div>
				</div>
				<br/>
			</div>
			
		</div>
</c:if>
</body>
</html>