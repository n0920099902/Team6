package com.ispan.team6.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Orders")
public class OrdersBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@DateTimeFormat(pattern = "HH:mm:ss")
	@Column(name = "orderstime")
	private String ordersTime;
	
	@Column(name = "totalprice")
	private Integer totalPrice;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phone")
	private Integer phone;

	@Column(name = "ordersstatus")
	private String ordersStatus;
	
	@Column(name = "remark")
	private String remark;
	
	@OneToOne(cascade = CascadeType.ALL )
	@JoinColumn(name = "fk_restaurant_id")
	private Restaurant Restaurant;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_users_id")
	private Users users;
	
	public OrdersBean () {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrdersTime() {
		return ordersTime;
	}

	public void setOrdersTime(String ordersTime) {
		this.ordersTime = ordersTime;
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

	public String getOrdersStatus() {
		return ordersStatus;
	}

	public void setOrdersStatus(String ordersStatus) {
		this.ordersStatus = ordersStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Restaurant getRestaurant() {
		return Restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		Restaurant = restaurant;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
}
