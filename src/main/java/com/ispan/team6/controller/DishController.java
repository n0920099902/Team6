package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Dish;
import com.ispan.team6.service.DishService;

@RestController
public class DishController {

	@Autowired
	private DishService service;
<<<<<<< HEAD

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

	@GetMapping("/dish/Add/{id}/{name}")
	public String listAllDishes(@PathVariable("id") int id, @PathVariable("name") String name, Model m) {
		List<DishType> l = service.findAllDishType();
		m.addAttribute("dishType", l);
		return "AddDis";
	}

	@PostMapping("dish/go")
	public String Sign(@RequestParam("rID") int id, @RequestParam("rName") String name,
			@RequestParam("dName") String dName, @RequestParam("dPrice") int dPrice, @RequestParam("dishType") int cat,
			@RequestParam("dS") String status, @RequestParam("Img") MultipartFile file, Model m) throws IOException {
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

//	@GetMapping("/buyList/{rid}/{id}")
//	public String addBuy(@PathVariable int rid, @PathVariable int id, Model m, @RequestParam("quantity") int quantity) {
//		Dish d = dao.findById(id);
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
//	
//	@PostMapping("/buyList.controller")
//	@ResponseStatus(value = HttpStatus.OK)
//	public void addBuy(@RequestParam("id") int id, Model m, @RequestParam("quantity") int quantity) {
//		Dish d = dao.findById(id);
//		List<Dish> buyList = (List<Dish>) m.getAttribute("buy");
//		for (int i = 0; i < quantity; i++) {
//			buyList.add(d);
//		}
//
//	}

	@GetMapping("/goCart.controller")
	public String goCart(Model m) {
		List<Dish> buyList = (List<Dish>) m.getAttribute("buy");
		return "bL";
=======
	
	@PostMapping("/dish")
	public Dish insert(@RequestBody DishDTO dishDto) { 
		Dish respDish = service.insertDish(dishDto);
		return respDish;
>>>>>>> Dish2
	}
	
	@GetMapping("/dish")
	public List<DishDTO> listAllDishes(@RequestParam(value="restId", required=false) Integer restId, @RequestParam(value="showMode", required=false) String mode) {
		List<DishDTO> dishes = service.listAllDishes(mode, restId);
		
		return dishes;
	}
	
	@DeleteMapping("/dish/{id}")
	public void delete(@PathVariable String id) {
		service.deleteDish(id);
	}
	
	@PutMapping("/dish")
	public void update(@RequestBody DishDTO dishDto) {
		service.editDish(dishDto);
	}
	
}
