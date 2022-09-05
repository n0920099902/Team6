package com.ispan.team6.service;

import java.util.ArrayList;
import java.util.Date;
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
		cDao.deleteByCmtId(id);
	}

	public List<CommentDto> findCommentByRest(Integer id) {
		List<CommentDto> commentResult = new ArrayList<CommentDto>();
		List<Orders> ol = oDao.findOrdersByRestId(id);
		List<Comment> cl = new ArrayList<Comment>();//容器
		List<Comment> c = cDao.findAll();
		
		for (int i = 0; i < c.size(); i++) {
			for (int y = 0; y < ol.size(); y++) {
				if (c.get(i).getOrders().getId() == ol.get(y).getId()) {
					cl.add(c.get(i));
				}
			}
		}
		for (int i = 0; i < cl.size(); i++) {
			CommentDto cdto = new CommentDto();
			cdto.setAccountName(cl.get(i).getUsers().getAccount());
			cdto.setTime(cl.get(i).getTime());
			cdto.setComments(cl.get(i).getComments());
			cdto.setScore(cl.get(i).getScore());
			commentResult.add(cdto);
		}
		return commentResult;
	}

	public Comment findCommentByOrder(Integer id) {

		Orders order = oService.findById(id);

		Comment comment = order.getComment();

		return comment;
	}

	public void updateComment(Comment cmt) {
		Comment cmt1 = findById(cmt.getId());

		cmt1.setComments(cmt.getComments());
		Date date=new Date();
		cmt1.setTime(date);

		cDao.save(cmt1);
	}
	
//	public Set<Comment> findCommentsByUser(Integer id) {
//
//		Users user = uService.findById(id);
//		
//		Set<Comment> comments = user.getComment();
//		
//		return comments;
//	}
}
