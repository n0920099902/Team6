package com.ispan.team6.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Restaurant_type")
public class RestaurantType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rest_type_id")
	private Integer rest_type_id;

	@Column(name = "rest_type")
	private String rest_type;

	public RestaurantType() {
	}
	
	public RestaurantType(Integer rest_type_id, String rest_type) {
		super();
		this.rest_type_id = rest_type_id;
		this.rest_type = rest_type;
	}

	public Integer getRest_type_id() {
		return rest_type_id;
	}

	public void setRest_type_id(Integer rest_type_id) {
		this.rest_type_id = rest_type_id;
	}

	public String getRest_type() {
		return rest_type;
	}

	public void setRest_type(String rest_type) {
		this.rest_type = rest_type;
	}

}
