package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RestaurantTypeDao extends JpaRepository<RestaurantType, Integer> {

	@Query(value = "select * from Restaurant_type where rest_type like % :name %", nativeQuery = true)
	public List<RestaurantType> findByType(String name);
}