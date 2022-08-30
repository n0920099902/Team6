package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Dish;

public interface DishDAO extends JpaRepository<Dish, Integer> {
	@Query(value="from Dish where fk_rest_id=?1 and dishStatus='已上架'")
	public List<Dish> findAllByRestIdAndDishStatusIsPublished(Integer restId);
	
	@Query(value="from Dish where fk_rest_id=?1")
	public List<Dish> findAllByRestId(Integer restId);

}
