package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ispan.team6.model.Restaurant;
import com.ispan.team6.model.Users;
import com.ispan.team6.service.RestaurantService;

@Controller
public class PageController {

	@Autowired
	private RestaurantService rService;
	
	@GetMapping("/")
	public String welcomeIndex() {
		return "index";
	}

	@GetMapping("/member/view")
	public String memberaddPage(Model m) {

		Users newMember = new Users();
		m.addAttribute("member", newMember);

		return "memberadd";
	}

	@GetMapping("/Users/navbar")
	public String memberaddPage2(Model m) {
		return "ADD";
	}

//	@GetMapping("/search")
//	public String SearchPage() {
//		return "Search";
//	}
	@GetMapping("/restaurant")
	public String processRestaurantMainAction(Model m) {
		List<Restaurant> list = rService.findAllRestuarant();
		m.addAttribute("allRestaurant", list);
		return "restaurant";
	}

	@GetMapping("/restaurant/intro/{id}")
	public String processAction(@PathVariable Integer id) {
		return "restaurantIntro";
	}

	@GetMapping("restaurant/Test")
	public String testAction() {
		return "Test";
	}

}
