package com.ispan.team6.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Restaurant_type")
public class RestaurantType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "rest_type_id")
	private Integer id;

	@Column(name = "rest_type")
	private String rest_type;

	@OneToOne(mappedBy = "RestaurantType")
	private Restaurant Restaurant;
	
	public RestaurantType(Integer id, String rest_type) {
		super();
		this.id = id;
		this.rest_type = rest_type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRest_type() {
		return rest_type;
	}

	public void setRest_type(String rest_type) {
		this.rest_type = rest_type;
	}

}
