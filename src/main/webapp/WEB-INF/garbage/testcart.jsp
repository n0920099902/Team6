<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Hippo</title>
    <link rel="icon" href="./img/789.png" type="image/png">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/all.css">

</head>

<body>
    <header class="p-3 mb-3 border-bottom fixed-top">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="./index.html" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                    <img src="./img/789.png" alt="logo" width="50" height="50" class="me-2">
                    <h4>Order Hippo</h4>
                </a>

                <!-- 導覽列中間 -->
                <div class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"></div>

                <div class="d-flex align-items-center col-md-4 flex-row-reverse">
                    <div class="dropdown">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="./img/profile-user.png" alt="mdo" width="32" height="32">
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                            <li><a class="dropdown-item" href="./changeUserInfo.html">修改會員資料</a></li>
                            <li><a class="dropdown-item" href="./orderPage.html">訂單資訊</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><button class="dropdown-item" id="loginBnt">登出</button></li>
                        </ul>
                    </div>
                    <div class="me-4" id="bag" onclick="bagClick()">
                        <img src="./img/bag.png" alt="bag" width="32" height="32">
                    </div>
                    <div style="display:flex; margin: 0 1rem 0 1rem;" id="bell">
                        <div class="btn-group" role="group" id="bellBtn">
                            <button id="btnGroupDrop1" type="button" class="btn position-relative"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <image class="xiaoxi-icon " src="./img/bell.png" style="width: 32px; height: 32px">
                                </image>
                                <span id="bellValue"
                                    class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">0
                                    <span class="visually-hidden">unread messages</span></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1" id="bellInfo"
                                style="width: 30px;">
                                <!-- <li><a class="dropdown-item" href="#">Dropdown link</a></li> -->
                                <!-- <li><a class="dropdown-item" href="#">Dropdown link</a></li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <!-- <div class="tab position-sticky" style="top: 5rem;">
                        <span class="material-icons">
                            arrow_forward
                        </span>
                        <a href="#" class="link-dark" id="showUncon" style="text-decoration:none; background-color: red;">未確認訂單</a>
                        <br>
                        <br>
                        <span class="material-icons">
                            arrow_forward
                        </span>
                        <a href="#" class="link-dark" id="showCon" style="text-decoration:none;">已確認訂單</a>
                        <br>
                        <br>
                        <span class="material-icons">
                            arrow_forward
                        </span>
                        <a href="#" class="link-dark" id="showFinish" style="text-decoration:none;">完成訂單</a>
                        <br>
                        <br>
                        <span class="material-icons">
                            arrow_forward
                        </span>
                        <a href="#" class="link-dark" id="showCancel" style="text-decoration:none;">取消訂單</a>
                    </div> -->
                    <nav id="orderPageBtn">
                        <ul>
                            <li>
                                <a href="#" class="link-dark" id="showUncon" style="text-decoration:none;">未確認訂單</a>
                                <span></span><span></span><span></span><span></span>
                            </li>
                            <li>
                                <a href="#" class="link-dark" id="showCon" style="text-decoration:none;">已確認訂單</a>
                                <span></span><span></span><span></span><span></span>
                            </li>
                            <li>
                                <a href="#" class="link-dark" id="showFinish" style="text-decoration:none;">完成訂單</a>
                                <span></span><span></span><span></span><span></span>
                            </li>
                            <li>
                                <a href="#" class="link-dark" id="showCancel" style="text-decoration:none;">取消訂單</a>
                                <span></span><span></span><span></span><span></span>
                            </li>
                        </ul>
                    </nav>
                </div>

                <!-- 單成立資訊、歷史訂單(呈現?筆 左右控制) -->
                <div class="col-9 text-center">
                    <div style="background-color: rgb(100, 135, 119); color: aliceblue; color: white;">
                        <h1 class="">訂單詳情</h1>
                        <br>
                        <!-- 歷史訂單資訊 -->
                        <div class="row d-flex align-content-around flex-wrap text-center">
                            <div class="col-3">
                                <h5>日期</h5>
                            </div>
                            <div class="col-2">
                                <h5>內容</h5>
                            </div>
                            <div class="col-2">
                                <h5>總金額</h5>
                            </div>
                            <div class="col-2">
                                <h5>編號</h5>
                            </div>
                            <div class="col-3">
                                <h5>訂單狀態</h5>
                            </div>
                        </div>
                        <br>
                        <!-- <div id="orderCa" style=" background-color: rgb(95, 113, 97); color: aliceblue; color: white;"> -->
                        <div id="orderCa" style=" background-color: white; color: aliceblue; color: black;">
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="container" style="height: 30.6vh;"></div>
    </main>

    <hr>
    <!-- 底部資訊 -->
    <footer class="sticky-top text-white text-center text-lg-start bg-dark">
        <!-- Grid container -->
        <div class="container p-4">
            <!--Grid row-->
            <div class="row mt-4">
                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-4 mb-md-0">

                    <h5 class="text-uppercase mb-4">關於OrderHippo</h5>

                    <p>
                        OrderHippo是一間健康飲食餐廳的訂餐網站，
                        除了餐點的訂購服務外也包含三大營養素的標示及計算。
                    </p>

                    <p>
                        為了讓您更清楚，食材營養素是由政府提供的公開資料，
                        讓您在選購及消費的同時，可以更輕鬆及精準的去管理
                        自己的飲食狀況!
                    </p>

                    <div class="mt-4" style="display: flex; flex-direction: column; align-items: center;">
                        <p style="text-align: center;">Line菜單BOT</p>
                        <img src="./img/Line.png" width="200px" height="200px" alt="">
                    </div>

                </div>
                <!--Grid column-->
                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                    <h5 class="text-uppercase mb-4 pb-1">店家資訊</h5>

                    <ul class="fa-ul" style="list-style-type: none; padding-left: 0;">
                        <li class="mb-3">
                            <span class="fa-li"><span class="material-icons"
                                    style="font-size: 24px; color: aliceblue;">restaurant</span></span><span
                                class="ms-2">408台中市南屯區公益路二段51號18樓</span>
                        </li>
                        <li class="mb-3">
                            <span class="fa-li"><span class="material-icons" style="font-size: 24px; color: aliceblue;">
                                    email
                                </span></span><span class="ms-2">eeit42orderhippo@gmail.com</span>
                        </li>
                        <li class="mb-3">
                            <span class="fa-li"><span class="material-icons" style="font-size: 24px; color: aliceblue;">
                                    call
                                </span></span><span class="ms-2">04-1234-5678</span>
                        </li>
                    </ul>

                    <br><br><br>

                    <h5 class="text-uppercase mb-4">營業時間</h5>

                    <table class="table text-center text-white">
                        <tbody class="fw-normal">
                            <tr valign="middle">
                                <td>週一至週六</td>
                                <td>1100 - 1300 <br>
                                    1630 - 1930</td>
                            </tr>
                            <tr>
                                <td>週日</td>
                                <td style="color: red;">休息</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--Grid column-->
                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                    <div id="map" style="width: 430px; height: 450px;"></div>
                </div>
                <!--Grid column-->
            </div>
            <!--Grid row-->
        </div>
    </footer>
    <!-- End of .container -->

    <!-- 對話框 -->
    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content1">
            <div class="modal-header1">
                <span class="close circle">&times;</span>
            </div>
            <div class="modal-body1">
                <div class="row">
                    <div class="col-10">
                        <h1>沙讚沙嗲薑黃雞飯</h1>
                    </div>
                    <div class="col-2 d-flex flex-row-reverse">
                        <p>$140</p>
                    </div>
                </div>
                <p>碳水化合物:190g<br>蛋白質:90g<br>脂肪:245g</p>
            </div>
            <hr>
            <div class="modal-footer1 align-items-center">
                <div class="row">
                    <div class="col-5 row">
                        <div class="circle1" onclick="minusButton()">
                            –
                        </div>
                        <span class="spanType1" id="count">1</span>
                        <div class="circle1" onclick="plusButton()">
                            +
                        </div>
                    </div>
                    <div class="col-7 text-center cartButton">
                        <span class="spanType1"><img src="./img/shopping-cart.png" alt="" width="35" height="35">
                            加入購物車 $<span id="total"></span></span>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /對話框 -->

    <!-- 購物車 -->
    <div id="cart">
        <div id="cartIn" class="container">
            <br>
            <div class="text-center" style="background-color:#ccc;">
                <br>
                <img src="./img/789.png" alt="logo" width="50" height="50">
                <h4 class="text-white">Order Hippo</h4>
                <br>
            </div>
            <br>
            <div id="cartHeader">
                <ul>
                    <!-- <li>
                        <img src="./img/bibimbap/1.JPG"  alt="food" width="120" height="80">
                        <h5>雞肉飯便當</h5>
                        <p>碳水化合物:50g<br>蛋白質:20g<br>脂肪:150g<br>$120</p>
                    </li> -->
                </ul>
            </div>

            <hr>
            <div id="cartFooter">
                <p class="text-end">總計: $<span class="total1"></span></p>
                <button onclick="cartClear()" class="col-12 btn btn-secondary">清空購物車</button>
                <a href="./checkoutPage.html">
                    <button onclick="" class="col-12 btn btn-success">結帳 $<span class="total1"></span></button>
                </a>
            </div>
            <br>
        </div>
    </div>
    <!-- /購物車 -->


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHlkTZyjEZjTkA-sPv9IAQ60FCF-oAaXE&callback=initMap">
        </script>
    <script>
        let map;

        function initMap() {
            // let postName = 'localhost:8080';
            let postName = 'eeit42-order-hippo.herokuapp.com';
            fetch(`https://${postName}/api/storelocation`, {
                method: "GET"
            }).then(function (response) {
                return response.text();
            }).then(function (storeLocation) {
                var position = {
                    lat: Number(storeLocation.split(',')[0]),
                    lng: Number(storeLocation.split(',')[1])
                };
                map = new google.maps.Map(document.getElementById("map"), {
                    // 中心點位置
                    center: position,

                    zoom: 18, // 地圖縮放比例 (0-20)
                    maxZoom: 20, // 使用者能縮放地圖的最大比例 
                    minZoom: 3, // 使用者能縮放地圖的最小比例

                    streetViewControl: false, // 是否顯示右下角街景小人
                    mapTypeControl: false // 使用者能否切換地圖樣式：一般、衛星圖等
                });
                var marker = new google.maps.Marker({
                    position: position,
                    map: map
                });
            }).catch((err) => {
                console.log('取得店家經緯度錯誤');
            });
        }
    </script>
    <!--  -->
    <!-- <script type="module">
        import { initializeApp } from 'https://www.gstatic.com/firebasejs/9.8.2/firebase-app.js'
        // Add Firebase products that you want to use
        import { getAuth, signOut } from 'https://www.gstatic.com/firebasejs/9.8.2/firebase-auth.js'

        const firebaseConfig = {
            apiKey: "AIzaSyDmqTvgYkvxv42UFqnHl8ejXg627WUow1k",
            authDomain: "login-test-18ab1.firebaseapp.com",
            projectId: "login-test-18ab1",
            storageBucket: "login-test-18ab1.appspot.com",
            messagingSenderId: "521236544499",
            appId: "1:521236544499:web:be27cbcb82b1d84f09f086",
            measurementId: "G-4QG29VS5S8",
        };
        initializeApp(firebaseConfig);

    </script> -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="module" src="./js/orderPage.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>
</body>

</html>