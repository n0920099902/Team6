<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<link href="../../css/font-awesome.min.css" rel="stylesheet" />
<link href="../../css/style.css" rel="stylesheet" />
<link href="../../css/responsive.css" rel="stylesheet" />
<!--------------->
<style>

div.awesomeRating {
	font-size: 2em;
}


/*                背景滿版     */
                    html { 
            			height: 100%; 
     					} 
                    body {
                        background-image: url("<c:url value="${contextRoot}/img/white.jpg"/>");
                        background-repeat: no-repeat;
                        background-attachment:fixed;
                        background-position: 50% 40%;
                        background-size: 100% 120%;
                    }
/*                背景滿版    */

                    .swiper-container {
                        width: 830px;
                        height: 370px;
                    }
                </style>
<!-- bootstrap5.2 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="heading_container heading_center">
	<h2>評論區</h2>
	</div>
	<br><br>
	<div class="container">
<!-- 		<table class="table table-striped"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th scope="col">帳號</th> -->
<!-- 					<th scope="col">評論內容</th> -->
<!-- 					<th scope="col">評分</th> -->
<!-- 					<th scope="col">評論時間</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->

<!-- 			<tbody id="commentBody"> -->

				<c:forEach items="${comment }" var="c">
<!-- 					<tr> -->
<%-- 						<td>${c.accountName }</td> --%>
<%-- 						<td>${c.comments }</td> --%>
<%-- 						<td id="${c.score }" class="star"></td> --%>
<%-- 						<td> <fmt:formatDate  value="${c.time}" pattern="yyyy-MM-dd HH:mm"/></td> --%>

<!-- 					</tr> -->
<div class="card-header">
		<c:out value="帳號: ${c.accountName}"></c:out>
  </div>
  <div class="card-body">
  	<b>評價:</b>
  	<div id="${c.score}" class="star"></div>
  	<br>
	<b>內文:</b>
	<br><br>
	<c:out value="${c.comments }"></c:out>
	<br><br>
	<b>時間:</b> 
	<fmt:formatDate pattern="yyyy 年 MM 月 dd 日 a hh:mm:ss EEEE" value="${c.time}" />
  		  </div>
<br><br>
				</c:forEach>
<!-- 			</tbody> -->
<!-- 		</table> -->
	</div>
</body>
<!-- bootstrap5.2 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
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
<jsp:include page="layout/footer.jsp" />
</html>