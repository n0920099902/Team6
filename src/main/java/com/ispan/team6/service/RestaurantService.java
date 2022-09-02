package com.ispan.team6.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Service;

import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.RestaurantType;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.RestaurantDao;
import com.ispan.team6.model.RestaurantTypeDao;
@Configurable
@Service
@Transactional
public class RestaurantService {

	@Autowired
	private RestaurantDao rDao;
	@Autowired
	private RestaurantTypeDao rtDao;

	public List<Restaurant> findAllRestuarant() {
		return rDao.findAll();
	}

	public List<RestaurantType> findAllRestuarantType() {
		return rtDao.findAll();
	}

	public void insertRestaurant(Restaurant r) {
		rDao.save(r);
	}

	public Restaurant insertRestaurant2(Restaurant r) {
		return rDao.save(r);
	}

	public void insertRestaurantType(RestaurantType r) {
		rtDao.save(r);
	}

	public Restaurant findById(Integer Id) {
		Optional<Restaurant> optional = rDao.findById(Id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public RestaurantType findTypeById(Integer rest_type_id) {
		Optional<RestaurantType> optional = rtDao.findById(rest_type_id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public RestaurantType findIdByType(String type) {
		return rtDao.findIdByType(type);
	}

	public RestaurantType findByType(String keyword) {
		return rtDao.findByType(keyword);
	}

	public void deleteRestaurantById(Integer id) {
		 rDao.deleteRestaurantById(id);
	}

	public List<Restaurant> findByNameLike(String name) {
		return rDao.findByNameLike(name);
	}

	public List<Restaurant> findByRestaurantType(RestaurantType type) {
		return rDao.findByRestaurantType(type);
	}

	public Restaurant findByUsers(Users users) {
		Optional<Restaurant> optional = rDao.findByUsers(users);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

}
