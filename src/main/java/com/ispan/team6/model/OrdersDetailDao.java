package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdersDetailDao extends JpaRepository<OrdersDetail, Integer> {

	void save(Integer id);
	
	

}
