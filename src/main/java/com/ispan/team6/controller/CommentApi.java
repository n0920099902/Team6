package com.ispan.team6.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.dto.CommentDto;
import com.ispan.team6.entity.Comment;
import com.ispan.team6.service.CommentService;
import com.ispan.team6.service.RestaurantService;

@RestController
public class CommentApi {

	@Autowired
	private CommentService cService;
	
	@Autowired
	private RestaurantService rService;
	
	@GetMapping("/comment")
	public List<CommentDto> listAllComment(@RequestParam(value="restId", required=false) Integer restId) {
		List<CommentDto> cmt = cService.findCommentByRest(restId);
//		List <String> commentList = new ArrayList<>();
//		for (Comment comment : cService.findCommentByRest(restId)) {
//			commentList.add(comment.getComments());
//		}
//		
		return cmt;
	}
}
