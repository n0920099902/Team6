package com.ispan.team6.dto;

public class DishDTO {
	
	private String dishId;
	private String restId;
	private String restName;
	private String dishName;
	private String dishPrice;
	private String dishCategory;
	private String dishCategoryId;
	private String dishStatus;
	private byte[] dishPhoto;
	
	public String getDishId() {
		return dishId;
	}

	public void setDishId(String dishId) {
		this.dishId = dishId;
	}

	public String getRestId() {
		return restId;
	}

	public void setRestId(String restId) {
		this.restId = restId;
	}

	public String getRestName() {
		return restName;
	}

	public void setRestName(String restName) {
		this.restName = restName;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public String getDishPrice() {
		return dishPrice;
	}

	public void setDishPrice(String dishPrice) {
		this.dishPrice = dishPrice;
	}
	

	public String getDishCategory() {
		return dishCategory;
	}

	public void setDishCategory(String dishCategory) {
		this.dishCategory = dishCategory;
	}

	public String getDishCategoryId() {
		return dishCategoryId;
	}

	public void setDishCategoryId(String dishCategoryId) {
		this.dishCategoryId = dishCategoryId;
	}

	public String getDishStatus() {
		return dishStatus;
	}

	public void setDishStatus(String dishStatus) {
		this.dishStatus = dishStatus;
	}

	public byte[] getDishPhoto() {
		return dishPhoto;
	}

	public void setDishPhoto(byte[] dishPhoto) {
		this.dishPhoto = dishPhoto;
	}

	public DishDTO() {
	}

}
