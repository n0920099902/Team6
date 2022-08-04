package com.ispan.springbootdemo_teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	
	@GetMapping("/")
	public String welcomeIndex() {
		return "index";
	}
	
	@GetMapping("/about")
	public String aboutPage() {
		return "about";
	}
	
	@GetMapping("/message/ajax")
	public String ajaxVersionPage() {
		return "ajaxMessage";
	}
	
	@GetMapping("/uploadPage")
	public String uploadPage() {
		return "goodphoto/uploadPage";
	}

}
