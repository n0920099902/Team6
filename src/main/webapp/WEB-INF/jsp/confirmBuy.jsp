<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${message }
<a href="http://localhost:8080/FeastEat/" id="a"></a>
</body>
</html>
<script type="text/javascript">

var time=3;

window.onload=returnUrlByTime();

setTimeout("location.href='http://localhost:8080/FeastEat/'",3000);

function returnUrlByTime() {

	
	window.setTimeout('returnUrlByTime()', 1000);

	

	document.getElementById("a").innerHTML = time+'秒後,回到主頁';
	
	time = time - 1;
}

</script>