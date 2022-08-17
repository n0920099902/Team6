package com.ispan.team6.model;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.Comment;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	
	public Comment findFirstByOrderByTimeDesc();
}
