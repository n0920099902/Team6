package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.model.Dish;
import com.ispan.team6.service.DishService;

@RestController
public class DishController {

	@Autowired
	private DishService service;
	
	@PostMapping("/dish")
	public Dish insert(@RequestBody DishDTO dishDto) { 
		Dish respDish = service.insertDish(dishDto);
		return respDish;
	}
	
	@GetMapping("/dish")
	public List<DishDTO> listAllDishes() {
		List<DishDTO> dishes = service.listAllDishes();
		return dishes;
	}
	
	
	
	
	
	
}
