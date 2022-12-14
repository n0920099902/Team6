package com.ispan.team6.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.dto.RestDistance;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.RestaurantType;
import com.ispan.team6.entity.Rstatistics;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.RestaurantTypeDao;
import com.ispan.team6.service.RestaurantService;
import com.ispan.team6.service.UsersService;

@Controller
@SessionAttributes("restaurant")
public class RestaurantController {

	@Autowired
	private RestaurantService rService;

	@Autowired
	private UsersService uService;

	@Autowired
	private RestaurantTypeDao rtDao;

	@GetMapping("/restaurant/downloadImage/{id}")
	public void downloadImage(@PathVariable Integer id, HttpServletResponse response) throws IOException {
		Restaurant r = rService.findById(id);

		int len = 0;
		try {
			len = (int) r.getPhoto().length();
			byte[] bytes = r.getPhoto().getBytes(1, len);
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
//			@RequestParam("remark") String remark,
			@RequestParam("restaurantType") Integer rest_type_id,
			@RequestParam("restaurantImg") MultipartFile file, Model m, Users member, HttpSession session) {

		Users user = (Users) session.getAttribute("member");
		Restaurant newRest = new Restaurant();

		RestaurantType typeId = rService.findTypeById(rest_type_id);

		newRest.setName(name);
		newRest.setPhone(phone);
		newRest.setAddress(address);
		newRest.setRestaurantType(typeId);
		newRest.setStartTime(starttime);
		newRest.setEndTime(endtime);
		newRest.setStartDate(startdate);
		newRest.setEndDate(enddate);
//		newRest.setRemark(remark);
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				Blob blob = new SerialBlob(bytes);
				newRest.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("????????????????????????: " + e.getMessage());
			}
		}
		newRest.setUsers(user);

		rService.insertRestaurant(newRest);

		return "redirect:/backend/dish/category";
	}

	@GetMapping("/restaurant/viewRestaurants")
	public String findAllRestaurant(Model m) {
		List<Restaurant> list = rService.findAllRestuarant();
		m.addAttribute("allRestaurant", list);

		return "viewRestaurants";
	}

	@GetMapping("/restaurant/deleteRestaurant/{id}")
	public String deleteRestaurantById(@PathVariable Integer id) {
		rService.deleteRestaurantById(id);

		return "redirect:/restaurant/viewRestaurants";
	}

	@GetMapping("/restaurant/editRestaurant/{id}")
	public String editRestaurantPage(@PathVariable("id") Integer id, Model m, Users member, HttpSession session)
			throws IOException {
		Users user = (Users) session.getAttribute("member");
		Restaurant res = rService.findByUsers(user);
		Restaurant resId = rService.findById(res.getId());
		m.addAttribute("restaurant", resId);
		m.addAttribute("member", user);

		// ??????????????????
		List<RestaurantType> list = rService.findAllRestuarantType();
		m.addAttribute("allRestaurantType", list);

		// ??????????????????
		Map<String, String> DateMap = new LinkedHashMap<>();
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		m.addAttribute("DateMap", DateMap);

		return "editRestaurant";
	}

	// form????????????
