<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<jsp:include page="layout/navbar.jsp" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>修改訂單</title>
</head>
<body>
<a href="" id="keepBuy"><button>繼續購買</button></a> 

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				
				<form action="${pageContext.request.contextPath}/confirmBuy"
					method="POST">
					<div id="show"></div>
					<div>
					
						<!-- 		餐廳ID -->
						<input type="number" name="rID" value="" id="rID" hidden="">
					</div>
					<div>
					
						<!-- 		UserID -->
						<input type="number" name="UID" value="${member.id }"  hidden="">
					</div>
					<div>
						地址:<input type="text" name="address" required="required">
					</div>
					<div>
						<!-- 		餐廳status -->
						<input type="text" name="orderStatus" value="準備中" hidden="">
					</div>
					<div>
<!-- 訂單時間 -->
						<input type="text" name="time" id="time" value="" >
					</div>
				
					<div>
						訂購電話<input type="text" id="phone" name="phone" onblur="ckPhone()"
							onfocus="defaultPhoneOut()" onblur="ckPhone()"
							onfocus="defaultPhoneOut()" required><span
							style="color: red" id="phoneout"></span>
					</div>

					<!-- <div>
						<input type="number">
					</div> -->



					<button id = "confirmBuy" onclick="getTime()">確認購買</button>

				</form>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">

    var rid  = JSON.parse(sessionStorage.getItem('rID'));
    document.getElementById("rID").value=rid;
    
    document.getElementById("keepBuy").href = '${pageContext.request.contextPath}/restaurant/' + rid + '/menu';
    console.log(sessionStorage);
	var list = JSON.parse(sessionStorage.getItem('buy'));
	console.log(list);
	
	
	for (let i = 0; i < list.length; i++) {
		var dish = list[i];
		document.getElementById("show").innerHTML += '<div class="col"><div class="card"><img style="height: 200px" src="'+dish.photo+'" class="card-img-top">';

		document.getElementById("show").innerHTML += '<div class="headline">餐點名稱: '
				+ dish.name
				+ '</div><div class="card-footer text-end">'
				+ '<div>價格:' + dish.price + '</div>';

// 		document.getElementById("show").innerHTML += '<div><input id="n'
// 				+ dish.id + '" type="text" name="name" min="0"'
// 				+ 'style="width: 20%; margin-right: 40%" value="' + dish.name
// 				+ '"required hidden="">';
		
				//id
		document.getElementById("show").innerHTML += '<input id="id'+dish.id+'" style="width: 100px" type="number" name="id" value="'+dish.id+'" min="1"required="required"	 "required hidden="">';

		document.getElementById("show").innerHTML += '<br>數量:<input type="button" value="-" class="minBut" id="m_'+dish.id+'">';
// 		document.getElementById("show").innerHTML += '<input id="id'+dish.id+'" style="width: 100px" type="number" name="id" value="'+dish.id+'" min="1"required="required"	 "required hidden="">';

		document.getElementById("show").innerHTML += '<input id="quantity'+dish.id+'" style="width: 70px" type="number" name="quantity"  readonly="readonly" value="'+dish.quantity+'" min="1"	required="required">';
		
		document.getElementById("show").innerHTML += '<input id="price'+dish.id+'" style="width: 100px" type="number" name="price" value="'+dish.price+'" min="1"	required="required" "required hidden="">';

		document.getElementById("show").innerHTML += '<input type="button" value="+" class="addBut" id="a_'+dish.id+'">';

// 		document.getElementById("show").innerHTML += '<button class="addBut" id="a_'+dish.id+'">+</button>';
		
		document.getElementById("show").innerHTML += '總價: <span id="totalprice'+dish.id+'">'
				+ dish.quantity * dish.price + '</span>';
				
		document.getElementById("show").innerHTML += '<input type="button" value="刪除此商品" class="deleteBut" style="background-color: red ; border: red"  id="d_'+dish.id+'">';


		document.getElementById("show").innerHTML += '</div></div></div></div>';
		
		

	}
	var mbuttons = document.getElementsByClassName('minBut');
	for (var i=0;i<mbuttons.length;i++) {
		mbuttons[i].addEventListener("click", min);
	}
	
	var abuttons = document.getElementsByClassName('addBut');
	for (var i=0;i<abuttons.length;i++) {
		abuttons[i].addEventListener("click", add);
	}
	
	var dbuttons = document.getElementsByClassName('deleteBut');
	for (var i=0;i<dbuttons.length;i++) {
		dbuttons[i].addEventListener("click", del);
	}
	
	function del(event){
		var buttonId = event.target.id;	
		var rowId = buttonId.split("_")[1];
		
		for(let i=0;i<list.length;i++){
			if(list[i].id==rowId){
				list.splice(i,1);
			}
		}
		sessionStorage.setItem('buy', JSON.stringify(list));
		window.location.reload();
	}
	
	
	function min(event) {
		var buttonId = event.target.id;	
		var rowId = buttonId.split("_")[1];
		
		
		
		let v=+(document.getElementById('quantity' + rowId).value);
		let p=+(document.getElementById('price' + rowId).value);
		if(v>1){
			v-=1;
		document.getElementById('quantity' + rowId).value=v;
		for(let i=0;i<list.length;i++){
			if(list[i].id==rowId){
				list[i].quantity-=1;
			}
		}
		sessionStorage.setItem('buy', JSON.stringify(list));
		}
		document.getElementById('totalprice' + rowId).innerHTML=v*p;
		
		
		
	}
	function add(event) {
		var buttonId = event.target.id;	
		var rowId = buttonId.split("_")[1];
		let v=+(document.getElementById('quantity' + rowId).value);
		v+=1;
		let p=+(document.getElementById('price' + rowId).value);
		document.getElementById('quantity' + rowId).value=v;
		document.getElementById('totalprice' + rowId).innerHTML=v*p;
		for(let i=0;i<list.length;i++){
			if(list[i].id==rowId){
				list[i].quantity+=1;
			}
		}
		sessionStorage.setItem('buy', JSON.stringify(list));
	}
	function getTime() {
		
		// if(document.getElementById("UID").value=""){
		// 	alert('請登入');
		// 	window.location.reload();      
		// }
		
		var date = new Date();

		const formatDate = (current_datetime)=>{
		    let formatted_date = current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + "-" + current_datetime.getDate() + " " + current_datetime.getHours() + ":" + current_datetime.getMinutes() + ":" + current_datetime.getSeconds();
		    return formatted_date;
		}

		document.getElementById("time").value = formatDate(date);

	}
	function defaultPhoneOut() {
		document.getElementById("phoneout").innerHTML = "";
	}
	function ckPhone() {
		let phone = document.getElementById("phone").value;
		if (phone != "" && phone.search(/^09\d{8}$/) == -1) {
			document.getElementById("phoneout").innerHTML = "輸入格式錯誤";
		}
	}
	
</script>