package com.ispan.team6.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ispan.team6.model.Restaurant;
import com.ispan.team6.model.RestaurantDao;

@Service
@Transactional
public class RestaurantService {

	@Autowired
	private RestaurantDao rDao;

	public List<Restaurant> findAllRestuarant() {
		return rDao.findAll();
	}

	public void insertRestaurant(Restaurant rest) {
		rDao.save(rest);
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
}
