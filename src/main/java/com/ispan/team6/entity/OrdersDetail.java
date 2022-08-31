package com.ispan.team6.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Orders_Detail")
public class OrdersDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "id")
	private Integer id;

	//多對一 OrderDetail對Dish外鍵(一種Dish可以有多筆OrderDetail)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_dish_id")
	private Dish dish;
	
//	@Column(name = "quantity;")
	private Integer quantity;

	//多對一 OrderDetail對Order外鍵(一筆Order可以有多筆OrderDetail)
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id")
	private Orders orders;
	
	public OrdersDetail() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Dish getDish() {
		return dish;
	}

	public void setDish(Dish dish) {
		this.dish = dish;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
