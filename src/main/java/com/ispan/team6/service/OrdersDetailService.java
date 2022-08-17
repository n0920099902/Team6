package com.ispan.team6.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.model.OrdersDetail;
import com.ispan.team6.model.OrdersDetailDao;

@Transactional
@Service
public class OrdersDetailService {
	

	
	@Autowired
	private OrdersDetailDao ordersDetailDao;

	
	public void orderFood(OrdersDetail ordersDetail ) {
		ordersDetailDao.save(ordersDetail);
		}
	
	public OrdersDetail findById(Integer Id) {
		Optional<OrdersDetail> optional = ordersDetailDao.findById(Id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}
}
