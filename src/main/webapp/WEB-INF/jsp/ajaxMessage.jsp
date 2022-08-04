<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
 <h1>Ajax + Restful 版本</h1>
 
 <br />
 
 <input type="text" id="myMessage">
 <button id="submitBtn">送出</button>

 <div>
   <table class="mytable" id="list_data_json">
     <thead>
       <tr>
          <th>訊息內容</th>
          <th>訊息時間</th>
       </tr>
     </thead>
   </table>


 </div>


</div>


<script>
   $(document).ready(function(){
     $('#submitBtn').click(function(){

        var inputText = document.getElementById('myMessage').value;
        var dtoObject = {"message" : inputText};
        var dtoJsonString = JSON.stringify(dtoObject);

       $.ajax({
         url:'http://localhost:8080/my-app/api/postMessage',
         contentType: 'application/json', // 送過去的資料型別
         dataType: 'json', // 回傳回來的資料型別
         method: 'post',
         data: dtoJsonString,
         success: function(result){
            console.log(result)
           $('#list_data_json tbody tr td').remove();
           msg_data = '<tbody>'
           $.each(result, function(index, value){
            msg_data += '<tr>'
            msg_data += '<td>' + value.text + '</td>'
            msg_data += '<td>' + value.added + '</td>'
            msg_data += '</tr>'
           })
           msg_data += '</tbody>'
           $('#list_data_json').append(msg_data)
         },
         error: function(err){
            console.log(err)
         }
       })


     })
   })



</script>


</body>
</html>