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
<title>Restuarant</title>
</head>
<body>
	<h1>店家頁面測試1</h1>

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
<%-- /getAlldish/${restaurant.id} --%>
				<!-- 重複的結構 -->
				<c:forEach items="${allRestaurant }" var="restaurant">
					<div>
						<a href="${contextRoot}/restaurant/cart/getAlldish/${restaurant.id}"  style="color: black ; text-decoration:none">
							<div class="col">
								<div class="card">
									<img style="height: 200px"
										src="${contextRoot}/restaurant/downloadImage/${restaurant.id}"
										class="card-img-top">
									<div class="headline">${restaurant.name }</div>
									<div class="card-footer text-end">
										<span class="me-5">營業時間：${restaurant.startDate}～${restaurant.endDate}<br/>
										${restaurant.starttime}～${restaurant.endtime}</span>
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
				</a>
			</div>
		</div>
	</div>
</body>
</html>