package com.ispan.team6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.service.CommentService;

@RestController
public class CommentApi {

	@Autowired
	private CommentService cService;
	
	
}
