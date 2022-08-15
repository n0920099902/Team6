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
<meta charset="UTF-8">
<title>會員資料</title>
</head>
<body>

	<h1>搜尋</h1>

	<div class="py-5 text-center container">
		<form action="${contextRoot}/member/search" method="get">
			搜尋:<input type="text" name="search" placeholder="搜尋帳戶">
			<button>GO</button>
		</form>

	</div>
	<div class="container">

		<div class="row justify-content-center">
			<div class="col-8">
				<h1>後臺管理</h1>
				<div class="card">
					<div class="card-header">會員資料</div>
					<div class="card-body">



						<table>
							<tr>
								<td>account</td>
								<td>password</td>
								<td>email</td>
								<td>phone</td>
								<td>birthday</td>
								<td>access</td>
								<td>remark</td>
							</tr>
						</table>
						<c:forEach items="${allmember}" var="m">


							<table>
								<tr>
									<td>${m.account }</td>
									<td>${m.password }</td>
									<td>${m.email }</td>
									<td>${m.phone }</td>
									<td>${m.birthday }</td>
									<td>${m.access }</td>
									<td>${m.remark }</td>
								</tr>
							</table>
							<div class="edit-link">
								<a href="${contextRoot}/member/update/${m.id}">編輯</a> <a
									href="${contextRoot}/member/delete/${m.id}"
									onclick="return confirm('確認刪除?')">刪除</a>
							</div>

						</c:forEach>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- 重複的結構 -->
	<%-- 	</form> --%>
</body>
</html>