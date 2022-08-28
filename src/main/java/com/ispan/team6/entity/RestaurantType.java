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
	@Column(name = "rest_type_id")
	private Integer id;

	@Column(name = "rest_type")
	private String type;

	// 一對多 Restaurant對RestaurantType外鍵(一種RestaurantType會有多間Restaurant)
	@OneToMany(mappedBy = "restaurantType", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Restaurant> restaurant = new LinkedHashSet<Restaurant>();

	public RestaurantType() {
	}

	public RestaurantType(Integer id, String type) {
		super();
		this.id = id;
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Set<Restaurant> getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Set<Restaurant> restaurant) {
		this.restaurant = restaurant;
	}

}
