<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/navbar2.jsp" />
<html>
  <head>
  <meta charset="UTF-8">
<title>後台首頁</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
//      google.charts.load('current', {'packages':['corechart']}); 
//        google.charts.setOnLoadCallback(drawChart); 

//       function drawChart() { 

//        var data = google.visualization.arrayToDataTable([ 
//         ['Task', 'Hours per Day',], 
//            ['台式',     11], 
//           ['中式',     6], 
//           ['西式', 5], 
//           ['日式', 5],
//         ]); 

//      var options = { 
//       title: '店家下單種類分析' 
//        }; 

//     var chart = new google.visualization.PieChart(document.getElementById('piechart')); 

//        chart.draw(data, options); 
//       } 
  </script> 
  </head>
  <body>
  
    <div id="piechart" style="width: 900px; height: 500px;"></div>
    <c:forEach var="s" items="${statistics}" >
   <input class="type" id="${s. typeString}" type="text" value="${s. typeString}" hidden="">
   <input class="quantity" id=" ${s. quantity}" type="text" value=" ${s. quantity}" hidden="">
    </c:forEach>
</body>
<script type="text/javascript">

var type=document.getElementsByClassName('type');
var quantity=document.getElementsByClassName('quantity');
var list =['Task', 'Hours per Day'];
var result=[];
result.push(list);
for(let i=0;i<type.length;i++){
	let b=[type[i].value,parseInt(quantity[i].value)];
	result.push(b);
}
google.charts.load('current', {'packages':['corechart']}); 
google.charts.setOnLoadCallback(drawChart); 

function drawChart() { 


var data = google.visualization.arrayToDataTable(result); 

var options = { 
title: '餐廳類別統計	' 
}; 

var chart = new google.visualization.PieChart(document.getElementById('piechart')); 

chart.draw(data, options); 
} 

</script>