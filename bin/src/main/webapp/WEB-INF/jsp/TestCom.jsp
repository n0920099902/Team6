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

<h1>GoComment	</h1>
	<div id="show" >
		</div>
	<div>
		<input type="number" value="0" id="score" >
	</div>
</body>
<button onclick="sss()">123</button>

<script type="text/javascript">
var list=[];
var num=0;

for(let i=0;i<5;i++){
	document.getElementById('show').innerHTML+='<img id="img'+i+'" alt="" style="width: 30px ;height: 30px" onclick="changeScore()" src="${pageContext.request.contextPath}/StarPhoto/star_outline.svg">';
}

for(let i=0;i<5;i++){
	list.push(document.getElementById('img'+i));
	list[i].addEventListener('mouseover',  Full);
	list[i].addEventListener('mouseout', Empty);
}
function Full(){
	var buttonId = event.target.id;	
	var rowId = buttonId.split("img")[1];
	for(let i=0;i<+(rowId)+1;i++){
		document.getElementById('img'+i).src="${pageContext.request.contextPath}/StarPhoto/star.svg";
	}
}

function Empty(){
	var buttonId = event.target.id;	
	var rowId = buttonId.split("img")[1];
	for(let i=0;i<+(rowId)+1;i++){
		document.getElementById('img'+i).src="${pageContext.request.contextPath}/StarPhoto/star_outline.svg";
		if(num>0){
			for(let i=0;i<num;i++){
				document.getElementById('img'+i).src="${pageContext.request.contextPath}/StarPhoto/star.svg";
			}
		}
	}
}
  function changeScore() {
	var buttonId = event.target.id;	
	var rowId = buttonId.split("img")[1];
	 document.getElementById('score').value=+(rowId)+1;
	 num=+(rowId)+1;
	 for(let i=4;i>=num;i--){
			document.getElementById('img'+i).src="${pageContext.request.contextPath}/StarPhoto/star_outline.svg";
		}
}
</script>
</html>