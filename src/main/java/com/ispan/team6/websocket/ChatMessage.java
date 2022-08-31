package com.ispan.team6.websocket;

/**
 * 傳輸的訊息
 */
public class ChatMessage {
    /** 訊息種類 */
    private ChatType type;
    /** 訊息發送者的名稱 */
    private String sender;
    /** 訊息內容 */
    private String content;

    /**
     * 訊息種類Enum
     */
    public enum ChatType {
        CHAT,
        JOIN,
        LEAVE
    }

	public ChatType getType() {
		return type;
	}

	public void setType(ChatType type) {
		this.type = type;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
    
   
}
