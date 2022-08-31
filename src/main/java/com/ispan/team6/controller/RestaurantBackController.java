//package com.ispan.team6.controller;
//
//import java.io.IOException;
//import java.io.OutputStream;
//import java.sql.Blob;
//import java.sql.SQLException;
//import java.util.List;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//
//import com.ispan.team6.dto.RestaurantDto;
//import com.ispan.team6.dto.RestaurantTypeDto;
//import com.ispan.team6.entity.Restaurant;
//import com.ispan.team6.entity.RestaurantType;
//import com.ispan.team6.entity.Users;
//import com.ispan.team6.service.RestaurantService;
//import com.ispan.team6.service.UsersService;
//
//@Controller
//public class RestaurantBackController {
//
//	@Autowired
//	private RestaurantService rService;
//
//	@Autowired
//	private UsersService uService;
//
//	@PostMapping(value = "restaurant/api/editRestaurantPageByAdmin", consumes = {
//			"application/json; charset=UTF-8" }, produces = { "application/json; charset=UTF-8" })
//	@ResponseBody
//	public Restaurant editRestaurantPageByAdminApi(@RequestBody Restaurant rest, RestaurantType restType, Users users) {
//		RestaurantType rType = rService.findTypeById(restType.getId());
//		Users u = uService.findAccountById(users.getId());
//		rest.setRestaurantType(rType);
//		rest.setUsers(u);
//		Restaurant r = rService.insertRestaurant2(rest);
//
//		return r;
//	}
//
//	@GetMapping("restaurant/api/viewRestaurantBackPage")
//	@ResponseBody
//	public List<Restaurant> viewRestaurantBackPage(@RequestBody Restaurant rest, HttpServletResponse response){
//		List<Restaurant> list = rService.findAllRestuarant();
//		System.out.println("rService.findById(id)====>" + rService.findById(rest.getId()));
//		Restaurant r = rService.findById(rest.getId());
//
//		int len = 0;
//		try {
//			len = (int) r.getPhoto().length();
//			byte[] bytes = r.getPhoto().getBytes(1, len);
//			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
//			OutputStream out = response.getOutputStream();
//			if (bytes != null) {
//				out.write(bytes);
//				out.flush();
//			}
//			out.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
//
////	@GetMapping("restBack/downloadImage/{id}")
////	public ResponseEntity<Blob> downloadImage(@PathVariable Integer id, MultipartFile file) {
////		Restaurant photo1 = rService.findById(id);
////		Blob photoFile = photo1.getPhoto();
////
////		HttpHeaders header = new HttpHeaders();
////		header.setContentType(MediaType.IMAGE_JPEG);
////
////		// 要回傳的物件本體, header, HttpStatus 回應
////		return new ResponseEntity<Blob>(photoFile, header, HttpStatus.OK);
////	}
//
//}
