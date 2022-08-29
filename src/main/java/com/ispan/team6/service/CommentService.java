package com.ispan.team6.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ispan.team6.dto.CommentDto;
import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.CommentDao;
import com.ispan.team6.model.OrdersDao;
import com.ispan.team6.model.UsersDao;

@Service
@Transactional
public class CommentService {

	@Autowired
	private CommentDao cDao;

	@Autowired
	private UsersDao uDao;

	@Autowired
	private UsersService uService;

	@Autowired
	private RestaurantService rService;

	@Autowired
	private OrdersService oService;
	
	@Autowired
	private OrdersDao oDao;

	public Boolean validateUserInfo(Integer id) {
		Users currentUser = uService.findById(id);

		if (currentUser == null) {
			return false;
		}
		return true;
	}

	// 新增
	public void insertComment(Comment cmt) {
		cDao.save(cmt);
	}

	public Comment lastestComment() {
		return cDao.findFirstByOrderByTimeDesc();
	}

	public Page<Comment> findByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 5, Sort.Direction.DESC, "time");
		Page<Comment> page = cDao.findAll(pgb);
		return page;
	}

	public Comment findById(Integer id) {
		Optional<Comment> optional = cDao.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public void deleteComment(Integer id) {
		cDao.deleteById(id);
	}

	public List<CommentDto> findCommentByRest(Integer id) {

		Restaurant r = rService.findById(id);
//		Set<Orders> orders = r.getOrders();
		
		List<Orders> orders= oDao.findOrdersByRestid(id);
		
		List<Comment> comments=  new ArrayList<>();;
		for(int i=0;i<orders.size();i++) {
			Comment c= cDao.findCommentByOrderId(orders.get(i).getId());
			comments.add(c);
		}
	
		
		
		List<CommentDto> result = new ArrayList<>();
		for(int i=0;i<comments.size();i++) {
			CommentDto dto = new CommentDto();
			Users users=comments.get(i).getUsers();
			
			dto.setAccountName(users.getAccount());
			dto.setId(comments.get(i).getId());
			dto.setComments(comments.get(i).getComments());
			dto.setTime(comments.get(i).getTime());
			result.add(dto);
			
		}

//		for (Orders i : orders) {
//			Comment cmt = i.getComment();
//
//			CommentDto dto = new CommentDto();
//			dto.setAccountName(i.getUsers().getAccount());
//			dto.setId(cmt.getId());
//			dto.setComments(cmt.getComments());
//			dto.setTime(cmt.getTime());
//
//			result.add(dto);
//
//		}
		return result;
	}

	public Comment findCommentByOrder(Integer id) {

		Orders order = oService.findById(id);

		Comment comment = order.getComment();

		return comment;
	}

	public void updateComment(Comment cmt) {
		Comment cmt1 = findById(cmt.getId());

		cmt1.setComments(cmt.getComments());

		cDao.save(cmt1);
	}
}