//	@PostMapping("/restaurant/editRestaurant")
//	public String editRestaurant(@RequestParam("id") Integer id, @RequestParam("restaurantName") String name,
//			@RequestParam("restaurantPhone") String phone, @RequestParam("restaurantAddress") String address,
//			@RequestParam("starttime") String starttime, @RequestParam("endtime") String endtime,
//			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
//			@RequestParam("remark") String remark, @RequestParam("restaurantType") Integer rest_type_id,
//			@RequestParam("restaurantImg") MultipartFile file, Users member, HttpSession session) throws IOException {
//
//		byte[] bytes = file.getBytes();
//
//		Users user = (Users) session.getAttribute("member");
//		Restaurant editRest = new Restaurant();
//
//		RestaurantType typeId = rService.findTypeById(rest_type_id);
//
//		editRest.setId(id);
//		editRest.setName(name);
//		editRest.setPhone(phone);
//		editRest.setAddress(address);
//		editRest.setRestaurantType(typeId);
//		editRest.setStartTime(starttime);
//		editRest.setEndTime(endtime);
//		editRest.setStartDate(startDate);
//		editRest.setEndDate(endDate);
//		editRest.setRemark(remark);
//		editRest.setPhoto(bytes);
//		editRest.setUser(user);
//
//		rService.insertRestaurant(editRest);
//
//		return "redirect:/restaurant/viewRestaurants";
//	}

	// form:form????????????
	@PostMapping("/restaurant/editRestaurant")
	public String editRestaurant(@ModelAttribute("restaurant") Restaurant restaurant, RestaurantType restaurantType,
			Users member, HttpSession session, Model model) throws IOException {
		Users user = (Users) session.getAttribute("member");
		MultipartFile file = restaurant.getImage();
		if (file != null && !file.isEmpty() && !file.toString().trim().equals("0x")) {
			try {
				byte[] bytes = file.getBytes();
				Blob blob = new SerialBlob(bytes);
				restaurant.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("????????????????????????: " + e.getMessage());
			}
		}
		RestaurantType typeId = rService.findTypeById(restaurant.getRestaurantType().getId());
		restaurant.setUsers(user);
		restaurant.setRestaurantType(typeId);
		rService.insertRestaurant(restaurant);

		return "redirect:/restaurant";
	}

	@GetMapping("/restaurant/editRestaurantPageByAdmin/{id}")
	public String editRestaurantPageByAdmin(@PathVariable Integer id, Model m, Users member, Restaurant restaurant) {
		Restaurant resId = rService.findById(id);
		m.addAttribute("restaurant", resId);
		// ??????????????????
		List<RestaurantType> list = rService.findAllRestuarantType();
		m.addAttribute("allRestaurantType", list);

		// ??????????????????
		Map<String, String> DateMap = new LinkedHashMap<>();
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		DateMap.put("?????????", "?????????");
		m.addAttribute("DateMap", DateMap);

		return "editRestaurantByAdmin";
	}

	@PostMapping("/restaurant/editRestaurantAdmin")
	public String editRestaurantAdmin(@ModelAttribute("restaurant") Restaurant restaurant,
			RestaurantType restaurantType, Users member, HttpSession session, Model model) throws IOException {
		Restaurant rest = (Restaurant) session.getAttribute("restaurant");
		MultipartFile file = restaurant.getImage();
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				Blob blob = new SerialBlob(bytes);
				rest.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("????????????????????????: " + e.getMessage());
			}
		}
		Users u = uService.findUsersById(rest.getUsers().getId());
		RestaurantType typeId = rService.findTypeById(rest.getRestaurantType().getId());
		rest.setRestaurantType(typeId);
		rest.setUsers(u);
		rService.insertRestaurant(rest);

		return "redirect:/restaurant/viewRestaurants";
	}

	@GetMapping(value = "/restaurant/search", produces = "text/pain;charset=UTF-8")
	public String findByNameLike(@RequestParam("keyword") String keyword, Model m) {
		List<Restaurant> list1 = rService.findByNameLike("%" + keyword + "%");
		RestaurantType result = rService.findByType(keyword);
		List<Restaurant> list2 = rService.findByRestaurantType(result);
		if (result == null) {
			m.addAttribute("allRestaurant", list1);
		} else {
			m.addAttribute("allRestaurant", list2);
		}
		return "/restaurant";
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@GetMapping("/getRStatis")
	public String list(Model m) {
		// ???????????? bean
		List<Restaurant> allRestaurants = rService.findAllRestuarant();
		// ???????????? bean
		List<RestaurantType> allRestaurantTypes = rtDao.findAll();
		// ???????????? bean
		List<Rstatistics> result = new ArrayList<Rstatistics>();

		// ???????????????????????????????????? ??????sum???
		for (int i = 0; i < allRestaurantTypes.size(); i++) {
			int sum = 0;
			for (int j = 0; j < allRestaurants.size(); j++) {
				if (allRestaurants.get(j).getRestaurantType().getId() == allRestaurantTypes.get(i).getId()) {
					sum += 1;
				}
			}
			// ????????????R?????????
			Rstatistics r = new Rstatistics();
			// ????????????????????????
			r.setTypeString(allRestaurantTypes.get(i).getType());
			r.setQuantity(sum);
			result.add(r);
		}
		m.addAttribute("statistics", result);
		return "BackstageIndex";
	}
	
	@PostMapping(value = "/SortByDistance", produces = "text/pain;charset=UTF-8")
	public String SortByDistance(@RequestParam("restDistance")List<Integer> distance,@RequestParam("restId") List<Integer> rid, Model m) {
		
		class SortByDistance implements Comparator<RestDistance> {
	        @Override
	        public int compare(RestDistance a, RestDistance b) {
	            return a.distance.compareTo(b.distance);
	        }
	    }
		
		
	    List<RestDistance> rd=new ArrayList<RestDistance>();
	    
		for(int i=0;i<distance.size();i++) {
			Restaurant r=rService.findById(rid.get(i));
			RestDistance rd1=new RestDistance();
			rd1.setDistance(distance.get(i));
			rd1.setRes(r);
			rd.add(rd1);
		}
		Collections.sort(rd, new SortByDistance());
		
		List<Restaurant>r1=new ArrayList<Restaurant>();
		
		for(int i=0;i<rd.size();i++) {
			r1.add(rd.get(i).getRes());
		}
		
		m.addAttribute("allRestaurant",r1);
		
		return "restaurant";
	}

}
