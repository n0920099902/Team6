package com.ispan.team6.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

public interface UsersDao extends JpaRepository<Users, Integer>{
	

	public Users findByAccountAndPassword(String account, String password);
	
	public Optional<Users> findById(String requestID);
}
