package com.ispan.team6.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.team6.model.Restaurant;
import com.ispan.team6.model.RestaurantDao;
import com.ispan.team6.model.RestaurantType;
import com.ispan.team6.model.RestaurantTypeDao;

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

	public Restaurant findById(Integer Id) {
		Optional<Restaurant> optional = rDao.findById(Id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}
	

	public void deleteRestaurant(Integer id) {
		rDao.deleteById(id);
	}

	public List<Restaurant> findByNameLike(String name) {
		return rDao.findByNameLike(name);
	}
	
	public List<RestaurantType> findByTypeLike(String name) {
		return rtDao.findByType(name);
	}
	
}
