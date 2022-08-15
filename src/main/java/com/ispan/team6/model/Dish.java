//package com.ispan.team6.model;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.FetchType;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//import org.springframework.data.annotation.Transient;
//
//@Entity
//@Table(name="Dish")
//public class Dish {
//	
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "id")
//	private int id;
//	
//	@Column(name ="fk_rest_id")
//	@Transient
//	private int restID; 
//	
//	@ManyToOne(fetch= FetchType.EAGER )
//    @JoinColumn(name ="fk_rest_id", insertable=false, updatable=false)
//	private Restaurant rest; 
//	
//	@Column(name = "dishName")
//	private String dishName;
//	
//	@Column(name = "dishPrice")
//	private int dishPrice;
//	
//	@Column(name ="fk_dishType_id")
//	@Transient
//	private int dishTypeId;
//	
//	@ManyToOne(fetch= FetchType.EAGER)
//    @JoinColumn(name ="fk_dishType_id", insertable=false, updatable=false)
//	private DishType dishType;
//	
//	@Column(name = "dishPhoto")
//	private byte[] dishPhoto;
//	
//	@Column(name = "dishStatus")
//	private String dishStatus;
//	
//	public Dish() {
//	}
//
//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//	public int getRestID() {
//		return restID;
//	}
//
//	public void setRestID(int restID) {
//		this.restID = restID;
//	}
//
//	public Restaurant getRest() {
//		return rest;
//	}
//
//	public void setRest(Restaurant rest) {
//		this.rest = rest;
//	}
//
//	public String getDishName() {
//		return dishName;
//	}
//
//	public void setDishName(String dishName) {
//		this.dishName = dishName;
//	}
//
//	public int getDishPrice() {
//		return dishPrice;
//	}
//
//	public void setDishPrice(int dishPrice) {
//		this.dishPrice = dishPrice;
//	}
//
//	public int getDishTypeId() {
//		return dishTypeId;
//	}
//
//	public void setDishTypeId(int dishTypeId) {
//		this.dishTypeId = dishTypeId;
//	}
//
//	public DishType getDishType() {
//		return dishType;
//	}
//
//	public void setDishType(DishType dishType) {
//		this.dishType = dishType;
//	}
//
//	public byte[] getDishPhoto() {
//		return dishPhoto;
//	}
//
//	public void setDishPhoto(byte[] dishPhoto) {
//		this.dishPhoto = dishPhoto;
//	}
//
//	public String getDishStatus() {
//		return dishStatus;
//	}
//
//	public void setDishStatus(String dishStatus) {
//		this.dishStatus = dishStatus;
//	}
//
//}
