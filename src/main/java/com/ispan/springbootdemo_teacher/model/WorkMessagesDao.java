package com.ispan.springbootdemo_teacher.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface WorkMessagesDao extends JpaRepository<WorkMessages, Integer> {

	public WorkMessages findFirstByOrderByAddedDesc();
}
