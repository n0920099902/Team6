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
	<br><br>
	<h2>我的評論</h2>
	</div>
	<br><br>
	<div class="container">
<c:if test="${empty comment }">
<h4 style="text-align:center">尚無評論</h4>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</c:if>
<c:if test="${!empty comment }">
				<c:forEach items="${comment }" var="c">
<!-- 					<tr> -->
<%-- 						<td>${c.accountName }</td> --%>
<%-- 						<td>${c.comments }</td> --%>
<%-- 						<td id="${c.score }" class="star"></td> --%>
<%-- 						<td> <fmt:formatDate  value="${c.time}" pattern="yyyy-MM-dd HH:mm"/></td> --%>

<!-- 					</tr> -->
  <div class="card-body">
  <b>訂單編號:</b>
  <c:out value="${c.orders.id }"></c:out>
  <br><br>
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
  	&emsp;
  	<a href="${pageContext.request.contextPath}/comment/viewComment/${c.orders.id}"><button type="button" class="btn btn-outline-dark">查看評論</button></a>
  	<br><br>
 	<hr style="border-top:6px solid #000000;"/>
				</c:forEach>
				</c:if>
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