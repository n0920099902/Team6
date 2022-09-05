package com.ispan.team6.model;

import java.util.List;

import javax.persistence.Transient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Comment;
import com.ispan.team6.entity.Users;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	
	public Comment findFirstByOrderByTimeDesc();
	
	@Query(value = "select * from Comment where fk_order_id =:id", nativeQuery = true)
	public Comment findCommentByOrderId(int id);
	
	@Query(value = "select * from Comment where fk_users_id =:id", nativeQuery = true)
	public List<Comment> findCommentByUserId(int id);
	
//	public Users findByUsers(Integer id);
	
	@Transient
	@Modifying
	@Query(value = "delete from Comment where id =:id", nativeQuery = true)
	public void deleteByCmtId(int id);
}
