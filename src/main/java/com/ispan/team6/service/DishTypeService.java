package com.ispan.team6.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.dto.DishTypeDTO;
import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.DishType;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.model.DishTypeDAO;

@Service
@Transactional
public class DishTypeService {

	@Autowired
	private DishTypeDAO dishTypeDAO;

	// 新增一筆
	public DishType insertDishType(DishTypeDTO dishTypeDto) {
		DishType dishType = new DishType();
		dishType.setCategory(dishTypeDto.getDishTypeCategory());
		Restaurant restaurant = new Restaurant();
		restaurant.setId(Integer.valueOf(dishTypeDto.getRestId()));
		dishType.setRest(restaurant);
		return dishTypeDAO.save(dishType);
	}

	// 列出全部商品分類
		public List<DishTypeDTO> listAllDishCategories(Integer restId) {
			List<DishType> categories = dishTypeDAO.findAllByRestId(restId);
			
			List<DishTypeDTO> result = new ArrayList<>();
			for (DishType c : categories) {
				DishTypeDTO dto = new DishTypeDTO();
				dto.setRestName(c.getRest().getName());
				dto.setDishTypeCategory(c.getCategory());
				dto.setDishTypeId(String.valueOf(c.getId()));
				dto.setRestId(String.valueOf(c.getRest().getId()));

				result.add(dto);
			}
			return result;
		}
		
		public DishTypeDTO deleteDishType(String id) {
			DishTypeDTO result = new DishTypeDTO();
			
			Optional<DishType> optionalDishType = dishTypeDAO.findById(Integer.valueOf(id));
			if (optionalDishType.isPresent()) {
				DishType dishType = optionalDishType.get();
				List<Dish> dishes = dishType.getDishes();
				if (dishes.size() > 0) {
					for (Dish d:dishes) {
						if (d.getDishStatus().equals("已上架")) {
							result.setResult("商品已上架");
							return result;
						}
					}
				}
				
				dishTypeDAO.deleteById(Integer.parseInt(id));
				result.setResult("done");
			}
			return result;
		}
		
		public void editDishType(DishTypeDTO dishTypeDto) {
			Optional<DishType> optionalDishType = dishTypeDAO.findById(Integer.parseInt(dishTypeDto.getDishTypeId()));
			
			if (optionalDishType.isPresent()) {
				DishType dishType = optionalDishType.get();
				dishType.setCategory(dishTypeDto.getDishTypeCategory());
				dishTypeDAO.save(dishType);
			}
		}
}