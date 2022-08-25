package com.ispan.team6.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.RestaurantType;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.RestaurantDao;
import com.ispan.team6.service.RestaurantService;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantDao rDao;

	@Autowired
	private RestaurantService rService;

	@GetMapping("/restaurant/downloadImage/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable Integer id) {
		Restaurant photo1 = rService.findById(id);

		byte[] photoFile = photo1.getPhoto();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		// 要回傳的物件本體, header, HttpStatus 回應
		return new ResponseEntity<byte[]>(photoFile, header, HttpStatus.OK);
	}

	@GetMapping("/shop/findRestByUser")
	public String findByUser(Users member, HttpSession session) {
		Users user = (Users) session.getAttribute("member");
		rService.findByUsers(user);
		return "/backend/dish";
	}

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
			@RequestParam("remark") String remark, @RequestParam("restaurantType") Integer rest_type_id,
			@RequestParam("restaurantImg") MultipartFile file, Model m, Users member, HttpSession session) {

		try {

			String REG_EXP = "^([0]{1}[0-9]{1}-?[0-9]{7}|[0]{1}[9]{1}-?[0-9]{8})$";

			byte[] bytes = file.getBytes();

			Users user = (Users) session.getAttribute("member");
			Restaurant newRest = new Restaurant();

			RestaurantType typeId = rService.findTypeById(rest_type_id);

			newRest.setName(name);
			if (phone.matches(REG_EXP)) {
				newRest.setPhone(phone);
			} else {
				return "addRestaurant";
			}
			newRest.setAddress(address);
			newRest.setRestaurantType(typeId);
			newRest.setStarttime(starttime);
			newRest.setEndtime(endtime);
			newRest.setStartDate(startdate);
			newRest.setEndDate(enddate);
			newRest.setRemark(remark);
			newRest.setPhoto(bytes);
			newRest.setUser(user);

			rService.insertRestaurant(newRest);

			return "addRestaurant";
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
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
	public String editRestaurantPage(@PathVariable("id") Integer id, Model m,Users member,HttpSession session) throws IOException {
		Users user = (Users)session.getAttribute("member");
		Restaurant res = rDao.findByUid(user.getId());
//		System.out.println("aaaaaaaaaa"+res.getId());
		m.addAttribute("restaurant", res);

		// 餐廳類別顯示
		List<RestaurantType> list = rService.findAllRestuarantType();
		m.addAttribute("allRestaurantType", list);

		return "editRestaurant";
	}

	@PostMapping("/restaurant/editRestaurant")
	public String editRestaurant(@RequestParam("id") Integer id, @RequestParam("restaurantName") String name,
			@RequestParam("restaurantPhone") String phone, @RequestParam("restaurantAddress") String address,
			@RequestParam("starttime") String starttime, @RequestParam("endtime") String endtime,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("remark") String remark, @RequestParam("restaurantType") Integer rest_type_id,
			@RequestParam("restaurantImg") MultipartFile file,Users member,HttpSession session) throws IOException {

		byte[] bytes = file.getBytes();

		Users user = (Users) session.getAttribute("member");
		Restaurant editRest = new Restaurant();

		RestaurantType typeId = rService.findTypeById(rest_type_id);

		editRest.setId(id);
		editRest.setName(name);
		editRest.setPhone(phone);
		editRest.setAddress(address);
		editRest.setRestaurantType(typeId);
		editRest.setStarttime(starttime);
		editRest.setEndtime(endtime);
		editRest.setStartDate(startDate);
		editRest.setEndDate(endDate);
		editRest.setRemark(remark);
		editRest.setPhoto(bytes);
		editRest.setUser(user);

		rService.insertRestaurant(editRest);

		return "redirect:/restaurant/viewRestaurants";
	}

	@GetMapping(value = "/restaurant/search1", produces = "text/pain;charset=UTF-8")
	public String findByNameLike(@RequestParam String keyword, Model m) {
		List<Restaurant> list1 = rService.findByNameLike("%" + keyword + "%");

		m.addAttribute("allRestaurant", list1);
		return "viewRestaurants";
	}

	@GetMapping(value = "/restaurant/search2", produces = "text/pain;charset=UTF-8")
	public String findByTypeLike(@RequestParam String keyword, Model m) {
		List<RestaurantType> list2 = rService.findByTypeLike(keyword);

		m.addAttribute("allRestaurant", list2);

		return "viewRestaurants";
	}

}
