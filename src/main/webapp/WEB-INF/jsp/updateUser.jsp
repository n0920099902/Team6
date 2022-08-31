<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar.jsp" />
<head>
<meta charset="UTF-8">
<title>會員修改頁面</title>
</head>
<body>

	<div class="container">

		<div class="row justify-content-center">
			<div class="col-8">
				<h1>會員修改頁面測試</h1>
				<div class="card">
					<div class="card-header">修改會員資料</div>
					<div class="card-body">

						<form:form class="form" method="post" modelAttribute="member"
							action="${contextRoot}/users/updateUser"
							enctype='multipart/form-data'>
								<form:input type="hidden" path="id" />
							<ul>
								<li>帳號:&nbsp;<form:hidden path="account" />${member.account }</li>
								<form:input type="hidden" path="access" />
								<li>修改電子郵件:&nbsp;<form:input type="email" path="email"
										value="${member.email }" /></li>
								<li>修改電話:&nbsp;<form:input type="text" path="phone"
										value="${member.phone }" /></li>
								<c:if test="${member.access == 'User' }">
								<li>修改出生年月日:&nbsp;<form:input type="date" path="birthday"
										value="${member.birthday }" /></li>
								</c:if>
								<li>修改大頭貼:<form:input type="file" path="Image"
										 /></li>
							</ul>
							<br />
							<button type="submit" class="btn btn-primary">Submit</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function openFile(event) {
		var input = event.target; //取得上傳檔案
		var reader = new FileReader(); //建立FileReader物件

		reader.readAsDataURL(input.files[0]); //以.readAsDataURL將上傳檔案轉換為base64字串

		reader.onload = function() { //FileReader取得上傳檔案後執行以下內容
			var dataURL = reader.result; //設定變數dataURL為上傳圖檔的base64字串
			$('#output').attr('src', dataURL).show(); //將img的src設定為dataURL並顯示
		};
	}
</script>
</html>