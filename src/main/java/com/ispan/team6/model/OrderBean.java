package com.ispan.team6.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Order")
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@DateTimeFormat(pattern = "HH:mm:ss")
	@Column(name = "ordertime")
	private String orderTime;
	
	@Column(name = "totalprice")
	private Integer totalPrice;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phone")
	private Integer phone;

	@Column(name = "orderstatus")
	private String orderStatus;
	
	@Column(name = "remark")
	private String remark;
	
	@OneToOne(cascade = CascadeType.ALL )
	@JoinColumn(name = "fk_restaurant_id")
	private Restaurant Restaurant;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member")
	private Member Member;
	
	public OrderBean(Integer id, String orderTime, Integer totalPrice, String address, Integer phone,
			String orderStatus, String remark) {
	
		super();
		this.id = id;
		this.orderTime = orderTime;
		this.totalPrice = totalPrice;
		this.address = address;
		this.phone = phone;
		this.orderStatus = orderStatus;
		this.remark = remark;
	}

	public OrderBean() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
