package com.ispan.team6.dto;

public class DishTypeDTO {
	
	private String dishTypeId;
	private String dishTypeCategory;
	private String restId;
	private String restName;
	
	public String getDishTypeId() {
		return dishTypeId;
	}

	public void setDishTypeId(String dishTypeId) {
		this.dishTypeId = dishTypeId;
	}

	public String getDishTypeCategory() {
		return dishTypeCategory;
	}

	public void setDishTypeCategory(String dishTypeCategory) {
		this.dishTypeCategory = dishTypeCategory;
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

	public DishTypeDTO() {
	}

}
