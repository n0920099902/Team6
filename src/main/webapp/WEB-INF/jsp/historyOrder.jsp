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
<body>
${message }

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<!-- 重複的結構 -->
				<div>
				<br>
				<h1>待付款訂單</h1>
				<br>
				<c:forEach items="${Horders }" var="o">
				<c:if test="${o.remark=='待付款' }">
					<div>
						<div class="col">
							<div class="card">
								
								<div class="headline">訂單編號${o.id }</div>
								<div class="card-footer text-end">
									訂單總金額:  ${o.totalPrice }<br>
									訂單電話:  ${o.phone }<br>
									訂單地址:  ${o.address }<br>
									訂單時間:  ${o.ordersTime }<br>
									訂單狀況:  ${o.remark }<br>
									<a href="${pageContext.request.contextPath}/restaurant/cart/payment/${o.id}"><button type="button" >去結帳</button></a>
									<a href="${pageContext.request.contextPath}/OrderDetail/${o.id}" class="card-link"><button type="button" class="btn btn-outline-success">訂單詳細資訊</button></a>
<%-- 									<a href="${pageContext.request.contextPath}/comment/viewComment/${o.id}" class="card-link"><button type="button" class="btn btn-outline-primary">我的評論</button></a> --%>
								</div>
							</div>
						</div>
					</div>
			    </c:if>
				</c:forEach>
				</div>
				<div>
				<br>
				<h1>已付款訂單</h1>
				<br>
				<c:forEach items="${Horders }" var="o">
				<c:if test="${o.remark=='已付款' }">
					<div>
						<div class="col">
							<div class="card">
								
								<div class="headline">訂單編號${o.id }</div>
								<div class="card-footer text-end">
									訂單總金額:  ${o.totalPrice }<br>
									訂單電話:  0${o.phone }<br>
									訂單地址:  ${o.address }<br>
									訂單時間:  ${o.ordersTime }<br>
									訂單狀況:  ${o.remark }<br>
									<a href="${pageContext.request.contextPath}/restaurant/cart/payment/${o.id}"><button type="button" >再次購買</button></a>
									<a href="${pageContext.request.contextPath}/OrderDetail/${o.id}"><button class="btn btn-outline-success">訂單詳細資訊</button></a>
									<a href="${pageContext.request.contextPath}/comment/viewComment/${o.id}" class="card-link"><button type="button" class="btn btn-outline-primary">我的評論</button></a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				</c:forEach>
				</div>

</body>
</html>