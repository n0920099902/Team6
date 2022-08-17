package com.ispan.team6.entity;

import java.sql.Blob;
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
import javax.persistence.Table;

@Entity
@Table(name = "Dish")
public class Dish {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "id")
	private Integer id;

//	@Column(name = "dishName")
	private String dishName;

//	@Column(name = "dishPrice")
	private Integer dishPrice;

//	@Column(name = "dishPhoto")
	private byte[] dishPhoto;

//	@Column(name = "dishStatus")
	private String dishStatus;

	// 一對多 Dish對OrdersDetail外鍵(一個Dish可以有多筆OrderDetail) 
	@OneToMany(mappedBy = "dish", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<OrdersDetail> ordersDetail = new LinkedHashSet<OrdersDetail>();
	
	// 多對一 Dish對Restaurant外鍵(一個Restaurant會有多種Dish)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_rest_id", insertable = false, updatable = false)
	private Restaurant rest;

	// 多對一 Dish對DishType外鍵(一個DishType會有多種Dish)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_dishType_id", insertable = false, updatable = false)
	private DishType dishType;

	public Dish() {
	}

	public Dish(Integer id, String dishName, Integer dishPrice, byte[] dishPhoto, String dishStatus, Restaurant rest,
			DishType dishType, Set<OrdersDetail> ordersDetail) {
		super();
		this.id = id;
		this.dishName = dishName;
		this.dishPrice = dishPrice;
		this.dishPhoto = dishPhoto;
		this.dishStatus = dishStatus;
		this.rest = rest;
		this.dishType = dishType;
		this.ordersDetail = ordersDetail;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Restaurant getRest() {
		return rest;
	}

	public void setRest(Restaurant rest) {
		this.rest = rest;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public int getDishPrice() {
		return dishPrice;
	}

	public void setDishPrice(Integer dishPrice) {
		this.dishPrice = dishPrice;
	}

	public DishType getDishType() {
		return dishType;
	}

	public void setDishType(DishType dishType) {
		this.dishType = dishType;
	}

	public byte[] getDishPhoto() {
		return dishPhoto;
	}

	public void setDishPhoto(byte[] dishPhoto) {
		this.dishPhoto = dishPhoto;
	}

	public String getDishStatus() {
		return dishStatus;
	}

	public void setDishStatus(String dishStatus) {
		this.dishStatus = dishStatus;
	}

	public Set<OrdersDetail> getOrdersDetail() {
		return ordersDetail;
	}

	public void setOrdersDetail(Set<OrdersDetail> ordersDetail) {
		this.ordersDetail = ordersDetail;
	}

}
