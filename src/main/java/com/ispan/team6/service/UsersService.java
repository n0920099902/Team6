package com.ispan.team6.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.team6.entity.Users;
import com.ispan.team6.model.UsersDao;

@Service
@Transactional
public class UsersService {

	@Autowired
	private UsersDao uDao;

	public Users findById(Integer Id) {
		Optional<Users> optional = uDao.findById(Id);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public Users findByAccount(String account) {
		Optional<Users> optional = uDao.findByAccount(account);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public void insertUser(Users u) {
		uDao.save(u);
	}

	public Users findPasswordById(Integer id) {
		return uDao.findPasswordById(id);
	}
}
