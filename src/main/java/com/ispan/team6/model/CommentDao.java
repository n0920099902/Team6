package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Restaurant;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	
	public Comment findFirstByOrderByTimeDesc();
	
}
