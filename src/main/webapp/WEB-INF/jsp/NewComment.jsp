<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../css/font-awesome.min.css" rel="stylesheet" />
<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/responsive.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>評論</h2>
	<div class="container">

		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">帳號</th>
					<th scope="col">評論內容</th>
					<th scope="col">評分</th>
					<th scope="col">評論時間</th>
				</tr>
			</thead>

			<tbody id="commentBody">

				<c:forEach items="${comment }" var="c">
					<tr>
						<td>${c.accountName }</td>
						<td>${c.comments }</td>
						<td id="${c.score }" class="star"></td>
						<td>${c.time }</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
// $(document).ready(function(){
// 	$("#star")
// })
// for(let i=0;i<element.score;i++){
// 	str+='<img alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">';
// }
// document.getElementById("star").innerHTML='<img class="img" " alt="" style="width: 30px ;height: 30px" src="">';
var star = document.getElementsByClassName('star');

for(let i=0;i<star.length;i++){
	let a= star[i].id;
	for(let j=0;j<a;j++){
	star[i].innerHTML+='<img class="img" " alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">';
	}
}
</script>
</html>