package com.ispan.team6.dto;

import java.util.Date;

public class AddCommentDto {

	private Integer orderId;
	
	private String comments;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
