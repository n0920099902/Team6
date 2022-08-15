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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
