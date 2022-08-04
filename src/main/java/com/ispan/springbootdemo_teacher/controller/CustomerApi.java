package com.ispan.springbootdemo_teacher.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.springbootdemo_teacher.model.Customer;
import com.ispan.springbootdemo_teacher.model.CustomerRepository;

@RestController
public class CustomerApi {
	
	@Autowired
	private CustomerRepository dao;
	
	@PostMapping("customer/insert")
	public Customer insert() {
		Customer cus1 = new Customer();
		cus1.setName("館長");
		cus1.setLevel(5);
		Customer respCustomer = dao.save(cus1);
		return respCustomer;
	}
	
	@PostMapping("customer/insert2")
	public Customer insert2(@RequestBody Customer cus) {
		Customer respCustomer = dao.save(cus);
		return respCustomer;
	}
	
	@PostMapping("customer/insert3")
	public List<Customer> insert3(@RequestBody List<Customer> cus ){
		return dao.saveAll(cus);
	}
	
	@GetMapping("customer/get/{id}")
	public Customer getCustomerById(@PathVariable Long id) {
		Optional<Customer> optional = dao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	
	// RequestParam 版本，請求參數
	@GetMapping("customer/get")
	public Customer getCustomerById2(@RequestParam Long id) {
		Optional<Customer> optional = dao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	
	@GetMapping("customer/page/{pageNumber}")
	public List<Customer> findByPage(@PathVariable Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 2,Sort.Direction.ASC, "id");
		Page<Customer> page = dao.findAll(pgb);
		List<Customer> list = page.getContent();
		return list;
	}
	
	@GetMapping("customer/findByName")
	public List<Customer> findByName(@RequestParam String name){
		return dao.findCustomerByName(name);
	}
	
	@GetMapping("customer/findByName2")
	public List<Customer> findByName2(@RequestParam String name){
		return dao.findCustomerByName2(name);
	}
	
	@PostMapping("customer/deleteByName")
	public boolean deleteByName(@RequestParam String name) {
		dao.deleteByName(name);
		return true;
	}
	
	@GetMapping("customer/findByLevel")
	public List<Customer> findByLevel(@RequestParam Integer level){
		return dao.findByLevelOrderByName(level);
	}
	
	@GetMapping("customer/findByLevelGreaterThan")
	public List<Customer> findByLevelGreaterThan(@RequestParam Integer level){
		return dao.findByLevelGreaterThan(level);
	}
	

}
