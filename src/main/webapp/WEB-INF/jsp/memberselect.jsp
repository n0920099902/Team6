<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/navbar2.jsp" />


<html>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<head>
<style>
/*body {
	margin: 0px;
	padding: 0px;
	background: #fff url("${contextRoot}/img/jpg") center center fixed
		no-repeat;
	　 /*/
設定背景圖片的呈現方式
*
/
background-size
:
cover
;
　 /*/設定背景圖片的填滿方式 */
}
*
/
</style>
<script>
	$(document).ready(function() {
		$('#memberTable').DataTable({
			"lengthMenu" : [ 10, 5, 2, 1 ],
			"language" : {
				"lengthMenu" : "顯示 MENU 項結果",
				"search" : "搜尋:",
				"info" : "顯示第 1 至 10 項結果，共 TOTAL 項",
				"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
				"scrollCollapse" : true,
				"scrollX" : "1000px",
				"scrollY" : "2000px",
				"paginate" : {
					"first" : "第一頁",
					"previous" : "上一頁",
					"next" : "下一頁",
					"last" : "最後一頁"
				}

			}
		});
	});
</script>
<meta charset="UTF-8">
<title>會員資料</title>
</head>
<%-- <body background="${contextRoot}/img/2.jpg"> --%>


<div class="container">
	<c:choose>
		<c:when test="${member.id == null}">
			<a href="${contextRoot}/login">點此登入 </a>
		</c:when>
		<c:when test="${member.access == 'Admin' }">
			<c:choose>
				<c:when test="${empty m}">
	   			 沒有任何會員資料<br />
				</c:when>
				<c:otherwise>
					<!-- 					<div class="py-5 text-right container"> -->
					<%-- 						<form action="${contextRoot}/member/search" method="get"> --%>
					<!-- 							搜尋:<input type="text" name="search" placeholder="搜尋帳戶"> -->
					<!-- 							<button>GO</button> -->
					<%-- 						</form> --%>
					<!-- 					</div> -->
					<h1>後臺管理</h1>
					<div class="card-header">會員資料</div>
					<table id="memberTable" class="table table-striped"
						style="border: 3px #cccccc solid;">
						<thead style="background: lightgray" class="container">
							<tr class="col-md-center">
								<th scope="col">帳號</th>
<!-- 								<th>密碼</th> -->
								<th scope="col">信箱</th>
								<th scope="col">電話</th>
								<th scope="col">生日</th>
								<th scope="col">權限</th>
								<th scope="col">圖片</th>
								<th scope="col">修改</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody class="container">
							<c:forEach items="${allmember}" var="m">
								<tr >
									<td scope="row"> ${m.account }</td>
<%-- 									<td>${m.password }</td> --%>
									<td>${m.email }</td>
									<td>${m.phone }</td>
									<td>${m.birthday }</td>
									<td>${m.access }</td>
									<td><img style="height: 100px" alt=""
										src="${contextRoot}/member/img?id=${m.id}"></td>
									<td><a href="${contextRoot}/Users/update/${m.id}">編輯</a></td>
									<td><a href="${contextRoot}/Users/delete/${m.id}"
										onclick="return confirm('確認刪除?')">刪除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
		權限不足，
			<a href="${contextRoot}/">點此返回 </a>
		</c:otherwise>
	</c:choose>
</div>

<script>
	function ckMemberAccess() {
		let mAccess = document.getElementById("memberAccess").value;
		if (mAccess != "Admin") {
			document.getElementById("memberout").innerHTML = "權限不足";
		}
	}
</script>
</body>
</html>