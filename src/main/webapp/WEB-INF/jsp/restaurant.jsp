<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
  #map {
        height: 90%;
        width: 100%;
       }
  .my-custom-scrollbar {
position: relative;
height: 300px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
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
.dialog1 {
	position: fixed;
	top: 10%;
	left: 68%;
	width: 20%;
	height: 40%;
	border: 1px solid #888888;
	background-color: #eeeeee;
	box-shadow: 0px 0px 10px;
	padding: 10px;
	transform: translate(-100px, 0px);
	display: none;
}

.dialog1>.close {
	position: absolute;
	top: 0px;
	right: 5px;
	cursor: pointer; /*cursor游標pointer指針:改變鼠標*/
}
</style>
<!DOCTYPE html>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- bootstrap 5.1.3 CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
    crossorigin="anonymous">

<!-- bootstrap 5.1.3 JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    
<jsp:include page="layout/navbar.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>Restuarant</title>
</head>
<body>

<!-- 背景圖片 -->
<%-- <body style="background:url(${pageContext.request.contextPath}/img/背景圖2.jpg) no-repeat;"> --%>
<body style="background:url(${pageContext.request.contextPath}/img/abstract-textured-white-background.jpg) ;background-size:cover; "> 

      		 <!--- 輪播圖片 --->
        <section class="py-5 text-center container">
            <div id="carouselExampleIndicators" class="carousel slide"
                data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0" class="active" aria-current="true"
                        aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="3" aria-label="Slide 4"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/img/輪播2.jpg"
                            class="d-block w-100"   width="500"  height="400"> 
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/img/輪播5.jpg"
                            class="d-block w-100 " width="500"  height="400">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/img/2222.jpg"
                            class="d-block w-100 " width="500"  height="400">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/img/輪播4.jpg"
                            class="d-block w-100 " width="500"  height="400">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        
	<div class="py-5 text-center container">
	<span >現在地址:<span id="location" style="color: blue;" onclick="showDialog1()"></span></span>
		<form action="${contextRoot}/restaurant/search" method="get">
			搜尋:<input type="text" name="keyword" placeholder="想要吃的類型或商店">
			<button>GO</button>
		</form>
		<input  type="submit"" value="以距離排序" onclick="sub()">
	</div>
	<form id="sortForm" action="${contextRoot}/restaurant/SortByDistance" method="get">
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
                                        src="${contextRoot}/restaurant/downloadImage/${restaurant.id}"
                                        class="card-img-top img-thumbnail">
                                </div>
						</a>
									<div class="headline">
										<h5 >${restaurant.name }<span class="distance" style="float: right" id='showKm${restaurant.id}'></span></h5>
									</div>
									<div>
										<span class="me-5">營業時間：<br />
											${restaurant.startDate}～${restaurant.endDate}<br />
											${restaurant.startTime}～${restaurant.endTime}
										</span>
										&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&thinsp;
										<input type="button"  id="${restaurant.id }" class="b" value="詳細資訊">
										<input  id="Adress${restaurant.id}" type="text" value="${restaurant.address }" hidden="">
										<input id="remark${restaurant.id}" type="text" value="${restaurant.remark }" hidden="">
										<%--<a href="${pageContext.request.contextPath}/restaurant/${restaurant.id}/comment"><button type="button">評論</button></a> --%>

									</div>
								</div>
							</div>
						<input name="restId"  type="number" value="${restaurant.id }" hidden="">
						<input id="Distance${restaurant.id}" name="restDistance"  type="number" value="" hidden="">
					</div>
				</c:forEach>
			</form>
			</div>
		</div>
	</div>
	<div class="dialog" id="dialog">
		<div class="close" onclick="hideDialog();" id="x">&emsp;<img alt="" style="width: 20px ;height: 20px" src="${pageContext.request.contextPath}/images/x-symbol.svg"></div>
		<nav class="nav">
  <a id="Rmap" class="nav-link active" aria-current="page"  onclick="showMap()">地圖</a>
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
<div id="remark" style="float: right ;width: 40% "></div>
</div>
    <div class="table-wrapper-scroll-y my-custom-scrollbar">
		 <table class="table table-bordered table-striped mb-0" id="tableComment"> 
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
</div>
<div class="dialog1" id="dialog1" style="display: none;">
<div class="close" onclick="hideDialog1();" id="x">&emsp;<img alt="" style="width: 20px ;height: 20px" src="${pageContext.request.contextPath}/images/x-symbol.svg"></div>
<br><div  id="map" ></div>
</div>
</body>
	<jsp:include page="layout/footer.jsp" />
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
 function sub(){
	    document.getElementById("sortForm").submit();
 }

    var distanceClass = document.getElementsByClassName('distance');
	var dialog, x,c,sId,dialog1, x1;
	
	window.onload = function() {
		dialog = document.getElementById("dialog");
		x = document.getElementById("x");
		dialog1 = document.getElementById("dialog1");
		x1 = document.getElementById("x1");
		for (let i = 0; i < distanceClass.length; i++) {
		 	let dID=distanceClass[i].id;
		 	let num=dID.split('showKm')[1];
		 	let address=document.getElementById("Adress"+num).value;
		 	GetNowAddress();
		 	Distance(address,num);
		}
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
		document.getElementById('Rmap').className='nav-link disabled';
		addMap(sId);
		
	}
	
	function showComment(){
		AddComment(sId);
		document.getElementById('tableComment').style.display = "";
		document.getElementById('Rmap').className='nav-link active';
		document.getElementById('comment').className='nav-link disabled';
		document.getElementById('showMap').style.display ="none";
	}
	
	var mapstr='https://www.google.com/maps/embed/v1/place?key=AIzaSyCS8vYMlbu2dItCFcm1HnffxaD_8i5aRAc&q=';
	var len='&language=zh-Hant';
	
	
	function addMap(sId){
		document.getElementById('showMap').style.display ="";
		let rAdress=document.getElementById('Adress'+sId).value;
		document.getElementById('f').src=mapstr+rAdress+len;
		let rRemak=document.getElementById('remark'+sId).value;
		document.getElementById('remark').innerHTML=" 餐廳描述:<br>"+rRemak;
		
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
	
	function showDialog1(event) {
		dialog1.style.display = "block";
	}
	
	function hideDialog1() {
		dialog1.style.display = "none";
	}
	
	var map, marker, lat, lng;
	function initMap() {
	    navigator.geolocation.watchPosition((position) => {
	        console.log(position.coords);
	        lat = position.coords.latitude;
	        lng = position.coords.longitude;
// 	        初始化地圖
	        map = new google.maps.Map(document.getElementById('map'), {
	            zoom: 18,
	            center: { lat: lat, lng: lng }
	        });
	        marker = new google.maps.Marker({
	            position: { lat: lat, lng: lng },
	            map: map
	        });
	    });
	}
  
	//算距離
	var end;
	var dis='請輸入正確地址';
	function Distance(end,num) {
	    var request = {
	        origin: { lat: lat, lng: lng },//現在位置
	        destination: end,
	        travelMode: google.maps.DirectionsTravelMode.DRIVING
	    };
	    //宣告
	    var directionsService = new google.maps.DirectionsService();
	    directionsService.route(request, function (response, status) {
	        var strTmp = "";
	        if (status == google.maps.DirectionsStatus.OK) {
	            var route = response.routes[0];
	            for (var i = 0; i < route.legs.length; i++) {
	                var routeSegment = i + 1;
	                strTmp += route.legs[i].distance.text;
	            }
	            //取得距離(正整數，公尺)
	            var dist = parseInt(parseFloat(strTmp) * 1000).toString();
	            var distDivThousand=dist;
	            
	            if(dist<1000){
	            	distDivThousand=dist+'公尺';
	            }
	            else{
	            	distDivThousand=dist/1000+'公里';
	            }

	        }
	        document.getElementById('showKm'+num).innerHTML=distDivThousand;
	        document.getElementById('Distance'+num).value=dist;
	    });
	}

	
	function GetNowAddress(){

		var geocoder = new google.maps.Geocoder();

		//google.maps.LatLng 物件
		var coord = new google.maps.LatLng(lat, lng);

		//傳入 latLng 資訊至 geocoder.geocode
		geocoder.geocode({'latLng': coord }, function(results, status) {
			  if (status === google.maps.GeocoderStatus.OK) {
				    // 如果有資料就會回傳
				    if (results) {
				      console.log(results[0].formatted_address);
				      
				    }
				  }
				  // 經緯度資訊錯誤
				  else {
// 				    alert("Reverse Geocoding failed because: " + status);
				  }
			  document.getElementById('location').innerHTML=results[0].formatted_address;
				});
				
		}
	
</script>
<!--  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&language=zh-TW"></script> -->
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCS8vYMlbu2dItCFcm1HnffxaD_8i5aRAc&callback=initMap">
    </script>
</html>