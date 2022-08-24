package com.ispan.team6.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.team6.entity.Users;

public interface  MemberDao extends JpaRepository <Users, Integer> {
	


	public Users findById(int id);
	

	@Query(value = "select * from Users where account like (%:search%)", nativeQuery = true)
	List<Users> queryLikeByName(String search);

	public void save(Integer id);


	public List<Users> findByAccount(String account);

	
}
