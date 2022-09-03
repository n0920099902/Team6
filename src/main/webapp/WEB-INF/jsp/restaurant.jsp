<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.dialog {
	position: fixed;
	top: 40%;
	left: 20%;
	width: 70%;
	height: 50%;
	border: 1px solid #888888;
	background-color: #eeeeee;
	box-shadow: 0px 0px 10px;
	padding: 10px;
	transform: translate(-100px, 0px);
	display: none;
}

.dialog>.close {
	position: absolute;
	top: 0px;
	right: 5px;
	cursor: pointer; /*cursor游標pointer指針:改變鼠標*/
}
</style>
<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!-- web icon -->
<!-- <link rel="icon" -->
<%-- 	href="${contextRoot}/img/favicon.ico"> --%>

<jsp:include page="layout/navbar.jsp" />


<html>
<head>
<meta charset="UTF-8">
<title>Restuarant</title>


</head>
<body>
	<h1></h1>

	<div class="py-5 text-center container">
		<form action="${contextRoot}/restaurant/search" method="get">
			搜尋:<input type="text" name="keyword" placeholder="想要收搜尋的商品">
			<button>GO</button>
		</form>
	</div>
	<!-- 		<div class="py-5 text-center container"> -->
	<!-- 			金錢排序(由小到大)<input type="checkbox" id="cbox1" name="cbox1" value="ok" -->
	<!-- 				onclick="ch()"> <a href="" id="change"><button>套用</button></a> -->
	<!-- 		</div> -->
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<!-- 重複的結構 -->
				<c:forEach items="${allRestaurant }" var="restaurant">
					<div>
						<a class="s" href="restaurant/${restaurant.id}/menu"
							id="${restaurant.id}" style="color: black; text-decoration: none">
							<div class="col">
								<div class="card">
								<div style="width: 100%; height: 150px;">
									<img style="width: 100%; height: 100%"
										class="card-img-top img-thumbnail"src="${contextRoot}/restaurant/downloadImage/${restaurant.id}"
										class="card-img-top"></a>
							</div>			
										
									<div class="headline">
										<h5 >${restaurant.name }</h5>
									</div>
									<div>
										<span class="me-5">營業時間：<br />
											${restaurant.startDate}～${restaurant.endDate}<br />
											${restaurant.startTime}～${restaurant.endTime}
										</span>
										<input id="Adress${restaurant.id}" type="text" value="${restaurant.address }" hidden="">
										<%-- 										<a href="${pageContext.request.contextPath}/restaurant/${restaurant.id}/comment"><button type="button">評論</button></a> --%>

									</div>
								</div>
							</div>
						
						<button type="button" " id="${restaurant.id }" class="b">詳細資訊</button>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="dialog" id="dialog">
		<div class="close" onclick="hideDialog();" id="x"><img alt="" style="width: 20px ;height: 20px" src="${pageContext.request.contextPath}/images/x-symbol.svg"></div>
		<nav class="nav">
  <a id="map" class="nav-link active" aria-current="page"  onclick="showMap()">地圖</a>
  <a id="comment" class="nav-link disabled" onclick="showComment()">評論</a>
  
</nav>
<div id="showMap" style="display: none;">
<iframe id="f"
      width="50%" 
      height="80%" 
      frameborder="0" 
      style="border:0" 
      src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCS8vYMlbu2dItCFcm1HnffxaD_8i5aRAc&q=103台北市大同區民生西路55號(麥當勞-民生三店)&language=zh-Hant"
      allowfullscreen>
  </iframe>

</div>
		<table class="table table-striped" id="tableComment" style="display: table;">
					<thead>
						<tr>
							<th scope="col">帳號</th>
							<th scope="col">評論內容</th>
							<th scope="col">評分</th>
							<th scope="col">評論時間</th>
						</tr>
					</thead>
					<tbody id="commentBody">
					<tr><td>暫無評論</td><td></td><td></td><td></td></tr>
					</tbody>
		</table>
					
	</div>
	<jsp:include page="layout/footer.jsp" />
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

	var dialog, x,c,sId;
	
	window.onload = function() {
		dialog = document.getElementById("dialog");
		x = document.getElementById("x");
	}
	
	var list = JSON.parse(sessionStorage.getItem('buy'));
	var s = document.getElementsByClassName('s');
	for (let i = 0; i < s.length; i++) {
		s[i].addEventListener("click", getR);
	}
	var b = document.getElementsByClassName('b');
	for (let i = 0; i < b.length; i++) {
		b[i].addEventListener("click", showDialog);
	}

	function getR(event) {
		var aId = this.id;
		if (list == null) {//購物車為空 拿到餐廳ID 存成session
			sessionStorage.setItem('point', JSON.stringify(aId));
		}
	}
	
	function showMap(){
		document.getElementById('tableComment').style.display = "none";
		document.getElementById('comment').className='nav-link active';
		document.getElementById('map').className='nav-link disabled';
		addMap(sId);
		
	}
	
	function showComment(){
		AddComment(sId);
		document.getElementById('tableComment').style.display = "";
		document.getElementById('map').className='nav-link active';
		document.getElementById('comment').className='nav-link disabled';
		document.getElementById('showMap').style.display ="none";
	}
	
	var mapstr='https://www.google.com/maps/embed/v1/place?key=AIzaSyCS8vYMlbu2dItCFcm1HnffxaD_8i5aRAc&q=';
	var len='&language=zh-Hant';
	
	
	function addMap(sId){
		document.getElementById('showMap').style.display ="";
		let rAdress=document.getElementById('Adress'+sId).value;
		document.getElementById('f').src=mapstr+rAdress+len;
	}
	
	function AddComment(sId){
		var cStr='';
		$.ajax({
            url: "http://localhost:8080/FeastEat/comment?restId=" + sId,
            type: "GET",
            dataType: "JSON",
            contentType : "application/json; charset=utf-8",
            success: function (data, status)
            {
          	  console.log(data);
                $(data).each(function (index, element) {

                  var star = '';
                  for(let i=0;i<element.score;i++){
                  	star+='<img alt="" style="width: 30px ;height: 30px" src="${pageContext.request.contextPath}/StarPhoto/star.svg">';
                  }
                  var cmt = '<tr>'+                
                                  '<td>' + element.accountName + '</td>'+
                                  '<td>' + element.comments + '</td>'+
                                  '<td>' + star+ '</td>'+
                                  '<td>' + element.time + '</td>'+
                            '</tr>';
                      cStr+=cmt;
                                   
                });
                document.getElementById('commentBody').innerHTML=cStr; 
                if(cStr==""){
                	 document.getElementById('commentBody').innerHTML='<tr><td>暫無評論</td><td></td><td></td><td></td></tr>';
                }
            },
            error: function (xhr, desc, err)
            {
                console.log(desc);
                console.log(err);
            }
        }); return cStr;   
	}
	
	function showDialog(event) {
		sId = this.id;
		dialog.style.display = "block";
		document.getElementById('showMap').style.display ="none";
		showComment();
	}
	
	function hideDialog() {
		dialog.style.display = "none";
		document.getElementById('commentBody').innerHTML="<tr><td>暫無評論</td><td></td><td></td><td></td></tr>";
	}
	
</script>
</html>