package com.ispan.team6.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.team6.model.Users;
import com.ispan.team6.model.MemberDao;


@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberDao mDao;
	
	public void insertMember(Users u) {
		mDao.save(u);
}
		
		public List<Users> findAllMembers(){
			return  mDao.findAll();
		}

		public void deleteMember(Integer id) {
			mDao.deleteById(id);
		}
		
		public Users UpdateById(Integer id) {
			Optional<Users> optional = mDao.findById(id);
			
			if(optional.isPresent()) {
				return optional.get();
			}
			
			return null;
			
		}
		public List<Users> SearchMember(String search){
			return mDao.queryLikeByName(search);
}
		public Users findByIdSerUsers(int id){
			return mDao.findById(id);
			
			
		}




}