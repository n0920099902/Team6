package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.Orders;

public interface OrdersDao extends JpaRepository<Orders, Integer> {

}
