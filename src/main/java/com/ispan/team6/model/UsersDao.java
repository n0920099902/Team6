package com.ispan.team6.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.team6.entity.Users;

public interface UsersDao extends JpaRepository<Users, Integer> {

	public Users findByAccountAndPassword(String account, String password);

	public Optional<Users> findByAccount(String account);

	public Users findPasswordById(Integer id);

	public Optional<Users> findAccountById(Integer id);
	
	public Optional<Users> findUsersById(Integer id);
	
	public Users findByEmail(String email);

}
