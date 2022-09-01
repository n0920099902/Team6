package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.DishType;

public interface DishTypeDAO extends JpaRepository<DishType, Integer> {
	@Query(value="from DishType where fk_rest_id=?1")
	public List<DishType> findAllByRestId(Integer restId);
}
