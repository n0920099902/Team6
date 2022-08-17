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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Restaurant_type")
public class RestaurantType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "rest_type_id")
	private Integer rest_type_id;

//	@Column(name = "rest_type")
	private String rest_type;

	// 一對多 Restaurant對RestaurantType外鍵(一種RestaurantType會有多間Restaurant)
	@OneToMany(mappedBy = "restaurantType", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Restaurant> restaurant = new LinkedHashSet<Restaurant>();

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

	public Set<Restaurant> getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Set<Restaurant> restaurant) {
		this.restaurant = restaurant;
	}

}
