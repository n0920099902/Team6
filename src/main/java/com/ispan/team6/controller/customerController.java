package com.ispan.team6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class customerController {
	
	@GetMapping("/restaurant/customer")
	public String processToCustomer() {
		return "customer";
	}  
	

}
