package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.OrdersDetail;

public interface OrdersDetailDao extends JpaRepository<OrdersDetail, Integer> {

	@Query(value = "select * from [Orders_Detail] where fk_order_id =:id", nativeQuery = true)
	public List<OrdersDetail> findByOrderId(int id);
	
	
	
	
	
	
	
	void save(Integer id);
	
	

}
