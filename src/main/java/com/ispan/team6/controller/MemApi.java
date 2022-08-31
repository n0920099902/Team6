package com.ispan.team6.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.team6.entity.Users;
import com.ispan.team6.model.MemberDao;

@RestController
public class MemApi {
	@Autowired
	private MemberDao mDao;

	@GetMapping("member/get/{account}")
	public boolean getMemberById(@PathVariable String account) {
		try {
			List<Users> memberList = mDao.findByAccount(account);	
			//判斷帳號有沒有撈到如果有資料會拿到fasle
			boolean empty = memberList.isEmpty();	
			//因為帳號判斷是不是空值有點難理解所以反向判斷，範例:帳號在資料庫有的話會給true
			return !empty;
		} catch (Exception e) {
			return false;
		}		
	}
	

	

}
	


