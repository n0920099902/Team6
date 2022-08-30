package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.team6.dto.RestaurantDto;
import com.ispan.team6.dto.RestaurantTypeDto;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.RestaurantType;
import com.ispan.team6.entity.Users;
import com.ispan.team6.service.RestaurantService;
import com.ispan.team6.service.UsersService;

@Controller
public class RestaurantBackController {

	@Autowired
	private RestaurantService rService;

	@Autowired
	private UsersService uService;

	@PostMapping(value = "restaurant/api/editRestaurantPageByAdmin", consumes = {
			"application/json; charset=UTF-8" }, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public Restaurant editRestaurantPageByAdminApi(@RequestBody Restaurant rest, RestaurantType restType, Users users) {
		RestaurantType rType = rService.findTypeById(restType.getId());
		Users u = uService.findAccountById(users.getId());
		rest.setRestaurantType(rType);
		rest.setUsers(u);
		Restaurant r = rService.insertRestaurant2(rest);

		return r;
	}

	@GetMapping("restaurant/api/viewRestaurantBackPage")
	@ResponseBody
	public List<Restaurant> viewRestaurantBackPage() {
		List<Restaurant> list = rService.findAllRestuarant();
		return list;
	}
	
	
}
