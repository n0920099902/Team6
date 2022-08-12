package com.ispan.team6.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.model.OrderMealDetailBean;

public interface OrderMealDetailRepository extends JpaRepository<OrderMealDetailBean, Integer> {

	// By ORDER_ID 搜尋
	List<OrderMealDetailBean> findByOrderid(String orderid);

	// By MEAL_ID 搜尋
	List<OrderMealDetailBean> findByMealid(String mealid);
}
