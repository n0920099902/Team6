<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結帳完成</title>
</head>
<body style="background:url(${pageContext.request.contextPath}/img/abstract-textured-white-background.jpg) ;background-size:cover; "> 
${message }
<a href="http://localhost:8080/FeastEat/" id="a"></a>
<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<!-- 重複的結構 -->
					<div>
						<div class="col">
							<div class="card">

								<div class="headline">訂單編號${Horders.id }</div>
								<div class="card-footer text-end">
									訂單總金額: ${o.totalPrice }<br> 訂單電話: ${Horders.phone }<br>
									訂單地址: ${o.address }<br> 訂單時間: ${Horders.ordersTime }<br> <a
										href="${pageContext.request.contextPath}/OrderDetail/${Horders.id}"><button class="btn btn-outline-success">訂單詳細資訊</button></a>
									<a
										href="${pageContext.request.contextPath}/comment/viewComment/${Horders.id}"><button class="btn btn-outline-primary">評論</button></a>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>

</body>
<jsp:include page="layout/footer.jsp" />
</html>
<script type="text/javascript">

var time=3;

window.onload=returnUrlByTime();

setTimeout("location.href='http://localhost:8080/FeastEat/'",3000);

function returnUrlByTime() {

	
	window.setTimeout('returnUrlByTime()', 1000);

	

	document.getElementById("a").innerHTML = time+'秒後,回到主頁';
	
	time = time - 1;
}

</script>