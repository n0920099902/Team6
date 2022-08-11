package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RestaurantTypeDao extends JpaRepository<RestaurantType, Integer> {

	@Query(value = "select [rest_type] from [Restaurant_type]" + "  inner join [Restaurant] on"
			+ "  [Restaurant_type].[rest_type_id] =  [Restaurant].[fk_type_id] ;", nativeQuery = true)
	public void getRestTypeIdByFkTypeId(@Param("rest_type_id") Integer rest_type_id);

}
