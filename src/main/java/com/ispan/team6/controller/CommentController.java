package com.ispan.team6.controller;

import java.util.ArrayList;
import java.util.Date;
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

import com.ispan.team6.dto.AddCommentDto;
import com.ispan.team6.dto.CommentDto;
import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.CommentDao;
import com.ispan.team6.model.OrdersDao;
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

	@Autowired
	private OrdersDao oDao;

	@Autowired
	private CommentDao cDao;

	@GetMapping("/comment/add/{id}")
	public String addCommentPage(@PathVariable("id") Integer id, Model m) {

		Comment newCmt = new Comment();
		AddCommentDto cDto = new AddCommentDto();
		m.addAttribute("addCommentDto", cDto);
		m.addAttribute("orderId", id);

		return "addComment";
	}

	@PostMapping("/postComment")
	public String postComment(@ModelAttribute AddCommentDto cmt, HttpSession httpSession, Model m, Integer orderId,
			Integer score) {
		System.out.println("asasasasasasas" + orderId);
		// 取當前登入者
		Users u = (Users) httpSession.getAttribute("member");

//		orderId = 3;
		// 確認DB是否有該會員
		Users currentUser = uService.findById(u.getId());

		// 沒有的話需要先登入
		if (currentUser != null) {
//			System.out.println("dasdasdasda"+cmt.getOrderId());
//			Orders currentOrder = oService.findById(cmt.getOrderId());
			Orders currentOrder = oService.findById(orderId);

			Comment cmt1 = new Comment();
			cmt1.setScore(score);
			cmt1.setOrders(currentOrder);
			cmt1.setUsers(currentUser);
			cmt1.setComments(cmt.getComments());
//			cmt1.setTime();

			cService.insertComment(cmt1);

			return "redirect:/comment/viewComment/" + orderId;
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

		if (cmt != null) {
			m.addAttribute("comment", cmt);
		} else {
			m.addAttribute("message", "尚無評論");
			m.addAttribute("orderId", id);

		}
		return "viewComment";
	}

	@GetMapping("/comment/editComment/{id}")
	public String editCommentPage(@PathVariable Integer id, Model m) {
		Comment cmt = cService.findById(id);

		m.addAttribute("comment", cmt);

		return "editComment";
	}

//	@PostMapping("/comment/editComment")
//	public String editCommentPost(@ModelAttribute Comment cmt) {
//	
//		cService.updateComment(cmt);
//		Integer id = cmt.getId();
//		return "redirect:/comment/viewComment2/" + id ;
//	}
//	

	@PostMapping("/comment/editComment")
	public String editCommentPost(@RequestParam("id") Integer id, @RequestParam("comments") String comments) {

		Comment c = cService.findById(id);
		c.setComments(comments);
		c.setTime(new Date());
		cService.updateComment(c);

		return "redirect:/comment/viewComment/" + c.getOrders().getId();
	}

	@GetMapping("/comment/deleteComment/{commentId}")
	public String deleteComment(@PathVariable Integer commentId, Model m) {
		Comment c = cService.findById(commentId);
		cService.deleteComment(commentId);
		return "redirect:/comment/viewComment/" + c.getOrders().getId();
	}

	@GetMapping("/comment/viewComment2/{id}")
	public String viewComment2(@PathVariable("id") Integer id, Model m) {

		Comment cmt = cService.findById(id);

		List<Comment> cmt1 = new ArrayList<>();
		cmt1.add(cmt);
		m.addAttribute("comment", cmt1);
		return "viewComment";
	}

	@GetMapping("/restaurant/{id}/comment")
	public String commentPage(@PathVariable("id") Integer id, Model model) {

		List<CommentDto> commentResult = new ArrayList<CommentDto>();
		List<Orders> ol = oDao.findOrdersByRestId(id);
		List<Comment> cl = new ArrayList<Comment>();//容器
		List<Comment> c = cDao.findAll();
		

		
//		List<Comment> cn = new ArrayList<Comment>();
//		
//		for(int i=0;i<ol.size();i++) {
//			Comment c3 = cDao.findByOrders(ol.get(i));
//            if(c3!=null) {
//            	cn.add(c3);
//            }
//		}
		
		for (int i = 0; i < c.size(); i++) {
			for (int y = 0; y < ol.size(); y++) {
				if (c.get(i).getOrders().getId() == ol.get(y).getId()) {
					cl.add(c.get(i));
				}
			}
		}
		
		
//		for (int i = 0; i < cn.size(); i++) {
//			CommentDto cdto = new CommentDto();
//			cdto.setAccountName(cn.get(i).getUsers().getAccount());
//			cdto.setTime(cn.get(i).getTime());
//			cdto.setComments(cn.get(i).getComments());
//			cdto.setScore(cn.get(i).getScore());
//			commentResult.add(cdto);
//		}
		
		for (int i = 0; i < cl.size(); i++) {
			CommentDto cdto = new CommentDto();
			cdto.setAccountName(cl.get(i).getUsers().getAccount());
			cdto.setTime(cl.get(i).getTime());
			cdto.setComments(cl.get(i).getComments());
			cdto.setScore(cl.get(i).getScore());
			commentResult.add(cdto);
		}

		model.addAttribute("comment", commentResult);
		model.addAttribute("rid", id);

		return "NewComment";
	}

}
