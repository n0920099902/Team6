package com.ispan.team6.model;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface  MemberDao extends JpaRepository <Users, Integer> {
	


	public Users findById(int id);

	@Query(value = "select * from Users where account like (%:search%)", nativeQuery = true)
	List<Users> queryLikeByName(String search);

	
}