package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Dish;
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
	public List<DishDTO> listAllDishes(@RequestParam(value="restId", required=false) Integer restId, @RequestParam(value="showMode", required=false) String mode) {
		List<DishDTO> dishes = service.listAllDishes(mode, restId);
		
		return dishes;
	}
	
	@DeleteMapping("/dish/{id}")
	public void delete(@PathVariable String id) {
		service.deleteDish(id);
	}
	
	@PutMapping("/dish")
	public void update(@RequestBody DishDTO dishDto) {
		service.editDish(dishDto);
	}
	
}
