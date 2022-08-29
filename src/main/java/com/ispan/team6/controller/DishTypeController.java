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

import com.ispan.team6.dto.DishTypeDTO;
import com.ispan.team6.entity.DishType;
import com.ispan.team6.service.DishTypeService;

@RestController
public class DishTypeController {

	@Autowired
	private DishTypeService service;
	
	@PostMapping("/dish/category")
	public DishType insert(@RequestBody DishTypeDTO dishTypeDto) { 
		DishType respDishType = service.insertDishType(dishTypeDto);
		return respDishType;
	}
	
	@GetMapping("/dish/category")
	public List<DishTypeDTO> listAllDisheCategories(@RequestParam(value="restId", required=false) Integer restId) {
		List<DishTypeDTO> categories = service.listAllDishCategories(restId);
		
		return categories;
	}
	
	@DeleteMapping("/dish/category/{id}")
	public void delete(@PathVariable String id) {
		service.deleteDishType(id);
	}
	
	@PutMapping("/dish/category")
	public void update(@RequestBody DishTypeDTO dishTypeDto) {
		service.editDishType(dishTypeDto);
	}
	
}