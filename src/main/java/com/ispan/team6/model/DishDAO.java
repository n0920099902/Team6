package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Dish;

public interface DishDAO extends JpaRepository<Dish, Integer> {
	@Query(value="from Dish where fk_rest_id=?1 and dishStatus='已上架'")
	public List<Dish> findAllByRestIdAndDishStatusIsPublished(Integer restId);
	
	@Query(value="from Dish where fk_rest_id=?1 and fk_dishType_id=?2 and dishStatus='已上架'")
	public List<Dish> findAllByRestIdAndDishStatusIsPublishedAndCategory(Integer restId, Integer categoryId);
	
	@Query(value="from Dish where fk_rest_id=?1")
	public List<Dish> findAllByRestId(Integer restId);
	
	@Query(value="select * from Dish a inner join Dish_type b on a.fk_dishType_id = b.id where a.fk_rest_id=:restId and (a.dishName like :keyword or a.dishStatus like :keyword or b.category like :keyword)", nativeQuery = true)
	public List<Dish> findAllByRestIdAndKeywordLike(Integer restId, String keyword);

}
