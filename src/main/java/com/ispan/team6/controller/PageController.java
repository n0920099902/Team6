package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.DishDAO;
import com.ispan.team6.service.RestaurantService;

@Controller
public class PageController {

	@Autowired
	private RestaurantService rService;
	
	@Autowired
	private DishDAO dDao;
	
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

	@GetMapping("/Users/register")
	public String memberaddPage2() {
		return "RegisterUsers";
	}

	@GetMapping("login")
	public String loginIndex() {
		return "login";
	}
	@GetMapping("sign")
	public String signIndex() {
		return "sign";
	}
	
	@GetMapping("/users/userCentre")
	public String userCentre() {
		return "userCentre";
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

	@GetMapping("/test")
	public String testAction() {
		return "Test";
	}
	@GetMapping("shoppincar/Test")
	public String testAction2() {
		return "shoppincar";
	}
	
	@GetMapping("/shop/shopBack")
	public String shopBackProcess(){
		return "shopBack";
	}
//    //新增食物testForOrder
//	@GetMapping("/getAlldish/{id}")
//	public String processDishMainAction(@PathVariable("id") int id, Model m) {
//		List<Dish> list = dDao.findByRestId(id);
//		m.addAttribute("allDish", list);
//		m.addAttribute("rid", id);
//		return "dish";
//	}
	//testForOrder
//	@GetMapping("/dish")
//	public String processAction(Model m) {
//		List<Restaurant> list = rService.findAllRestuarant();
//		m.addAttribute("allRestaurant", list);
//		return "AddDish";
//	}
	//testForOrder
	@GetMapping("/b")
	public String process() {
		return "bL";
		
	}
	@GetMapping("/GM")
	public String GM() {
		return "GM";}
	
	@GetMapping("/restaurant/restaurantComment")
	public String restaurantComment() {
		return "restaurantComment";}

}