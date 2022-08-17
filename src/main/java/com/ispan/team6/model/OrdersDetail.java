package com.ispan.team6.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ispan.team6.testForOders.GoodPhoto;

@Entity
@Table(name = "Orders_Detail")
public class OrdersDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@ManyToOne(cascade = CascadeType.ALL )
	@JoinColumn(name = "fk_dish_id")
	private Dish dish;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id")
	private OrdersBean OrdersBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_testOrdersFood_id ")
	private GoodPhoto testOrdersFood;

	public OrdersDetail() {
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	public OrdersBean getOrdersBean() {
		return OrdersBean;
	}

	public void setOrdersBean(OrdersBean ordersBean) {
		OrdersBean = ordersBean;
	}

	public GoodPhoto getTestOrdersFood() {
		return testOrdersFood;
	}

	public void setTestOrdersFood(GoodPhoto testOrdersFood) {
		this.testOrdersFood = testOrdersFood;
	}

}
