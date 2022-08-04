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
<meta charset="UTF-8">
<title>查看留言</title>
</head>
<body>

	<div class="container">
		<h1>查看留言頁面</h1>

		<c:forEach var="workMessage" items="${page.content}">
			<div class="row justify-content-center">
				<div class="col-8">
					<div class="card">
						<div class="card-header">
							留言時間 <span><fmt:formatDate
									pattern="yyyy/MM/dd HH:mm:ss EEEE" value="${workMessage.added}" /></span>
						</div>
						<div class="card-body">
						
						<div>${workMessage.text}</div>
						<div class="edit-link">
						<a href="${contextRoot}/message/editMessage/${workMessage.id}">編輯</a>
						<a onclick="return confirm('確認刪除?')" href="${contextRoot}/message/deleteMessage/${workMessage.id}">刪除</a>
						</div>
						
						
						</div>
					</div>
				</div>
			</div>
			<br />
		</c:forEach>

		<div class="row justify-content-center">
			<div class="col-8">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				
				
				<c:choose>
				
					<c:when  test="${page.number != pageNumber -1}">
					<a href="${contextRoot}/message/viewMessages?p=${pageNumber}">
							${pageNumber} </a>
					
					</c:when>
					
				    <c:otherwise>
				       ${pageNumber}
				    </c:otherwise>
					
				</c:choose>

				</c:forEach>
			</div>
		</div>


	</div>


</body>
</html>