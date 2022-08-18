package com.ispan.team6.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.Users;

public interface UsersDao extends JpaRepository<Users, Integer>{
	

	public Users findByAccountAndPassword(String account, String password);
	
}
