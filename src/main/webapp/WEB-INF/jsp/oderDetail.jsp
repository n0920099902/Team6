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
<title>Insert title here</title>
</head>
<body style="background:url(${pageContext.request.contextPath}/img/abstract-textured-white-background.jpg) ;background-size:cover; "> 

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<!-- 重複的結構 -->
				<c:forEach items="${OrderDetail }" var="o">
					<div>
						<div class="col">
							<div class="card">
								
								<div class="headline">訂單編號${o.orders.id } 餐點:${o.dish.dishName }</div>
								<div class="card-footer text-end">
								<img style="height: 200px"
									src="${contextRoot}/cart/downloadImage/${o.dish.id}"
									class="card-img-top">

									價錢:  ${o.dish.dishPrice}<br>
									數量:  ${o.quantity }<br>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

</body>
<jsp:include page="layout/footer.jsp" />
</html>