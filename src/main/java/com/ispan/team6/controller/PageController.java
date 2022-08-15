package com.ispan.team6.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ispan.team6.model.Users;

@Controller
public class PageController {
	
	@GetMapping("/")
	public String welcomeIndex() {
		return "index";
	}
	
	@GetMapping("/member/view")
	public String memberaddPage(Model m) {
		
		Users newMember = new Users();
		m.addAttribute("member", newMember);
		
		return "memberadd";
	}
	@GetMapping("/Users/navbar")
	public String memberaddPage2(Model m) {
		return "ADD";
	}
//	@GetMapping("/search")
//	public String SearchPage() {
//		return "Search";
//	}
	
	
}
