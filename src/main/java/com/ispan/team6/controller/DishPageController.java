package com.ispan.team6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.service.RestaurantService;

@Controller
public class DishPageController {
	
	@Autowired
	RestaurantService restaurantService;

	@GetMapping("/backend/dish")
	public String dishPage() {
		return "adminDish";
	}
	
	@GetMapping("/restaurant/{id}/menu")
	public String dishPage2(@PathVariable Integer id, Model model) {
		Restaurant restaurant = restaurantService.findById(id);
		model.addAttribute("restaurant", restaurant);
		
		return "menu";
	}
	
	
}
