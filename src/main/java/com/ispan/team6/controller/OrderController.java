package com.ispan.team6.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.DishQ;
import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.OrdersDetail;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.DishDAO;
import com.ispan.team6.model.OrdersDao;
import com.ispan.team6.model.OrdersDetailDao;
import com.ispan.team6.service.OrdersDetailService;
import com.ispan.team6.service.OrdersService;
import com.ispan.team6.service.RestaurantService;
import com.ispan.team6.service.UsersService;

@Controller
@SessionAttributes({ "dish", "member", "buy", "orderPay" })
public class OrderController {

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private OrdersDao ordersDao;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private OrdersDetailDao ordersDetailDao;

	@Autowired
	private UsersService usersService;

	@Autowired
	private DishDAO dishDAO;
	@Autowired
	private OrdersDetailService ordersDetailService;

	// ???????????????????????????
	@GetMapping("cart/noLoginCart")
	public String process() {
		return "menuNoLoginCart";
	}

	// ?????????????????????????????????
	@GetMapping("/cart/eidtOrder")
	public String prosseceToEidtOrder() {
		return "menuTestForOrderEdit";
	}

//	//????????????session???????????????????????????
	@GetMapping("/cart/downloadImage/{id}")
	public void downloadImage(@PathVariable Integer id, HttpServletResponse response) throws IOException {
		Dish r = ordersService.findOrderImgbyId(id);

		int len = 0;
		try {
			len = (int) r.getDishPhoto().length();
			byte[] bytes = r.getDishPhoto().getBytes(1, len);
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
			OutputStream out = response.getOutputStream();
			if (bytes != null) {
				out.write(bytes);
				out.flush();
			}
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//??????????????????????????????????????????
	@PostMapping("/confirmBuy")
	public String confirmBuy(@RequestParam("id") List<Integer> id, @RequestParam("price") List<Integer> price,
			@RequestParam("quantity") List<Integer> quantity, @RequestParam("rID") Integer rID,
			@RequestParam("UID") int UID, @RequestParam("address") String address,
			@RequestParam("orderStatus") String orderStatus, @RequestParam("time") String time,
			@RequestParam("phone") Integer phone, Model m, HttpSession session) {
		int totalPrice = 0;
		for (int i = 0; i < price.size(); i++) {
			int p = price.get(i);
			int q = quantity.get(i);
			totalPrice += p * q;
		}
		Restaurant r = new Restaurant();
		r.setId(rID);
		Restaurant rId = restaurantService.findById(rID);
		Users u = usersService.findById(UID);
//		Users u = (Users)session.getAttribute("member");
		Orders orders = new Orders();
		orders.setUsers(u);
		orders.setRestaurant(rId);
		orders.setAddress(address);
		orders.setOrdersStatus(orderStatus);
		orders.setOrdersTime(time);
		orders.setPhone(phone);
		orders.setTotalPrice(totalPrice);
		orders.setRemark("?????????");
		ordersDao.save(orders);

		System.out.println("?????????id1:" + id + "??????" + quantity + "orders" + orders);

		for (int i = 0; i < id.size(); i++) {
			OrdersDetail detail = new OrdersDetail();

			Dish dish = ordersDetailService.OrderFindDishById((Integer) id.get(i));
			System.out.println("?????????id2:" + id + "??????" + quantity + "orders" + orders);
			Integer q = quantity.get(i);
			System.out.println("q" + q);
			detail.setDish(dish);
			System.out.println("dish" + dish);
			detail.setQuantity(q);
			detail.setOrders(orders);
			System.out.println("orders" + orders);
			System.out.println("detail=====>" + detail);
			System.out.println("detail.getId()=====>" + detail.getId());
			ordersDetailDao.save(detail);

		}
		System.out.println("c");
		m.addAttribute("orderPay", orders);
		// return "redirect:/getUsersOrder";
		return "redirect:/restaurant/cart/payment/" + orders.getId();
	}

	// ?????????????????????(???????????????editOrderRemark)(?????????)
	@GetMapping("/restaurant/cart/payment/checkoutDetails")
	public String checkoutDetails(HttpSession session, Model m, @SessionAttribute("member") Users us) {
//		System.out.println(ordersDao);
		Orders order = (Orders) session.getAttribute("orderPay");
		Integer oId = order.getId();
//		System.out.println("order.getId() ====>" + order.getId());
		Orders orders = ordersDao.findById(oId).get();
//		System.out.println("orders ======>" + orders);
		if (orders == null) {
			m.addAttribute("message", "??????????????????");
		} else {
			m.addAttribute("Horders", orders);
		}

		return "orderCheckoutDetail";
	}

	// ???????????? ????????????post ??????????????????get
	@PostMapping("/order/confirmBuy/{id}")
	public String editOrderRemark(@PathVariable Integer id, Model m, HttpSession session) {
		
		Orders o = ordersDao.findOrdersById(id);
		o.setRemark("?????????");
		ordersDao.save(o);
		m.addAttribute("Horders",o);

		Users u = o.getUsers();
		m.addAttribute("member", u);
		m.addAttribute("message", "????????????");

		return "confirmBuy";
	}

	// ???????????????????????????
	@GetMapping("/getUsersOrder")
	public String getUsrsOrder(Model m, @SessionAttribute("member") Users us) {
		System.out.println(ordersDao);
		List<Orders> orders = ordersDao.findOrdersByUsersId(us.getId());
		System.out.println(orders);
		if (orders.size() == 0) {
			m.addAttribute("message", "??????????????????");
		} else {
			m.addAttribute("Horders", orders);
		}

		return "historyOrder";
	}

	// ???????????????????????????deteil
	@GetMapping("/OrderDetail/{id}")
	public String getDetail(Model m, @PathVariable("id") int id) {

		List<OrdersDetail> od = ordersDetailDao.findByOrderId(id);
		m.addAttribute("OrderDetail", od);

		return "oderDetail";
	}
//???????????????
	
	
	
//????????????
	
// -------------------------------------------------------------
// -------------------------------------------------------------
// -------------------------------------------------------------
//--------------------------------------------------------------
//	--------------------------?????????????????????-----------------------
//--------------------------------------------------------------
//--------------------------------------------------------------
//--------------------------------------------------------------

	// ????????????session???????????????????????????
//	@GetMapping("/cart/downloadImage/{id}")
//	public String CartdownloadImage(@PathVariable int id, Model model) {
//		Restaurant restaurant = restaurantService.findById(id);
//		model.addAttribute("restaurant", restaurant);
//		return null;
//	}

//	@GetMapping("/restaurant/cart")
//	public String ProcessCart() {
//		return "cart";
//	}
	// ????????????????????? ??????????????????
	@GetMapping("/restaurant/cart")
	public String processRestaurantMainAction(Model m) {
		List<DishQ> buylist = new ArrayList<DishQ>();
		m.addAttribute("buy", buylist);
		List<Restaurant> list = restaurantService.findAllRestuarant();
		m.addAttribute("allRestaurant", list);
		return "cart";
	}

	@GetMapping("/restaurant/cart/getAlldish/{id}")
	public String cartGetAlldish(@PathVariable Integer id, Model m) {
		Restaurant restaurant = restaurantService.findById(id);
		m.addAttribute("restaurant", restaurant);
		m.addAttribute("rid", id);
		return "menuTestForOrder";
	}

//	@PostMapping("/restaurant/cart")
//	Public @ResponseBody list<DishQ> showOrders() {
//		
//	}

//	@GetMapping("/buyList/{rid}/{id}")
//	public String addBuy(@PathVariable int rid, @PathVariable int id, Model m, @RequestParam("quantity") int quantity) {
//		Dish d = dDao.findById(id);
//		List<DishQ> buyList = (List<DishQ>) m.getAttribute("buy");
//		DishQ dq = new DishQ();
//		int temp = -1;
//		if (buyList == null) {
//			dq.setDish(d);
//			dq.setQ(quantity);
//			buyList.add(dq);
//		}
//		if (buyList != null) {
//
//			for (int i = 0; i < buyList.size(); i++) {
//				Dish listDish = buyList.get(i).getDish();
//				if (d.getId() == listDish.getId()) {
//					temp = i;
//				}
//			}
//			if (temp != -1) {
//				int q = buyList.get(temp).getQ();
//				q += quantity;
//				buyList.get(temp).setQ(q);
//			}
//			if (temp == -1) {
//				dq.setDish(d);
//				dq.setQ(quantity);
//				buyList.add(dq);
//			}
//
//		}
//		return "redirect:/getAlldish/{rid}";
//
//	}

	@GetMapping("/restaurant/cartOrder")
	public String ProcessCartOrder() {
		return "cartOrder";
	}

	@PostMapping(path = "/orderMeal")
	@RequestMapping
	public String OrderMeal(@RequestBody OrdersDetail ordersDetail, HttpServletRequest request, ModelMap Model) {
		List<OrdersDetail> cart = (List<OrdersDetail>) Model.getAttribute("cart");

		return null;
	}

//	@GetMapping("/getAlldish/{id}")
//	public String processDishMainAction(@PathVariable("id") int id, Model m) {
//		List<Dish> list = dDao.findByRestId(id);
//		m.addAttribute("allDish", list);
//		m.addAttribute("rid", id);
//		return "dish";
//	}

//		@RequestMapping("/login")
//		public String login(SysUser sysUser, HttpServletRequest request) {
//			SysUser user = sysUserService.login(sysUser);
//			if (user != null) {
//				request.getSession().setAttribute("user", user);
//				return "redirect:/";
//			}
//			return "login";
//		}
//
//	}

//	@PostMapping("/restaurant/shopingCart")
//	public String shoppingCart(@RequestParam("dish_id") Integer dish_id, @RequestParam("Users_id") Integer Users_id,Model model) {
//		Integer ids = Integer.valueOf(id);
//		// ??????id??????????????????
//		List<Map> list = dishSer.listAllDishes(id);
//		System.err.println("????????????:" + list);
//		Shangpin shangpin = new ODService();
//		shangpin.setName((String) list.get(0).get("name"));
//		shangpin.setPrice((Double) list.get(0).get("price"));
//		shangpin.setId((Integer) list.get(0).get("id"));
//		// ???????????????
//		Map<Integer, Cart> cartMap = (Map<Integer, Cart>) session.getAttribute("cartMap");
//		// ?????????????????????????????????
//		if (cartMap == null) {
//			cartMap = new HashMap<Integer, Cart>();// ?????????map??????
//			// ????????????????????????
//			Cart cart = new Cart();
//			cart.setShangpin(shangpin);
//			cart.setNumber(1);
//			// ?????????????????????map?????????
//			cartMap.put(id, cart);
//		} else {// ????????????????????????
//			Cart cart = cartMap.get("id");// ????????????id???????????????????????????
//			if (cart != null) {// ?????????????????????
//				cart.setNumber(cart.getNumber() + 1);
//
//			} else {
//				cart = new Cart();
//				cart.setShangpin(shangpin);
//				cart.setNumber(1);
//				cartMap.put(id, cart);
//			}
//		}
//		// ???????????????session???
//		session.setAttribute("cartMap", cartMap);
//		return "forward:getShoppingCar";
//	}
//
//	@RequestMapping("getShoppingCar")
//	public String getShoppingCar(HttpSession session, Model model) {
//		Map<Integer, Cart> cartMap = (Map<Integer, Cart>) session.getAttribute("cartMap");
//		model.addAttribute("carList", cartMap);
//		return "udai_shopcart";
//	}
//
//	 @GetMapping("/api/getOrder")
//	    public List<Order> getAccounts() {
//	    System.out.println("??????????????????");
//	    return orderManager.getOrder();
//	  }
//
//	  @PostMapping("/api/getFullOrder")
//	  @ResponseBody
//	    public List<FullOrder> getOrderData(@RequestParam final String email) {
//	    System.out.println("??????" + email + "??????????????????");
//	    return orderManager.getFullOrder(email);
//	  }
//
//	  @GetMapping("/api/getFullOrder")
//	    public List<FullOrder> getOrderData() {
//	    System.out.println("??????????????????????????????");
//	    return orderManager.getFullOrder();
//	  }
//
//	  @GetMapping("/api/getFullOrder/{state}")
//	    public List<FullOrder> getOrderDataStates(
//	            @PathVariable("state") final String state) {
//	    System.out.println("??????????????????????????????");
//	    return orderManager.getFullOrderStates(state);
//	  }
//
//	  @PostMapping("/api/getFullOrder2")
//	  @ResponseBody
//	  public List<FullOrder> getOrderData2(@RequestParam final String email,
//	                                       @RequestParam final String state) {
//	    System.out.println("??????" + email + "??????????????????");
//	    System.out.println("??????" + state + "??????????????????");
//	    return orderManager.getFullOrder(email, state);
//	  }
//
//	  @PostMapping("/api/getBuyerOrder")
//	  @ResponseBody
//	    public List<BuyerOrder> getBuyerOrder(@RequestParam final String email) {
//	    System.out.println("??????????????????");
//	    return orderManager.getBuyerOrder(email);
//	  }
//
//	  @PostMapping("/api/getSellerOrder")
//	  @ResponseBody
//	    public List<BuyerOrder> getSellerOrder(
//	            @RequestParam final String productId) {
//	    System.out.println("??????????????????");
//	    return orderManager.getSellerOrder(productId);
//	  }
//
//
//	  @PostMapping("/api/order")
//	  @ResponseBody
//	  public Order addOrder(@RequestParam final int productId,
//	                        @RequestParam final String buyerEmail,
//	                        @RequestParam final int count,
//	                        @RequestParam final String password) {
//	    //??????api???
//	    System.out.println("productId is " + productId);
//	    System.out.println("buyerEmail is " + buyerEmail);
//	    System.out.println("password is " + password);
//	    System.out.println("count is " + count);
//	    //???????????????????()
//
//	    Account account = new Account(buyerEmail, password);
//	    Order order = new Order(productId, buyerEmail, count, "?????????", 0);
//	    if (!accountController.checkAccount(account)) {
//	      System.out.println("????????????");
//	      return null;
//	    }
//	    orderManager.addOrder(order);
//	    return order;
//	  }
//
//
//	  public boolean getReCount(final String email, final int productId) {
//	    System.out.println(Integer.parseInt(
//	            String.valueOf(orderManager.getReCount(email, productId))));
//	    if (Integer.parseInt(String.valueOf(
//	            orderManager.getReCount(email, productId))) == 0) {
//	      return true;
//	    } else {
//	      return false;
//	    }
//	  }
//
//
//	  @PostMapping("/api/addOrder")
//	  @ResponseBody
//	  public boolean addOrder1(@RequestParam final int productId,
//	                           @RequestParam final String buyerEmail,
//	                           @RequestParam final int count,
//	                           @RequestParam final String state,
//	                           @RequestParam final int billId) {
//	    if (getReCount(buyerEmail, productId)) {
//	      Order order = new Order(productId, buyerEmail, count, state, billId);
//	      orderManager.addOrder(order);
//	      return true;
//	    } else {
//	      return false;
//	    }
//	  }
//
//	  @PostMapping("/api/updataOrder")
//	  @ResponseBody
//	  public boolean updataOrder(@RequestParam final int orderId,
//	                             @RequestParam final String buyerEmail,
//	                             @RequestParam final int count) {
//	    System.out.println("orderId is " + orderId);
//	    System.out.println("buyerEmail is " + buyerEmail);
//	    System.out.println("count is " + count);
//	    //???????????????????()
//	    Order order = new Order(orderId, buyerEmail, count, stateArr[0], 0);
//	    orderManager.updateOrder(order);
//	    return true;
//	  }
//
//	  @PostMapping("/api/updateBill")
//	  @ResponseBody
//	  public boolean updateBill(@RequestParam final int count,
//	                            @RequestParam final int billId) {
//	    orderManager.updateBill(stateArr[count], billId);
//	    return true;
//	  }
//
//	  public int getMaxBill() {
//	    return Integer.parseInt(String.valueOf(orderManager.getMaxBill()));
//	  }
//
//	  String[] stateArr = {"?????????", "?????????", "?????????", "?????????"};
//	  //???????????????
//
//	  @PostMapping("/api/checkOrder")
//	  @ResponseBody
//	  public boolean checkOrder(@RequestParam final int orderId,
//	                            @RequestParam final String state) {
//	    System.out.println("orderId is " + orderId);
//	    System.out.println("orderState is " + state);
//	    orderManager.updateOrder(orderId, state, getMaxBill() + 1);
//	    return true;
//	  }
//
//	  @PostMapping("/api/deleteOrder")
//	  @ResponseBody
//	    public boolean deleteOrder(@RequestParam final int ID) {
//	    orderManager.deleteOrder(ID);
//	    return true;
//	    //???????????????????????????
//	  }
//	  @PostMapping("/api/getBillId")
//	  @ResponseBody
//	    public List<Integer> getBillId(@RequestParam final String email) {
//	    return orderManager.getBillId(email);
//	  }
//
//	  @PostMapping("/api/getBill")
//	  @ResponseBody
//	    public List<Bill> getBill(@RequestParam final int billId) {
//	    return orderManager.getBill(billId);
//	  }
//
//	  @GetMapping("/api/getAllBill")
//	  public List<MemberBill> getAllBill() {
//	    System.out.println(orderManager.getAllBill());
//	    return orderManager.getAllBill();
//	  }
//
//	  @GetMapping("/api/getAllBill/{state}")
//	  public List<MemberBill>  getAllBill(@PathVariable("state")
//	                                        final String state) {
//	    return orderManager.getAllBill(state);
//	  }
	//// ?????????
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
//	// Ajax ??????????????????
//	@GetMapping("/findAllDish")
//	public @ResponseBody List<DishBean1> findDish(Model model) {
//		List<DishBean1> dishList = dishRepository.findAll();
//		return dishList;
//	}

}