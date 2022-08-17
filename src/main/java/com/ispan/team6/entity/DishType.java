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
@Table(name = "Dish_type")
public class DishType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "id")
	private int id;

//	@Column(name = "category")
	private String category;

	// 一對多 DishType對Dish(一個DishType會有多種Dish)
	@OneToMany(mappedBy = "dishType", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Dish> dish = new LinkedHashSet<Dish>();

	public DishType() {
	}

	public DishType(int id, String category, Set<Dish> dish) {
		super();
		this.id = id;
		this.category = category;
		this.dish = dish;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Set<Dish> getDish() {
		return dish;
	}

	public void setDish(Set<Dish> dish) {
		this.dish = dish;
	}

}
