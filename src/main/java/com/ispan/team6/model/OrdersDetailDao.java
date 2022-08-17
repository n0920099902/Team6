package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.OrdersDetail;

public interface OrdersDetailDao extends JpaRepository<OrdersDetail, Integer> {

	void save(Integer id);
	
	

}
