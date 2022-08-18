<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${message }
	<form action="${pageContext.request.contextPath}/dish/go"
		method="POST" enctype="multipart/form-data">
		<div>
			<!-- 		餐廳ID -->
			<input type="number" name="rID" value="${id }" hidden="">
		</div>
		<div>
			<!-- 		name -->
			<input type="text" name="rName" value="${name}"hidden="">
		</div>
		<div>
			餐點名稱： <input type="text" name="dName" required>
		</div>
		<div>
			餐點價錢： <input type="number" name="dPrice" required>
		</div>
		<div>
				餐點總類： <select name="dishType">
					<c:forEach items="${dishType}" var="t">
						<option value="${t.id}">${t.category}</option>
					</c:forEach>
				</select>
			</div>
		<div>
			餐點狀態： <input type="text" name="dS" value="準備中" required>
		</div>
		<div>
			餐點圖片： <input type="file" name="Img" onchange="openFile(event)">
		</div>

		<img id="output" height="200" style="display: none">
		<button>新增</button>
	</form>
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