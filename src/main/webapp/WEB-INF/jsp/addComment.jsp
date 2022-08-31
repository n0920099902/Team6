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
<title>新增評論頁面</title>
</head>
<body>
	<div class="container">

		<div class="row justify-content-center">
			<!--至中-->
			<div class="col-4">

				<h1>建立評論</h1>
				<br>
				<br>
				<br>
				<br>
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">新增評論</h5>

						<form:form class="form" method="post"
							modelAttribute="addCommentDto"
							action="${contextRoot}/postComment">
							<form:hidden path="orderId" value="${orderId }" />
							<div id="show"></div>
							<form:input path="score" id="score" type="hidden" />
							<form:textarea path="comments" class="form-control" />

							<br />
							<button type="reset" class="btn btn-secondary">取消</button>
							<button type="submit" class="btn btn-primary">張貼</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<br />


	</div>


</body>
<script type="text/javascript">
	var list = [];
	var num = 0;

	for (let i = 0; i < 5; i++) {
		document.getElementById('show').innerHTML += '<img id="img'
				+ i
				+ '" alt="" style="width: 30px ;height: 30px" onclick="changeScore()" src="${pageContext.request.contextPath}/StarPhoto/star_outline.svg">';
	}

	for (let i = 0; i < 5; i++) {
		list.push(document.getElementById('img' + i));
		list[i].addEventListener('mouseover', Full);
		list[i].addEventListener('mouseout', Empty);
	}
	function Full() {
		var buttonId = event.target.id;
		var rowId = buttonId.split("img")[1];
		for (let i = 0; i < +(rowId) + 1; i++) {
			document.getElementById('img' + i).src = "${pageContext.request.contextPath}/StarPhoto/star.svg";
		}
	}

	function Empty() {
		var buttonId = event.target.id;
		var rowId = buttonId.split("img")[1];
		for (let i = 0; i < +(rowId) + 1; i++) {
			document.getElementById('img' + i).src = "${pageContext.request.contextPath}/StarPhoto/star_outline.svg";
			if (num > 0) {
				for (let i = 0; i < num; i++) {
					document.getElementById('img' + i).src = "${pageContext.request.contextPath}/StarPhoto/star.svg";
				}
			}
		}
	}
	function changeScore() {
		var buttonId = event.target.id;
		var rowId = buttonId.split("img")[1];
		document.getElementById('score').value = +(rowId) + 1;
		num = +(rowId) + 1;
		for (let i = 4; i >= num; i--) {
			document.getElementById('img' + i).src = "${pageContext.request.contextPath}/StarPhoto/star_outline.svg";
		}
	}
</script>
</html>