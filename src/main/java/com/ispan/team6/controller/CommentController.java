package com.ispan.team6.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.team6.entity.Comment;
import com.ispan.team6.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService cService;

	@GetMapping("/comment/add")
	public String addCommentPage(Model m) {
		
		Comment newCmt = new Comment();
		
		Comment latestCmt = cService.lastestComment();
		
		m.addAttribute("comment", newCmt);
		m.addAttribute("latestCmt", latestCmt);
		
		return "addComment";
	}
	
	@PostMapping("/postComment")
	public String postComment(@ModelAttribute Comment cmt,Model m) {
		cService.insertComment(cmt);
		
		Comment newCmt = new Comment();
		Comment latestCmt = cService.lastestComment();
		
		m.addAttribute("comment", newCmt);
		m.addAttribute("latestCmt", latestCmt);
		
		return "addComment"; 
	}
	
	@GetMapping("/comment/latest")
	@ResponseBody
	public Comment findLastest() {
		return cService.lastestComment();
	}
	
	@GetMapping("/comment/viewComment")
	public String viewComment(@RequestParam(name="p",defaultValue = "1") Integer pageNumber, Model m) {
		Page<Comment> page = cService.findByPage(pageNumber);
		
		m.addAttribute("page", page);
		return "viewComment";
	}
	
	@GetMapping("/comment/editComment/{id}")   
	public String editCommentPage(@PathVariable Integer id, Model m) {
		Comment cmt = cService.findById(id);
		
		m.addAttribute("comment", cmt);
		
		return "editComment";
	}
	
	@PostMapping("/comment/editComment")
	public String editCommentPost(@ModelAttribute Comment cmt) {
		cService.insertComment(cmt);
		
		return "redirect:/comment/viewComment";
	}
	
	@GetMapping("/comment/deleteComment/{id}")
	public String deleteComment(@PathVariable Integer id) {
		cService.deleteComment(id);
		return "redirect:/comment/viewComment";
	}
	
	
}
