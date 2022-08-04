package com.ispan.springbootdemo_teacher.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MessageDto implements Serializable {
	                               // 實作序列化 and 反序列化
	
	@JsonProperty("message")
	private String msg;

	public MessageDto() {
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
