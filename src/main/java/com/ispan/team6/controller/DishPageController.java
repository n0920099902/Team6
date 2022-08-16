package com.ispan.team6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DishPageController {

	@GetMapping("/backend/dish")
	public String dishPage() {
		return "admin";
	}
	
}
