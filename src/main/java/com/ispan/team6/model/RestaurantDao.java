package com.ispan.team6.model;

import java.beans.Transient;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.RestaurantType;
import com.ispan.team6.entity.Users;

public interface RestaurantDao extends JpaRepository<Restaurant, Integer> {

	List<Restaurant> findByNameLike(String keyword);

//	@Query(value = "select * from Restaurant where fk_rest_id =:id", nativeQuery = true)
//	List<RestaurantType> findAllByRestaurantType(@Param("id") Integer id);

	List<Restaurant> findByRestaurantType(RestaurantType restaurantType);

	Optional<Restaurant> findByUsers(Users users);

	@Query(value = "select * from Restaurant where fk_user_id =:keyword", nativeQuery = true)
	Restaurant findByUid(Integer keyword);

	@Transient
	@Modifying
	@Query(value = "DELETE FROM Restaurant WHERE id= :id ", nativeQuery = true)
	void deleteRestaurantById(Integer id);

}
