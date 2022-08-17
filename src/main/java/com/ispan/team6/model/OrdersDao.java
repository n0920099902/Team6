package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Orders;

public interface OrdersDao extends JpaRepository<Orders, Integer> {

//	@Query(value = "select * from orders whrere ")
	
}
