<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1 style="text-align:center">我的評論</h1>


<div class="container">

<br/>

<br/>


<table class="table table-hover"
		style="width: 100%; table-layout: fixed;">
		<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th style="width: 50px;"> -->
<!-- 				<label class="control control--checkbox"> -->
<!-- 						<input type="checkbox" class="js-check-all" /> -->
<!-- 				</label></th> -->
<!-- 				<th scope="col" style="width: 80px">使用者</th> -->
<!-- 				<th scope="col" style="width: 180px ; text-align:center">評分</th> -->
<!-- 				<th scope="col">評論內容</th> -->
<!-- 				<th scope="col">時間</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
		<tbody>
		
		<c:choose>
		
		<c:when test="${not empty userComment}">

			<c:forEach  var="c" items="${comment}" >
				<tr scope="row">
					<td class="align-middle"><label
						class="control control--checkbox"><input type="checkbox"
							id="check" value="<c:out value='${comment.commentId}'/>"
							style="margin-top: 20px;" />
						</label></td>
						<td class="align-middle">
						<div class="d-flex align-items-center">
							<c:out value="${comment.storeBean.firmBean.firmName}"></c:out>
						</div>
					</td>
					<td class="align-middle">
						<div class="d-flex align-items-center">
							<c:out value="${comment.storeBean.storeName}"></c:out>
						</div>
					</td>
					<td class="align-middle"><c:out value="${comment.userBean.userName}"></c:out>
					</td>
					<td class="align-middle"><div style="pointer-events: none; width: 150px;" id="scores${comment.commentId}" class="awesomeRating"></div>
					
					<div class="awesomeRatingValue"></div>
						<script type="text/javascript">
						
							$("#scores${comment.commentId}").awesomeRating({
								
								valueInitial: "${comment.score}",
								values: ["1.0", "2.0", "3.0", "4.0", "5.0"],
								targetSelector: "span.awesomeRatingValue"
							});
						
							console.log(${comment.score});
						</script>

					<td class="align-middle"><c:out value="${comment.content}"></c:out></td>

					<td class="align-middle">(時間) <fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${comment.time}" /></td>
					
					<td class="align-middle" style="width: 13%;">
					<a href="${contextRoot}/front/comment/all?storeid=${comment.storeBean.storeId}"><button class="btn btn-primary">前往</button></a>
					</td>
				</tr>
			</c:forEach>
			
			</c:when>
			<c:otherwise>
			<br>
			<br>
			<br>
			<br><br><br><br><br><br><br>
			<br>
			<br>
				<h3 style="text-align:center ; color: red">您目前沒有任何評論~</h3>
			<br>
			<br>
			<br>
			<br><br><br><br><br><br><br>
			<br>
			<br>
			</c:otherwise>
			
			</c:choose>
			
			

		</tbody>
	</table>


<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

</div>

</body>
<jsp:include page="layout/footer.jsp" />
</html>