package com.ispan.springbootdemo_teacher.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.springbootdemo_teacher.model.WorkMessages;
import com.ispan.springbootdemo_teacher.model.WorkMessagesDao;

@Service
@Transactional
public class WorkMessagesService {
	
	@Autowired
	private WorkMessagesDao wDao;
	
	public void insertMessage(WorkMessages msg) {
		wDao.save(msg);
	}
	
	public WorkMessages lastestMessage() {
		return wDao.findFirstByOrderByAddedDesc();
	}
	
	public Page<WorkMessages> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1, 3,Sort.Direction.DESC, "added");
		Page<WorkMessages> page = wDao.findAll(pgb);
		return page;
	}
	
	public WorkMessages findById(Integer id) {
		Optional<WorkMessages> optional = wDao.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
		
	}
	
	public void deleteMessage(Integer id) {
		wDao.deleteById(id);
	}

}
