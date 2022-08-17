<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" th:href="@{css/bootstrap.min.css}">
<script th:src="@{js/jquery.min.js}"></script>
<script th:src="@{js/bootstrap.min.js}"></script>
<script th:src="@{js/vue.js}" type="text/javascript" charset="utf-8"></script>
<script th:src="@{js/axios.min.js}"></script>
</head>
<body>
	<div class="table-responsive">
		<table class="table">
			<caption>响应式表格布局</caption>
			<thead>
				<tr>
					<th>编号</th>
					<th>商品名称</th>
					<th>商品价格</th>
					<th>商品描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<tr th:each="Shoppings:${sysShoppings}">
					<th th:text="${Shoppings.spid}"></th>
					<th th:text="${Shoppings.getSpname()}"></th>
					<th th:text="${Shoppings.spprice}"></th>
					<th th:text="${Shoppings.spdesc}"></th>
					<th th:if="${session.user==null}"><a href="/login">放入购物车</a></th>
					<th th:if="${session.user!=null}"><a
						th:href="@{/cart(spid=${Shoppings.spid})}">购买</a></th>
			</tbody>
		</table>
	</div>
</body>

<script type="text/javascript">
	function addOrder() {
		var xhr = new XMLHttpRequest();
		xhr.withCredentials = true;

		xhr.addEventListener("readystatechange", function() {
			if (this.readyState === 4) {
				var content = '';
				var dish = JOSN.parse(xhr.responseText);
				for (var i = 0; i < dish.length; i++) {
					content += '<a href="' + "${contexRoot}/order?dish_id="
							+ dish[i].dishId + "&&user_id=${result.usrId }"
							+ '">' + dish[i].dishName + '</a><br>';
					console.log(dish[i].dishId);
				}
				document.getElementById("myOrder").innerHTML = content;
				//				console.log(this.responseText);
			}
		});

		xhr.open("GET", "http://localhost:8080/cart", true);

		xhr.send(data);

	}
	// 	function shoppingCar() {
	// 		var id = $("#baga").val();
	// 		var color = $("#hiddenColor").val();
	// 		var size = $("#hiddenSize").val();
	// 		location.href = "/demo/shoppingCart?id=" + id + "&color=" + color
	// 				+ "&size=" + size;
	// 	}
</script>

</html>