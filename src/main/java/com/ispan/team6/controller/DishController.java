package com.ispan.team6.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.DishType;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.model.DishDAO;
import com.ispan.team6.service.DishService;

@RestController
public class DishController {

	@Autowired
	private DishDAO dao;

	@Autowired
	private DishService service;

//	@PostMapping("/dish")
//	public Dish insert(@RequestBody DishDTO dishDto) { 
//		Dish respDish = service.insertDish(dishDto);
//		return respDish;
//	}
//	
//	@GetMapping("/dish")
//	public List<DishDTO> listAllDishes() {
//		List<DishDTO> dishes = service.listAllDishes();
//		return dishes;
//	}
//}

	
	//以下先做給order測試用
	@GetMapping("/dish/Add")
	public String listAllDishes(@RequestParam Integer id, @RequestParam String name, Model m) {
		List<DishType> l = service.findAllDishType();
		m.addAttribute("dishType", l);
		m.addAttribute("id", id);
		m.addAttribute("name", name);
		return "AddDis";
	}

	@PostMapping("dish/go")
	public String Sign(@RequestParam("rID") Integer id, @RequestParam("rName") String name,
			@RequestParam("dName") String dName, @RequestParam("dPrice") Integer dPrice,
			@RequestParam("dishType") Integer cat, @RequestParam("dS") String status,
			@RequestParam("Img") MultipartFile file, Model m) throws IOException {
		byte[] bytes = file.getBytes();
		Dish d = new Dish();
		Restaurant r = new Restaurant();
		DishType dt = new DishType();
		dt.setId(cat);
		r.setId(id);
		r.setName(name);
		d.setRest(r);
		d.setDishName(dName);
		d.setDishPrice(dPrice);
		d.setDishType(dt);
		d.setDishPhoto(bytes);
		d.setDishStatus(status);

		Dish resDish = dao.save(d);

		if (resDish == null) {
			m.addAttribute("message", "新增失敗");
		}
		m.addAttribute("message", "新增成功");
		return "AddDis";
	}

	@GetMapping("/dish/downloadImage/{id}")
	public ResponseEntity<byte[]> downloadImage(@PathVariable int id) {
		Dish dish = dao.findById(id);
		byte[] photoFile = dish.getDishPhoto();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		// 要回傳的物件本體, header, HttpStatus 回應
		return new ResponseEntity<byte[]>(photoFile, header, HttpStatus.OK);
	}

}
