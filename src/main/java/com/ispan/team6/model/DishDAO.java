package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.Dish;

public interface DishDAO extends JpaRepository<Dish, Integer> {

}
