<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />

<html>
<head>
<style>
/*body {
	margin: 0px;
	padding: 0px;
	background: #fff url("${contextRoot}/img/jpg") center center fixed
		no-repeat;
	　 /*/設定背景圖片的呈現方式 */
	background-size
	:
	cover;
	　 /*/設定背景圖片的填滿方式 */
}*/
</style>
<meta charset="UTF-8">
<title  >會員資料</title>
</head>
<%-- <body background="${contextRoot}/img/2.jpg"> --%>


<h1>搜尋</h1>

<div class="py-5 text-center container">
	<form action="${contextRoot}/member/search" method="get">
		搜尋:<input type="text" name="search" placeholder="搜尋帳戶">
		<button>GO</button>
	</form>

</div>
<div class="container">


	<h1>後臺管理</h1>

	<div class="card-header">會員資料</div>

	<table style="border: 3px #cccccc solid;">
		<div class="container">
			<div class="row">
				<div class="col">帳號</div>
				<div class="col">密碼</div>
				<div class="col">信箱</div>
				<div class="col">電話</div>
				<div class="col">生日</div>
				<div class="col">圖片</div>
				<div class="col">修改</div>
				<div class="w-100"></div>
			</div>
		</div>


		<c:forEach items="${allmember}" var="m">

			<div class="container">
				<div class="row">
					<div class="col">${m.account }</div>
					<div class="col">${m.password }</div>
					<div class="col">${m.email }</div>
					<div class="col">${m.phone }</div>
					<div class="col">${m.birthday }</div>
					<div class="col">
						<img style="height: 100px" alt=""
							src="${contextRoot}/member/img?id=${m.id}">
					</div>
					<div class="col">
						<a href="${contextRoot}/Users/update/${m.id}">編輯</a> <a
							href="${contextRoot}/Users/delete/${m.id}"
							onclick="return confirm('確認刪除?')">刪除</a>
					</div>
					<div class="w-100"></div>
					<div class="edit-link"></div>
				</div>
			</div>




		</c:forEach>
	</table>
</div>



<!-- 重複的結構 -->
<%-- 	</form> --%>
</body>
</html>