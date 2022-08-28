package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.RestaurantType;

public interface RestaurantTypeDao extends JpaRepository<RestaurantType, Integer> {

//	@Query(value = "select * from Restaurant_type where rest_type like %:keyword%", nativeQuery = true)
	RestaurantType findByType(String keyword);

	RestaurantType findIdByType(String type);
	
}