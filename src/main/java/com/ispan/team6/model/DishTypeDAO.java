package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.DishType;

public interface DishTypeDAO extends JpaRepository<DishType, Integer> {

}
