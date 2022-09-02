<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!-- web icon -->
<!-- <link rel="icon" -->
<%-- 	href="${contextRoot}/img/favicon.ico"> --%>

<jsp:include page="layout/navbar.jsp" />


<html>
<head>
<meta charset="UTF-8">
<title>Restuarant</title>


</head>
<body>
	<h1>店家頁面測試</h1>

	<div class="py-5 text-center container">
		<form action="${contextRoot}/restaurant/search" method="get">
			搜尋:<input type="text" name="keyword" placeholder="想要收搜尋的商品">
			<button>GO</button>
		</form>
	</div>
	<!-- 		<div class="py-5 text-center container"> -->
	<!-- 			金錢排序(由小到大)<input type="checkbox" id="cbox1" name="cbox1" value="ok" -->
	<!-- 				onclick="ch()"> <a href="" id="change"><button>套用</button></a> -->
	<!-- 		</div> -->
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<!-- 重複的結構 -->
				<c:forEach items="${allRestaurant }" var="restaurant">
					<div>
						<a class="s" href="restaurant/${restaurant.id}/menu" id="${restaurant.id}"
							 style="color: black; text-decoration: none">
							<div class="col">
								<div class="card">
									<img 
										width: "150px", height: "150px" 
										class="img-thumbnail"
										src="${contextRoot}/restaurant/downloadImage/${restaurant.id}"
										class="card-img-top">
									<div class="headline">
										<h5>${restaurant.name }</h5>
									</div>
									<div>
										<span class="me-5">營業時間：<br />
											${restaurant.startDate}～${restaurant.endDate}<br />
											${restaurant.startTime}～${restaurant.endTime}
										</span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="layout/footer.jsp" />
</body>
<script type="text/javascript">
	var list = JSON.parse(sessionStorage.getItem('buy'));
 	var s = document.getElementsByClassName('s');
		for (let i = 0; i < s.length; i++) {
			s[i].addEventListener("click", getR);
		}
 	
	function getR(event) {
		var aId = this.id;
		if(list==null){//購物車為空 拿到餐廳ID 存成session
		sessionStorage.setItem('point', JSON.stringify(aId));
		}
		
	
	}
	
	
</script>
</html>