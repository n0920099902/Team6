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
<a href="" id="keepBuy"><button class="btn btn-secondary btn-lg">返回餐廳繼續購買</button></a> 

<!-- 	<div class="album py-5 bg-light"> -->
		<div class="container">
			
				
				<form action="${pageContext.request.contextPath}/confirmBuy"
					method="POST">
<!-- 					<div class="container"> -->
<!-- 					<div class="row row-cols-1 row-cols-md-2 g-4"> -->
					<div id="show" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					</div>
					<div>
						<!-- 		餐廳ID -->
						<input type="number" name="rID" value="" id="rID" hidden="">
					</div>
					<div>
					
						<!-- 		UserID -->
						<input type="number" name="UID" value="${member.id }"  hidden="">
					</div>
					
					<div class="input-group mb-3">
					        <span class="input-group-text" id="basic-addon1">地址:</span>
						    <input type="text" class="form-control" name="address" required="required" id="address" placeholder="郵遞區號/市縣/鄉鎮/路街/巷/弄/門牌號碼" aria-label="Username" aria-describedby="basic-addon1">
					</div>
                   
					<div>
						<!-- 		餐廳status -->
						<input type="text" name="orderStatus" value="準備中" hidden="">
					</div>
					<div>
<!-- 訂單時間 -->
						<input type="text" name="time" id="time" value="" hidden="" >
					</div>
				
					<div class="input-group mb-3">
					          <span class="input-group-text" id="basic-addon1">訂購電話</span>
						<input type="text" id="phone" name="phone" onblur="ckPhone()"
							onfocus="defaultPhoneOut()" onblur="ckPhone()"
							onfocus="defaultPhoneOut()" required class="form-control" placeholder="範例:09XX-XXX-XXX" aria-label="Username" aria-describedby="basic-addon1">
							<span style="color: red" id="phoneout"></span>
					</div>
					<button id = "confirmBuy" class="btn btn-success" onclick="getTime()" >前往付款</button>
				
<!-- 				</div> -->
<!-- 				</div> -->
				
				</form>
				
			
		</div>
<!-- 	</div> -->
</body>
</html>
<!-- style="height: 200px;width: 200px; " -->
<script type="text/javascript">

    var rid  = JSON.parse(sessionStorage.getItem('rID'));
    document.getElementById("rID").value=rid;
    
    document.getElementById("keepBuy").href = '${pageContext.request.contextPath}/restaurant/' + rid + '/menu';
    console.log(sessionStorage);
	var list = JSON.parse(sessionStorage.getItem('buy'));
	console.log(list);
	
	var temp = '';
	for (let i = 0; i < list.length; i++) {
		var dish = list[i];
		temp += '<div  class="col"><div class="card"><img src="'+dish.photo+'" class="card-img-top "> <div class="card-body">'
				+ ' <h5 class="card-title ">餐點名稱: '+ dish.name
				+ '</h5><p class="card-text">特惠商店</p><div class="headline">'
		
				+ '</div><div class="card-footer text-end">'
				+ '<div>價格:' + dish.price ;
		
		temp += '<input id="id'+dish.id+'" style="width: 100px" type="number" name="id" value="'+dish.id+'" min="1"required="required"	 "required hidden="">';

		temp += '<br>數量:<input type="button" value="-" class="minBut btn btn-primary btn-sm" id="m_'+dish.id+'">';

		temp += '<input id="quantity'+dish.id+'" style="width: 70px" type="number" name="quantity"  readonly="readonly" value="'+dish.quantity+'" min="1"	required="required">';
		
		temp += '<input id="price'+dish.id+'" style="width: 100px" type="number" name="price" value="'+dish.price+'" min="1"	required="required" "required hidden="">';

		temp += '<input type="button" value="+" class="addBut btn btn-danger btn-sm" id="a_'+dish.id+'">';

		temp += '總價: <span id="totalprice'+dish.id+'">'
				+ dish.quantity * dish.price + '</span>';
				
		temp += '<input type="button" value="刪除此商品" class="deleteBut btn btn-danger" style="background-color: red ; border: red"  id="d_'+dish.id+'">';

		temp += '</div></div></div></div></div>';

	}
	$('#show').html(temp);
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
		v=parseInt(v)+1;
		let p=+(document.getElementById('price' + rowId).value);
		document.getElementById('quantity' + rowId).value=v;
		document.getElementById('totalprice' + rowId).innerHTML=v*p;
		for(let i=0;i<list.length;i++){
			if(list[i].id==rowId){
				list[i].quantity=parseInt(list[i].quantity)+1;
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
			let y=current_datetime.getFullYear();
			let m=+(current_datetime.getMonth()) + 1;
			let d=current_datetime.getDate();
			let h=current_datetime.getHours();
			let min= current_datetime.getMinutes();
			let s=current_datetime.getSeconds();
			if(y<10){y="0"+y};
			if(m<10){m="0"+m};
			if(d<10){d="0"+d};
			if(h<10){h="0"+h};
			if(min<10){min="0"+min};
			if(s<10){s="0"+s};
			
// 		    let formatted_date = current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + "-" + current_datetime.getDate() + " " + current_datetime.getHours() + ":" + current_datetime.getMinutes() + ":" + current_datetime.getSeconds();
		    let formatted_date=y+'/'+m+'/'+d+' '+h+':'+min+':'+s;
		    return formatted_date;
		}

		document.getElementById("time").value = formatDate(date);
		let phone=document.getElementById("phone").value;
		let address=document.getElementById("address").value;
		if(address!="" && phone!=""){
			sessionStorage.setItem('buy', null);
			
		}

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