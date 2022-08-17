package com.ispan.team6.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Orders")
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "id")
	private Integer id;

	@DateTimeFormat(pattern = "yyyy:MM:dd HH:mm:ss")
//	@Column(name = "orderstime")
	private String ordersTime;

//	@Column(name = "totalprice")
	private Integer totalPrice;

//	@Column(name = "address")
	private String address;

//	@Column(name = "phone")
	private Integer phone;

//	@Column(name = "ordersstatus")
	private String ordersStatus;

//	@Column(name = "quantity;")
	private Integer quantity;

//	@Column(name = "remark")
	private String remark;

	//一對多 Orders對OrdersDetail外鍵(一筆Order會有多筆OrderDetail)
	@OneToMany(mappedBy = "orders", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<OrdersDetail> ordersDetail = new LinkedHashSet<OrdersDetail>();
	
	//一對一 Orders對Comment外鍵(一筆Order只會有一筆Comment)
	@OneToOne(mappedBy = "orders")
	private Comment comment;
	
	//多對一 Order對Restaurant外鍵(一間Restaurant可以有多筆Order)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_rest_id", insertable = false, updatable = false)
	private Restaurant restaurant;

	//多對一 Order對User外鍵(一個User可以有多筆Order)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_users_id")
	private Users users;
	
	public Orders() {
	}

	public Orders(Integer id, String ordersTime, Integer totalPrice, String address, Integer phone, String ordersStatus,
			String remark, Restaurant restaurant, Users users) {
		super();
		this.id = id;
		this.ordersTime = ordersTime;
		this.totalPrice = totalPrice;
		this.address = address;
		this.phone = phone;
		this.ordersStatus = ordersStatus;
		this.remark = remark;
		this.restaurant = restaurant;
		this.users = users;
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
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Set<OrdersDetail> getOrdersDetail() {
		return ordersDetail;
	}

	public void setOrdersDetail(Set<OrdersDetail> ordersDetail) {
		this.ordersDetail = ordersDetail;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

}
