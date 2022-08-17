package com.ispan.team6.entity;

import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Dish")
public class Dish {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch= FetchType.EAGER)
    @JoinColumn(name ="fk_rest_id")
	private Restaurant rest;
	
	private String dishName;
	
	private Integer dishPrice;
	
	@ManyToOne(fetch= FetchType.EAGER)
    @JoinColumn(name ="fk_dishType_id")
	private DishType dishType;
	
	@Lob
	private Blob dishPhoto;
	
	private String dishStatus;
	
	public Dish() {
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

	public Integer getDishPrice() {
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

	public Blob getDishPhoto() {
		return dishPhoto;
	}

	public void setDishPhoto(Blob dishPhoto) {
		this.dishPhoto = dishPhoto;
	}

	public String getDishStatus() {
		return dishStatus;
	}

	public void setDishStatus(String dishStatus) {
		this.dishStatus = dishStatus;
	}

}
