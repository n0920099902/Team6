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

<c:forEach var="comment" items="${page.content}">
<div class="row justify-content-center">
			<div class="col-4">
				<div class="card" style="width: 18rem;">
					<div class="card-header">評論 
					<span><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${comment.time}"/></span>
					</div>
					<div class="card-body">
					
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

</c:forEach>

<div class="row justify-content-center">
<div class="col-4">
<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				
				
				<c:choose>
				
					<c:when  test="${page.number != pageNumber -1}">
					<a href="${contextRoot}/comment/viewComment?p=${pageNumber}">
							${pageNumber} </a>
					
					</c:when>
					
				    <c:otherwise>
				       ${pageNumber}
				    </c:otherwise>
					
				</c:choose>

				</c:forEach>
				</div>
				</div>
</body>
</html>