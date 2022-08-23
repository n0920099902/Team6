package com.ispan.team6.controller;

import javax.servlet.http.HttpSession;

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
import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.Restaurant;
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
			
			Orders currenOrder = oService.findById(orderId);
			
			cmt.setOrders(currenOrder);
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

	@GetMapping("/comment/viewComment")
	public String viewComment(@RequestParam(name = "p", defaultValue = "1") Integer pageNumber, Model m) {
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
