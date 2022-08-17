<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>購物清單</title>
				</head>

				<body>
					<h2>購物清單</h2>

					<table id="mytable">
						<c:forEach var="food" items="${goodPhotoList}">
							<tr>
								<td>${onePhoto.photoName}</td>
								<td><img width="100" src="${contextRoot}/downloadImage/${onePhoto.id}"></td>
							</tr>
							<div>
								
							</div>
						</c:forEach>
					</table>










				</body>
				<script type="text/javascript">
					function addOrder() {
						var xhr = new XMLHttpRequest();
						xhr.withCredentials = true;

						xhr.addEventListener("readystatechange", function () {
							if (this.readyState === 4) {
								var content = '';
								var dish = JOSN.parse(xhr.responseText);
								for (var i = 0; i < dish.length; i++) {
									content += '<a href="' + "${contexRoot}/order?dish_id=" + dish[i].dishId + "&&user_id=${result.usrId }" + '">' +
										dish[i].dishName + '</a><br>';
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