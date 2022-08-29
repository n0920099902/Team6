package com.ispan.team6.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Dish_type")
public class DishType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String category;
	
	@ManyToOne(fetch= FetchType.EAGER)
    @JoinColumn(name ="fk_rest_id")
	private Restaurant rest;
	
	public DishType() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Restaurant getRest() {
		return rest;
	}

	public void setRest(Restaurant rest) {
		this.rest = rest;
	}
	
}
