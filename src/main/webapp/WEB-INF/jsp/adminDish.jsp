<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>foodtiger</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/images/shortcut.ico">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	min-width: 1000px;
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #299be4;
	color: #fff;
	padding: 16px 30px;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn {
	color: #566787;
	float: right;
	font-size: 13px;
	background: #fff;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn:hover, .table-title .btn:focus {
	color: #566787;
	background: #f2f2f2;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 0px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.settings {
	color: #2196F3;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.text-success {
	color: #10c469;
}

.text-info {
	color: #62c9e8;
}

.text-warning {
	color: #FFC107;
}

.text-danger {
	color: #ff5b5b;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
</style>
<script>
	$(document).ready(function() {
		listAllDishes();
		listAllDishCategories();
		function listAllDishes() {
			var restId = $("#restId").val();
			$.ajax({
  	            url: "http://localhost:8080/my-app/dish?showMode=backend&restId=" + restId,
  	            type: "GET",
  	            dataType: "JSON",
  	            contentType : "application/json; charset=utf-8",
  	            success: function (data, status)
  	            {
  					console.log(data);
  					var tboby = $('#dishes tbody');
  					$(data).each(function () {                               
                            var tr = $('<tr></tr>')
                            tr.append('<td style="display:none;">' + this.dishId + '</td>')
//                             tr.append('<td style="display:none;">' + this.restId + '</td>')
                            tr.append('<td>' + this.restName + '</td>')
                            tr.append('<td>' + this.dishName + '</td>')
                            tr.append('<td>' + this.dishCategory + '</td>')
                            tr.append('<td>' + this.dishPrice + '</td>')
                            var imgsrc = "data:image/png;base64," + this.dishPhoto;
                            tr.append('<td>' + '<img width="50px" height="50px" id="ItemPreview" src=' + imgsrc + ' />' + '</td>')
                            tr.append('<td>' + this.dishStatus + '</td>')
                            tr.append('<td style="display:none;">' + this.dishCategoryId + '</td>')
                            tr.append('<td>' + '<a href="#" class="settings" title="Settings" data-bs-toggle="modal"><i class="material-icons">&#xE8B8;</i></a><a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>' + '</td>')
                            tboby.append(tr);
                    });     
  	            },
  	            error: function (xhr, desc, err)
  	            {
  	            	console.log(desc);
  	            	console.log(err);
  	            }
  	        });
		}
		
		function listAllDishCategories() {
			var restId = $("#restId").val();
			$.ajax({
  	            url: "http://localhost:8080/my-app/dish/category?restId=" + restId,
  	            type: "GET",
  	            dataType: "JSON",
  	            contentType : "application/json; charset=utf-8",
  	            success: function (data, status)
  	            {
  					console.log(data);
  					var select = $('#addProductModal #dishCategory,#editProductModal #dishCategory');
  					$(data).each(function () {
                        select.append('<option value=' + this.dishTypeId + '>' + this.dishTypeCategory + '</option>');
                    });     
  	            },
  	            error: function (xhr, desc, err)
  	            {
  	            	console.log(desc);
  	            	console.log(err);
  	            }
  	        });
		}
		
 		$('[data-toggle="tooltip"]').tooltip();
 		
 		//delete dish
 		$(document).on("click", ".delete", function() {
 			var is_delete = confirm("你確定要刪除此商品嗎?");
 			if (is_delete) {
 				var dishId = $(this).closest('tr').children('td:eq(0)').text();
 	 			$.ajax({
 	  	            url: "http://localhost:8080/my-app/dish/" + dishId,
 	  	            type: "DELETE",
 	  	            success: function (data, status)
 	  	            {
 	  	            	var yes = confirm("delete successfully!!!");
 	  					if (yes) {
 	  						location.reload();
 	  					}
 	  	            },
 	  	            error: function (xhr, desc, err)
 	  	            {
 	  	            	console.log(desc);
 	  	            	console.log(err);
 	  	            }
 	  	        });
 			}
		});
 		
 		function readURL(input){
 			if(input.files && input.files[0]){
 			    var reader = new FileReader();
 			    reader.onload = function (e) {
 			    	$(input).siblings("#preview_photo").attr('src', e.target.result);
 			    }
 			    reader.readAsDataURL(input.files[0]);
 			  }
 			}
 		$("#addProductModal #photo, #editProductModal #photo").change(function(){
 		      //當檔案改變後，做一些事 
 		     readURL(this);   // this代表<input id="photo">
 		   });
		
// 		$("a.settings").click(function() {
// 			var productId = $(this).closest('tr').children('td:eq(0)').text();
// 			var productName = $(this).closest('tr').children('td:eq(1)').text();
// 			var productPrice = $(this).closest('tr').children('td:eq(2)').text();
// 			$("#editProductModal input[name=product_id]").val(productId);
// 			$("#editProductModal input[name=name]").val(productName);
// 			$("#editProductModal input[name=price]").val(productPrice);
// 			$('#editProductModal').modal('show');
// 		});
		function getArrayBuffer(fileObj) {
			  return new Promise((resolve, reject) => {
			    const reader = new FileReader();
			    // Get ArrayBuffer when FileReader on load
			    reader.addEventListener("load", () => {
			      resolve(reader.result);
			    });

			    // Get Error when FileReader on error
			    reader.addEventListener("error", () => {
			      reject("error occurred in getArrayBuffer");
			    });

			    // read the blob object as ArrayBuffer
			    // if you nedd Base64, use reader.readAsDataURL
			    reader.readAsArrayBuffer(fileObj);
			  });
		}
		
		function convertFormToJSON(form) {
	        const array = $(form).serializeArray(); // Encodes the set of form elements as an array of names and values.
	        console.log(array);
	        const json = {};
	        $.each(array, function () {
	          json[this.name] = this.value || "";
	        });
	        return json;
	    }
		// add dish
		$("#add-dish-form").on("submit", function (e) {
	        e.preventDefault();
	        const form = $(e.target);
	        const json = convertFormToJSON(form);
	        const myFile = $("#add-dish-form #photo")[0].files[0];
	        fileArrayBuffer = getArrayBuffer(myFile).then(function(value) {
	        	json.dishPhoto = Array.from(new Uint8Array(value)); //add something
	  	        console.log(value);
	  	        console.log(json);
	  	        $.ajax({
	  	            url: "http://localhost:8080/my-app/dish",
	  	            type: "POST",
	  	            dataType: "JSON",
	  	            contentType : "application/json; charset=utf-8",
	  	            data: JSON.stringify(json),
	  	            success: function (data, status)
	  	            {
	  	            	var yes = confirm("insert successfully!!!");
	  					if (yes) {
	  						window.location.href = "http:\/\/localhost:8080\/my-app\/backend\/dish";
	  					}
	  	            },
	  	            error: function (xhr, desc, err)
	  	            {
	  	            	console.log(desc);
	  	            	console.log(err);
	  					alert("insert failed!!!");
	  	            }
	  	        });
	        	});
	        
	    });
		
// 		$('[data-toggle="tooltip"]').tooltip();
		
		//edit dish
		$(document).on("click", ".settings", function() {
//          $(".settings").click(function() {
             var dishId = $(this).closest('tr').children('td:eq(0)').text();
// 	 			var restId = $(this).closest('tr').children('td:eq(1)').text();
	 			var restName = $(this).closest('tr').children('td:eq(1)').text();
	 			var dishName = $(this).closest('tr').children('td:eq(2)').text();
	 			var dishCategory = $(this).closest('tr').children('td:eq(3)').text();
	 			var dishPrice = $(this).closest('tr').children('td:eq(4)').text();
	 			var dishPhoto = $(this).closest('tr').find("#ItemPreview").attr('src');
	 			var dishStatus = $(this).closest('tr').children('td:eq(6)').text();
	 			var dishCategoryId = $(this).closest('tr').children('td:eq(7)').text();
	 			console.log(dishPhoto);
	 			$("#editProductModal input[name=dishId]").val(dishId);
	 			$("#editProductModal input[name=restId]").val(restId);
	 			$("#editProductModal input[name=restName]").val(restName);
	 			$("#editProductModal input[name=dishName]").val(dishName);
	 			$("#editProductModal #dishCategory").val(dishCategoryId);
	 			$("#editProductModal input[name=dishPrice]").val(dishPrice);
	 			$("#dishStatus").val(dishStatus);
	 			$("#editProductModal #preview_photo").attr("src", dishPhoto);
	 			$('#editProductModal').modal('show');
		 });
	 			
			$("#edit-dish-form").on("submit", function (e) {
				e.preventDefault();
		        const form = $(e.target);
		        const json = convertFormToJSON(form);
		        const myFile = $("#edit-dish-form #photo")[0].files[0];
		        console.log(myFile);
		        if (myFile === undefined) {
		        	json.dishPhoto = $("#editProductModal #preview_photo").attr('src').split(",")[1];
		        	$.ajax({
		  	            url: "http://localhost:8080/my-app/dish/",
		  	            type: "PUT",
		  	            contentType : "application/json; charset=utf-8",
		  	            data: JSON.stringify(json),
		  	            success: function (data, status)
		  	            {
		  	            	var yes = confirm("updated  successfully!!!");
		  					if (yes) {
		  						window.location.href = "http:\/\/localhost:8080\/my-app\/backend\/dish";
		  					}
		  	            },
		  	            error: function (xhr, desc, err)
		  	            {
		  	            	console.log(desc);
		  	            	console.log(err);
		  					alert("updated  failed!!!");
		  	            }
			        });
		        } else {
		        	fileArrayBuffer = getArrayBuffer(myFile).then(function(value) {
			        	json.dishPhoto = Array.from(new Uint8Array(value)); //add something
					$.ajax({
			  	            url: "http://localhost:8080/my-app/dish/",
			  	            type: "PUT",
			  	            contentType : "application/json; charset=utf-8",
			  	            data: JSON.stringify(json),
			  	            success: function (data, status)
			  	            {
			  	            	var yes = confirm("updated  successfully!!!");
			  					if (yes) {
			  						window.location.href = "http:\/\/localhost:8080\/my-app\/backend\/dish";
			  					}
			  	            },
			  	            error: function (xhr, desc, err)
			  	            {
			  	            	console.log(desc);
			  	            	console.log(err);
			  					alert("updated  failed!!!");
			  	            }
				        });
				 });
		        }
		        
	    });
});	
	
</script>
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

<!-- jQuery 3.6.0 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- 自定義CSS -->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/css/shop.css"> --%>

</head>
<body>
	<jsp:include page="layout/navbar.jsp" />
	<%-- 	<jsp:include page="navbar.jsp" /> --%>
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-5">
							<h2>
								<b>${restaurantName}產品</b>
							</h2>
						</div>
						<div class="col-sm-7">
							<a href="#addProductModal" class="btn btn-success"
								data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>加入商品</span></a>
						</div>
					</div>
				</div>
				<table id="dishes" class="table table-striped table-hover">
					<thead>
						<tr>
							<th hidden="hidden">#</th>
							<th>店家名稱</th>
							<th>商品名稱</th>
							<th>商品種類</th>
							<th>商品價格</th>
							<th>商品圖片</th>
							<th>商品狀態</th>
							<th>商品設定</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- ADD Modal HTML -->
	<div id="addProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="add-dish-form" name="add-dish-form">
					<div class="modal-header">
						<h4 class="modal-title">新增</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>店家名稱</label> <input type="text" id="rest" name="rest"
								value="${restaurantName}" class="form-control" disabled>
							<input type="hidden" id="restId" name="restId"
								value="${restaurantId}" class="form-control">
						</div>
						<div class="form-group">
							<label>商品名稱</label> <input type="text" name="dishName"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>商品價格</label> <input type="text" name="dishPrice"
								class="form-control" required>
						</div>
						<div class="form-group">
							<span style="padding-left: 60px;"></span> <label>商品種類</label> <select
								id="dishCategory" name="dishCategory" required>
							</select> <span style="padding-left: 35px;"></span> <label>商品狀態</label> <select
								name="dishStatus" required>
								<option value="未上架">未上架</option>
								<option value="已上架">已上架</option>
							</select> <br> <br> <label>商品圖片</label> <input type="file"
								id="photo" name="photo"
								accept="image/gif, image/jpeg, image/png" required> <img
								width="150px" height="150px" id="preview_photo" src="#" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit"
							class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editProductModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="edit-dish-form" name="edit-dish-form">
					<div class="modal-header">
						<h4 class="modal-title">修改</h4>
						<button type="button" class="close" data-bs-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<!-- 				<div class="modal-body">	 -->
					<!-- 					<div class="form-group"> -->
					<!-- 						<input type="hidden" class="form-control" name="product_id" required> -->
					<!-- 					</div>				 -->
					<!-- 					<div class="form-group"> -->
					<!-- 						<label>商品名稱</label> -->
					<!-- 						<input type="text" class="form-control" name="name" required> -->
					<!-- 					</div> -->
					<!-- 					<div class="form-group"> -->
					<!-- 						<label>商品價格</label> -->
					<!-- 						<input type="text" class="form-control" name="price" required> -->
					<!-- 					</div> -->
					<!-- 					<div class="form-group"> -->
					<!-- 						<label>商品圖片</label> -->
					<!-- 						<input type="file" name="image" > -->
					<!-- 					</div>				 -->
					<!-- 				</div> -->
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" class="form-control" name="dishId" required>
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control" name="restId" required>
						</div>
						<div class="form-group">
							<label>店家名稱</label> <input type="text" id="rest" name="rest"
								value="${restaurantName}" class="form-control" disabled>
							<input type="hidden" id="restId" name="restId"
								value="${restaurantId}" class="form-control">
						</div>
						<div class="form-group">
							<label>商品名稱</label> <input type="text" name="dishName"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>商品價格</label> <input type="text" name="dishPrice"
								class="form-control" required>
						</div>
						<div class="form-group">
							<span style="padding-left: 60px;"></span> <label>商品種類</label> <select
								id="dishCategory" name="dishCategory" required>
							</select> <span style="padding-left: 35px;"></span> <label>商品狀態</label> <select
								id="dishStatus" name="dishStatus" required>
								<option value="未上架">未上架</option>
								<option value="已上架">已上架</option>
							</select> <br> <br> <label>商品圖片</label> <input type="file"
								id="photo" name="photo"
								accept="image/gif, image/jpeg, image/png"> <img
								width="150px" height="150px" id="preview_photo" src="#" />
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default"
							data-bs-dismiss="modal" value="Cancel"> <input
							type="submit" class="btn btn-info" value="Edit">
					</div>
				</form>
			</div>
		</div>
	</div>
	<%-- <jsp:include page="footer.jsp" /> --%>
</body>
</html>
