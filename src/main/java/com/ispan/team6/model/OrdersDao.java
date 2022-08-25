package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Orders;

public interface OrdersDao extends JpaRepository<Orders, Integer> {
	
	@Query(value = "select * from Orders where fk_users_id =:id", nativeQuery = true)
	public List<Orders> findOrdersByUsersId(int id);


//	@Query(value = "select * from orders whrere ")
	
}
