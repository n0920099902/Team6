package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.dto.DishDTO;
import com.ispan.team6.entity.Comment;
import com.ispan.team6.service.CommentService;

@RestController
public class CommentApi {

	@Autowired
	private CommentService cService;
	
	@GetMapping("/comment")
	public List<Comment> listAllComment(@RequestParam(value="restId", required=false) Integer restId, @RequestParam(value="showMode", required=false) String mode) {
		List<Comment> cmt = cService.findCommentByRest(restId);
		
		return cmt;
	}
}
