<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextRoot}/css/main.css" />
</head>
<body>
<noscript>
        <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>

    <!-- 進入頁面 -->
    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">輸入名稱</h1>
            
            <form id="usernameForm" name="usernameForm">
                <div class="form-group popup">
                    <input type="text" id="name" placeholder="輸入名稱..."
                        autocomplete="off" class="form-control popup" />
                    <span class="popuptext" id="hint">請輸入名稱</span>
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">開始</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 聊天室頁面 -->
    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>線上客服</h2>
            </div>
            <div class="connecting">Connecting...</div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="輸入訊息..."
                            autocomplete="off" class="form-control" />
                        <button type="submit" class="primary">送出</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

</body>
<script type="text/javascript">
'use strict';

var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');
var nameInput = document.querySelector('#name');
var popup = document.querySelector('#hint');
var contextRoot = "http://localhost:8080/FeastEat";
var stompClient = null;
var username = null;

/**
 * 頭像的顏色
 */
var colors = [ '#2196F3', '#32c787', '#00bcd4','#4dbb00', '#ff5652', '#ffc107',
        '#ff85af', '#ff9800', '#39bbb0', '#b0c503' ];

/**
 * 連線
 * @param event
 * @returns
 */
function connect(event) {
    username = document.querySelector('#name').value.trim();

    if (username) {
        usernamePage.classList.add('hidden');
        chatPage.classList.remove('hidden');

        var socket = new SockJS(contextRoot + '/chatroom');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    } else {
        popHint();
    }
    event.preventDefault();
}

/**
 * 連線建立後要處理的邏輯
 * @returns
 */
function onConnected() {
    // 訂閱/topic/public
    stompClient.subscribe('/topic/public', onMessageReceived); // 當後端送訊息至/topic/public時，會執行onMessageReceived()。

    // 發送訊息至/app/join，也就是送到ChatController.addUser()
    stompClient.send("/app/join", {}, JSON.stringify({
        sender : username,
        type : 'JOIN'
    }))

    connectingElement.classList.add('hidden');
}

function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}

/**
 * 彈出提示
 * @returns
 */
function popHint() {
    popup.classList.toggle("show");
}

/**
 * 發送訊息
 * @param event 發送訊息事件
 * @returns
 */
function sendMessage(event) {
    var messageContent = messageInput.value.trim();
    if (messageContent && stompClient) {
        var chatMessage = {
            sender : username,
            content : messageInput.value,
            type : 'CHAT'
        };
        // 發送訊息至/app/chat，也就是送到ChatController.sendMessage()
        stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}

/**
 * 從後端接受訊息後要進行的處理
 * @param payload 後端送來的訊息
 * @returns
 */
function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);

    var messageElement = document.createElement('li');

    if (message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' 加入聊天室';
    } else if (message.type === 'LEAVE') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' 離開聊天室';
    } else {
        messageElement.classList.add('chat-message');

        var avatarElement = getAvatarElement(message.sender);
        messageElement.appendChild(avatarElement);

        var usernameElement = getUsernameElement(message.sender);
        messageElement.appendChild(usernameElement);
    }

    var textElement = document.createElement('p');
    var messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);

    messageElement.appendChild(textElement);

    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
}

/**
 * 取得頭像元素
 * @param sender 訊息發送者名稱
 * @returns
 */
function getAvatarElement(sender) {
    var avatarElement = document.createElement('i');
    var avatarText = document.createTextNode(sender[0]);
    avatarElement.appendChild(avatarText);
    avatarElement.style['background-color'] = getAvatarColor(sender);
    return avatarElement;
}

/**
 * 取得頭像顏色
 * @param sender 訊息發送者名稱
 * @returns
 */
function getAvatarColor(sender) {
    var hash = 0;
    for (var i = 0; i < sender.length; i++) {
        hash = 31 * hash + sender.charCodeAt(i);
    }
    var index = Math.abs(hash % colors.length);
    return colors[index];
}

/**
 * 取得使用者名稱的元素
 * @param sender 使用者名稱
 * @returns
 */
function getUsernameElement(sender) {
    var usernameElement = document.createElement('span');
    var usernameText = document.createTextNode(sender);
    usernameElement.appendChild(usernameText);
    return usernameElement;
}

/**
 * 移除彈出的提示
 * @param event
 * @returns
 */
function removePopup (event) {
    popup.classList.remove("show");
}

nameInput.addEventListener('focus', removePopup, true)
usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', sendMessage, true)


</script>
</html>