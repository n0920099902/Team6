package com.ispan.team6.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Users;
import com.ispan.team6.service.CommentService;
import com.ispan.team6.service.OrdersService;
import com.ispan.team6.service.UsersService;

@Controller
public class CommentController {

	@Autowired
	private CommentService cService;

	@Autowired
	private UsersService uService;
	
	@Autowired
	private OrdersService oService;

	@GetMapping("/comment/add")
	public String addCommentPage(HttpSession httpSession, Model m) {

		Comment newCmt = new Comment();
		
		Comment latestCmt = cService.lastestComment();

		m.addAttribute("comment", newCmt);
		m.addAttribute("latestCmt", latestCmt);

		return "addComment";
	}

	@PostMapping("/postComment")
	public String postComment(@ModelAttribute Comment cmt, HttpSession httpSession, Model m, Integer orderId) {

		// 取當前登入者
		Users u = (Users) httpSession.getAttribute("member");

//		orderId = 3;
		// 確認DB是否有該會員
		Users currentUser = uService.findById(u.getId());

		// 沒有的話需要先登入	
		if (currentUser != null) {
			
//			Orders currenOrder = oService.findById(orderId);
			
//			cmt.setOrders(currenOrder);
			cmt.setUsers(currentUser);

			cService.insertComment(cmt);

			Comment newCmt = new Comment();
			Comment latestCmt = cService.lastestComment();

			m.addAttribute("comment", newCmt);
			m.addAttribute("latestCmt", latestCmt);

			return "addComment";
		}
		return "redirect:/member/login";
	}

	@GetMapping("/comment/latest")
	@ResponseBody
	public Comment findLastest() {
		return cService.lastestComment();
	}

	@GetMapping("/comment/viewComment/{id}")
	public String viewComment(@PathVariable("id") Integer id, Model m) {
		
		Comment cmt = cService.findCommentByOrder(id);

		List <Comment> cmt1 = new ArrayList<>();
		cmt1.add(cmt);
		m.addAttribute("comment", cmt1);
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
		var id = cmt.getId();
		return "redirect:/comment/viewComment2/" + id ;
	}

	@GetMapping("/comment/deleteComment/{id}")
	public String deleteComment(@PathVariable Integer id) {
		cService.deleteComment(id);
		return "redirect:/getUsersOrder";
	}
	
	@GetMapping("/comment/viewComment2/{id}")
	public String viewComment2(@PathVariable("id") Integer id, Model m) {
		
		Comment cmt = cService.findById(id);

		List <Comment> cmt1 = new ArrayList<>();
		cmt1.add(cmt);
		m.addAttribute("comment", cmt1);
		return "viewComment";
	}

}
