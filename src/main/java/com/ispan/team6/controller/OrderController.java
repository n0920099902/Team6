package com.ispan.team6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.team6.model.UsersDao;
import com.ispan.team6.service.OrdersDetailService;
import com.ispan.team6.testForOders.GoodPhotoService;

@Controller
@SessionAttributes({ "Dish", "users" })
public class OrderController {


	@Autowired
	private GoodPhotoService gService;

	@Autowired
	private OrdersDetailService ODService;
	
	@Autowired
	private UsersDao usersDao;

	@GetMapping("/restaurant/cart")
	public String ProcessCart() {
		return "cart";
	}

	
	
////測試用
//	@GetMapping("/oders/add/{id}")
//	public String addOrders(@PathVariable Integer id) {
//
//		OrdersDetail od = new OrdersDetail();
//		GoodPhoto gpid = gService.getPhotoById(id);
//		od.setTestOrdersFood(gpid);
//		ODService.orderFood(od);
//		return "redirect:/listPhoto";
//	}
	

//	@RequestMapping("/shoppingCart")
//	public String shoppingCart(Integer id,HttpSession session,) {
//		
//	}
	



//	@ResponseBody
//	@GetMapping("/cony")
//	public String cony (HttpSession session , @RequestParam Integer id) {
//	Restaurant temp = resser.findById(id);
//	session.setAttribute("temp", temp);
//	System.out.println("session:"+session);
//	Restaurant A = (Restaurant)session.getAttribute("temp");
//		A.getAddress();
//		return null;
//
//	}
//	@GetMapping("/orderDish")
//	public String orderDish(@RequestParam("dish_id") Integer dish_id, @RequestParam("Users_id") Integer Users_id,Model model) {
//		Optional<Dish> optional = dishRepository.findById(dish_id);
//		DishBean1 dish = optional.get();
//		Optional<Users> optional2 = usersDao.findById(Users_id);
//		Users users = optional2.get();
//		OrderDetailBean detailBean = new OrderDetailBean();
//		detailBean.setId(dish_id);
//		detailBean.setDishBean(dish);
//		detailBean.setOrderBean(users);
//		model.addAttribute("detailBean", detailBean);
//		return null;
//	}
//
//	// Ajax 抓取所有菜色
//	@GetMapping("/findAllDish")
//	public @ResponseBody List<DishBean1> findDish(Model model) {
//		List<DishBean1> dishList = dishRepository.findAll();
//		return dishList;
//	}

}
