package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.Restaurant;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	
	public Comment findFirstByOrderByTimeDesc();
	
	@Query(value = "select * from Comment where fk_order_id =:id", nativeQuery = true)
	public Comment findCommentByOrderId(int id);
}
