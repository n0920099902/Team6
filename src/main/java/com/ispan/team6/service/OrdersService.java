package com.ispan.team6.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.OrdersDetail;
import com.ispan.team6.model.OrdersDao;

@Service
@Transactional
public class OrdersService {
	
	@Autowired
	private OrdersDao ordersDao;
	
	
	
	public List<Orders> findAllOrder(){
		return ordersDao.findAll();
	}
	public List<OrdersDetail> findAllDishByOrderId(){
		return null;
		
	}
	
	public void deleteOrder(Integer id) {
		ordersDao.deleteById(id);
	}
	
	

}
