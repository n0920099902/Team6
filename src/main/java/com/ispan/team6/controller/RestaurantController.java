package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.team6.model.Restaurant;
import com.ispan.team6.model.RestaurantType;
import com.ispan.team6.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService rService;

	@GetMapping("/restaurant/add")
	public String addRestaurantPage(Model m) {
		List<RestaurantType> list = rService.findAllRestuarantType();
		m.addAttribute("allRestaurantType", list);

		return "addRestaurant";
	}

	@PostMapping("/uploadRestaurant")
	public String uploadRestaurant(@RequestParam("restaurantName") String name,
			@RequestParam("restaurantPhone") String phone, @RequestParam("restaurantAddress") String address,
			@RequestParam("startTime") String starttime, @RequestParam("endTime") String endtime,
			@RequestParam("startDate") String startdate, @RequestParam("endDate") String enddate,
			@RequestParam("remark") String remark, @RequestParam("restaurantType") Integer rest_type_id, Model m) {

		Restaurant newRest = new Restaurant();
		RestaurantType newRestType = new RestaurantType();
		newRest.setName(name);
		newRest.setPhone(phone);
		newRest.setAddress(address);
		newRestType.setRest_type_id(rest_type_id);
		newRest.setStarttime(starttime);
		newRest.setEndtime(endtime);
		newRest.setStartDate(startdate);
		newRest.setEndDate(enddate);
		newRest.setRemark(remark);

		rService.insertRestaurant(newRest);

		return "addRestaurant";
	}

	@GetMapping("/restaurantType/viewType")
	public void findAllRestaurantType(Model m) {
		List<RestaurantType> list = rService.findAllRestuarantType();
		m.addAttribute("allRestaurantType", list);
	}

	public void uploadType() {

	}

	@GetMapping("/restaurant/viewRestaurants")
	public String findAllRestaurant(Model m) {
		List<Restaurant> list = rService.findAllRestuarant();
		m.addAttribute("allRestaurant", list);

		return "viewRestaurants";
	}

	@GetMapping("/restaurant/deleteRestaurant/{id}")
	public String deleteRestaurantById(@PathVariable Integer id) {
		rService.deleteRestaurant(id);

		return "redirect:/restaurant/viewRestaurants ";
	}

	@GetMapping("/restaurant/editRestaurant/{id}")
	public String editRestaurantPage(@PathVariable Integer id, Model m) {
		Restaurant res = rService.findById(id);
		m.addAttribute("restaurant", res);

		return "editRestaurant";
	}

	@PostMapping("/restaurant/editRestaurant")
	public String editRestaurant(@ModelAttribute Restaurant restaurant) {
		rService.insertRestaurant(restaurant);

		return "redirect:/restaurant/viewRestaurants";
	}

}
