package com.ispan.team6.entity;

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
	
}
