package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Dish;

public interface DishDAO extends JpaRepository<Dish, Integer> {

	public Dish findById(int id);
	
	@Query(value = "select * from Dish where fk_rest_id =:keyword", nativeQuery = true)
	public List<Dish> findByRestId(int keyword);
}
