package com.ispan.team6.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Dish;
import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.OrdersDetail;
import com.ispan.team6.model.DishDAO;
import com.ispan.team6.model.OrdersDao;

@Service
@Transactional
public class OrdersService {

	@Autowired
	private OrdersDao ordersDao;
	@Autowired
	private DishDAO dishDAO;

	public List<Orders> findAllOrder() {
		return ordersDao.findAll();
	}

	public List<OrdersDetail> findAllDishByOrderId() {
		return null;

	}

	public void deleteOrder(Integer id) {
		ordersDao.deleteById(id);
	}

	public Orders findById(Integer Id) {
		Optional<Orders> optional = ordersDao.findById(Id);

		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	//session訂單圖片
	public Dish findOrderImgbyId(Integer id) {
		Optional<Dish> optional = dishDAO.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	

//	public DishDTO DishesByOrder(Integer Id) {
//		Optional<Dish> dishes = dishDAO.findById(Id);
//		List<DishDTO> result = new ArrayList<>();
//		for (Dish d : dishes) {
//			DishDTO dto = new DishDTO();
//			dto.setRestName(d.getRest().getName());
//			dto.setDishName(d.getDishName());
//			dto.setDishCategory(String.valueOf(d.getDishType().getCategory()));
//			dto.setDishPrice(String.valueOf(d.getDishPrice()));
//			dto.setDishPhoto(d.getDishPhoto());
//			dto.setDishStatus(d.getDishStatus());
//			dto.setRestId(String.valueOf(d.getRest().getId()));
//
//			result.add(dto);
//		}
//
//		return result;
//	}

}
