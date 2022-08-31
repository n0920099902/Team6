package com.ispan.team6.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
   
    @Override
    public void registerStompEndpoints(StompEndpointRegistry endpointRegistry) {
        // 註冊一個給Client連至WebSocket Server的節點(websocket endpoint)
        endpointRegistry.addEndpoint("/chatroom").withSockJS(); 
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry brokerRegister) {
        
        // 啟用一個訊息代理並設定訊息發送目地的前綴路徑
        brokerRegister.enableSimpleBroker("/topic");
        
        // 設定導向至訊息處理器的前綴路徑
        brokerRegister.setApplicationDestinationPrefixes("/app");
    }

}
