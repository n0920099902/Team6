<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- Designined by CodingLab | www.youtube.com/codinglabyt -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    
    <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <!--<title> Responsiive Admin Dashboard | CodingLab </title>-->
    <link rel="stylesheet" href="style.css">
    
<!--     儀錶板功能\ -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link href="${contextRoot}/css/GM.css" rel="stylesheet" />
   <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 
   </head>
<body>

<!------ Include the above in your HEAD tag ---------->

<div id="wrapper" class="active">  




  <div class="sidebar">
   <a href="${contextRoot}/Users/select" style="text-decoration:none">
   <div class="logo-details">
      <i class='bx bxl-c-plus-plus'></i>
      <span class="logo_name">後台系統</span>
    </div></a>
      <ul class="nav-links">
              <li>
          <a href="${contextRoot}/Users/select">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">後台會員管理</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/Users/register" >
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">新增店家帳號</span>
          </a>
        </li>
        <li>
          <a href="${contextRoot}/restaurant/viewRestaurants">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">餐廳總覽(後台)</span>
          </a>
        </li>
        <li>
<!--           <a href="#"> -->
<!--             <i class='bx bx-coin-stack' ></i> -->
<!--             <span class="links_name"></span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li> -->
<!--           <a href="#"> -->
<!--             <i class='bx bx-book-alt' ></i> -->
<!--             <span class="links_name"></span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li> -->
<!--           <a href="#"> -->
<!--             <i class='bx bx-user' ></i> -->
<!--             <span class="links_name"></span> -->
<!--           </a> -->
<!--         </li> -->
    <li class="log_out">
          <a href="${contextRoot}/">
            <i class='bx bx-log-out'></i>
            <span class="links_name">返回主頁</span>
          </a>
        </li>
      </ul>
<!--         <li> -->
<!--           <a href="#"> -->
<!--             <i class='bx bx-message' ></i> -->
<!--             <span class="links_name"></span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li> -->
<!--           <a href="#"> -->
<!--             <i class='bx bx-heart' ></i> -->
<!--             <span class="links_name"></span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li> -->
<!--           <a href="#"> -->
<!--             <i class='bx bx-cog' ></i> -->
<!--             <span class="links_name"></span> -->
<!--           </a> -->
<!--         </li> -->
    
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
      </div>
    </nav>

    
  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
}
 </script>

</body>
</html>