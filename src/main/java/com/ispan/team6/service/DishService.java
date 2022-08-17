package com.ispan.team6.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Dish;
import com.ispan.team6.model.DishDAO;

@Service
@Transactional
public class DishService {

	@Autowired
	private DishDAO dishDAO;
	
	public Dish insertDish(DishDTO dishDto) {
		Dish dish = new Dish();
		dish.setDishName(dishDto.getDishName());
		dish.setDishPhoto(dishDto.getDishPhoto());
		dish.setDishPrice(Integer.parseInt(dishDto.getDishPrice()));
		dish.setDishStatus(dishDto.getDishStatus());
		dish.setDishTypeId(Integer.parseInt(dishDto.getDishCategory()));
		dish.setRestID(Integer.parseInt(dishDto.getRestId()));
		return dishDAO.save(dish);
	}
	
	public List<DishDTO> listAllDishes() {
		List<Dish> dishes = dishDAO.findAll();
		List<DishDTO> result = new ArrayList<>();
		for (Dish d:dishes) {
			DishDTO dto = new DishDTO();
			dto.setRestName(d.getRest().getName());
			dto.setDishName(d.getDishName());
			dto.setDishCategory(String.valueOf(d.getDishType().getCategory()));
			dto.setDishPrice(String.valueOf(d.getDishPrice()));
			dto.setDishPhoto(d.getDishPhoto());
			dto.setDishStatus(d.getDishStatus());
			dto.setRestId(String.valueOf(d.getRest().getId()));
			
			result.add(dto);
		}
		
		return result;
	}
	
}
