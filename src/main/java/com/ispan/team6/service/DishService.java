package com.ispan.team6.service;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.DishType;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.model.DishDAO;

@Service
@Transactional
public class DishService {

	@Autowired
	private DishDAO dishDAO;

	// 新增一筆
	public Dish insertDish(DishDTO dishDto) {
		Dish dish = new Dish();
		dish.setDishName(dishDto.getDishName());
		Blob b = null;
		try {
			b = new SerialBlob(dishDto.getDishPhoto());
		} catch (SerialException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dish.setDishPhoto(b);
		dish.setDishPrice(Integer.parseInt(dishDto.getDishPrice()));
		dish.setDishStatus(dishDto.getDishStatus());
		DishType dishType = new DishType();
		dishType.setId(Integer.parseInt(dishDto.getDishCategory()));
		dish.setDishType(dishType);
		Restaurant restaurant = new Restaurant();
		restaurant.setId(Integer.parseInt(dishDto.getRestId()));
		dish.setRest(restaurant);
		return dishDAO.save(dish);
	}

	// 列出全部商品
	public List<DishDTO> listAllDishes(String mode, Integer restId, Integer categoryId, String keyword) {
		List<Dish> dishes = null;
		if ("portal".equals(mode)) {
			if (categoryId == null) {
				dishes = dishDAO.findAllByRestIdAndDishStatusIsPublished(restId);
			} else {
				dishes = dishDAO.findAllByRestIdAndDishStatusIsPublishedAndCategory(restId, categoryId);
			}
		} else if ("backend".equals(mode)) {
			if (keyword == null) {
				dishes = dishDAO.findAllByRestId(restId);
			} else {
				
				dishes = dishDAO.findAllByRestIdAndKeywordLike(restId, "%" + keyword + "%");
			}
		} else {
			dishes = dishDAO.findAll();
		}
		List<DishDTO> result = new ArrayList<>();
		for (Dish d : dishes) {
			DishDTO dto = new DishDTO();
			dto.setDishId(String.valueOf(d.getId()));
			dto.setRestName(d.getRest().getName());
			dto.setDishName(d.getDishName());
			dto.setDishCategory(String.valueOf(d.getDishType().getCategory()));
			dto.setDishCategoryId(String.valueOf(d.getDishType().getId()));
			dto.setDishPrice(String.valueOf(d.getDishPrice()));
			int blobLength = 0;
			byte[] blobAsBytes = null;
			try {
				blobLength = (int) d.getDishPhoto().length();
				blobAsBytes = d.getDishPhoto().getBytes(1, blobLength);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dto.setDishPhoto(blobAsBytes);
			dto.setDishStatus(d.getDishStatus());
			dto.setRestId(String.valueOf(d.getRest().getId()));

			result.add(dto);
		}
		return result;
	}
	
	//刪除一筆資料
	public void deleteDish(String id) {
		dishDAO.deleteById(Integer.parseInt(id));
	}
	
	//修改一筆資料
	public void editDish(DishDTO dishDto) {
		Optional<Dish> optionalDish = dishDAO.findById(Integer.parseInt(dishDto.getDishId()));
		
		if (optionalDish.isPresent()) {
			Dish dish = optionalDish.get();
			dish.setDishName(dishDto.getDishName());
			Blob b = null;
			try {
				b = new SerialBlob(dishDto.getDishPhoto());
			} catch (SerialException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dish.setDishPhoto(b);
			dish.setDishPrice(Integer.parseInt(dishDto.getDishPrice()));
			dish.setDishStatus(dishDto.getDishStatus());
			DishType dishType = new DishType();
			dishType.setId(Integer.parseInt(dishDto.getDishCategory()));
			dish.setDishType(dishType);
			dishDAO.save(dish);
		}

	}

}