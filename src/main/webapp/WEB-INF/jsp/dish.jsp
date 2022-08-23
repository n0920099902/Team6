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
	<h1>店家頁面測試</h1>

	<div class="py-5 text-center container">
		<form action="${contextRoot}/restaurant/search" method="get">
			搜尋:<input type="text" name="keyword" placeholder="想要收搜尋的商品">
			<button>GO</button>
		</form>
	</div>
	<a href="${contextRoot}/goCart.controller"><button>前往購物車</button></a>
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

				<!-- 重複的結構 -->
				<c:forEach items="${allDish }" var="d">
					<div>

						<div class="col">
							<div class="card">
								<img style="height: 200px"
									src="${contextRoot}/dish/downloadImage/${d.id}"
									class="card-img-top">
								<div class="headline">餐點名稱: ${d.dishName }</div>
								<div>價格: ${d.dishPrice }</div>
							
								<div>
									<form action="${contextRoot}/buyList/${rid }/${d.id }"
										method="get">
										數量<input type="number" name="quantity" min="0"
											style="width: 20%; margin-right: 40%" value="1" required>
										<button onclick="add()">加入購物車</button>
									</div>
						    	</form>
								
							

							</div>
						</div>
						</a>
					</div>
				</c:forEach>
				
				
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function add() {
		alert('加入購物車');
	}
	
	
</script>
</html>