<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- bootstrap 5.1.3 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- web icon -->
<!-- <link rel="icon" -->
<%-- 	href="${contextRoot}/img/favicon.ico"> --%>

<jsp:include page="layout/navbar.jsp" />


<html>
<head>
<meta charset="UTF-8">
<title>饗訂</title>


</head>
<body>
		<!-- 輪播圖片 -->
		<section class="py-5 text-center container">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/img/輪播2.jpg"
							class="d-block w-100"   width="500"  height="400"> 
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/img/輪播5.jpg"
							class="d-block w-100 " width="500"  height="400">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/img/2222.jpg"
							class="d-block w-100 " width="500"  height="400">
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/img/444k.jpg"
							class="d-block w-100 " width="500"  height="400">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>

	<div class="py-5 text-center container">
		<form action="${contextRoot}/restaurant/search" method="get">
			搜尋:<input type="text" name="keyword" placeholder="搜尋想吃的類型或店家">
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
						<a href="restaurant/${restaurant.id}/menu"
							style="color: black; text-decoration: none">
							<div class="col">
								<div class="card">
									<div style="width: 100%; height: 150px;">
										<img style="width: 100%; height: 100%"
											src="${contextRoot}/restaurant/downloadImage/${restaurant.id}"
											class="card-img-top img-thumbnail">
									</div>
									<div>
										<h5 style="margin-bottom: 0px;">
											<strong>${restaurant.name } </strong> <a
												href="${pageContext.request.contextPath}/restaurant/${restaurant.id}/comment"
												style="float: right; float: top">
												<button class="btn btn-outline-dark" type="button"
													style="padding-bottom: 3px; padding-top: 3px;">評論</button>
											</a>
										</h5>

									</div>
									<div>
										<span class="me-5">營業時間：<br />
											${restaurant.startDate}～${restaurant.endDate}<br />
											${restaurant.startTime}～${restaurant.endTime}
										</span>
										<!-- 										<div> -->
										<%-- 										<a href="${pageContext.request.contextPath}/restaurant/${restaurant.id}/menu"><button type="button" class="btn btn-success">菜單</button></a> --%>
										<%-- <%-- 										<a href="${pageContext.request.contextPath}/restaurant/${restaurant.id}/menu2"><button type="button">評論</button></a> --%>
										<%-- 										<a href="${pageContext.request.contextPath}/restaurant/${restaurant.id}/comment"><button type="button" class="btn btn-secondary">評論</button></a> --%>
										<!-- 										</div> -->
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				<!-- 重複的結構 -->

				<!-- 				<a -->
				<%-- 					href="/retaurant/intro/${restaurant.id}" --%>
				<!-- 					data-flood-closed-message="" class="hreview-aggregate url" -->
				<!-- 					data-vendor-id='135218'> -->
				<!-- 					<figure class="vendor-tile  item"> -->
				<!-- 						<picture> -->
				<!-- 						<div class="vendor-picture b-lazy" -->
				<!-- 							data-src="https://images.deliveryhero.io/image/fd-tw/LH/rap6-listing.jpg?width=400&amp;height=292|https://images.deliveryhero.io/image/fd-tw/LH/rap6-listing.jpg?width=800&amp;height=584"></div> -->
				<!-- 						</picture> -->
				<!-- 						<figcaption class="vendor-info"> -->
				<%-- 							<span class="headline"> <span class="name fn">${restaurant.name }</span> --%>
				<!-- 							</span> -->
				<!-- 							<ul class="categories summary"> -->
				<!-- 								<li><span class="budget-symbol--filled">$</span> <span -->
				<!-- 									class="budget-symbol--filled">$</span> <span>$</span></li> -->
				<!-- 								<li class="vendor-characteristic"><span>&lt;店內價&gt;</span> -->
				<!-- 									<span>台式</span></li> -->
				<!-- 							</ul> -->
				<!-- 							<ul class="extra-info mov-df-extra-info"> -->
				<!-- 							</ul> -->


				<!-- 						</figcaption> -->


				<!-- 					</figure> -->
				<!-- 				</a> -->
			</div>
		</div>
	</div>
	<jsp:include page="layout/footer.jsp" />
</body>
<script type="text/javascript">
	var b = [];
	sessionStorage.setItem('buy', JSON.stringify(b));
</script>
</html>