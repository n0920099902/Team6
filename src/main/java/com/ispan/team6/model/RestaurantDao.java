package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RestaurantDao extends JpaRepository<Restaurant, Integer> {

	List<Restaurant> findByNameLike(String keyword);
}
