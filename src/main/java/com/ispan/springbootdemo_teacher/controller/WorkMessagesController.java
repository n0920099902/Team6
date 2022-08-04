package com.ispan.springbootdemo_teacher.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.springbootdemo_teacher.dto.MessageDto;
import com.ispan.springbootdemo_teacher.model.WorkMessages;
import com.ispan.springbootdemo_teacher.model.WorkMessagesDao;
import com.ispan.springbootdemo_teacher.service.WorkMessagesService;

@Controller
public class WorkMessagesController {
	
	@Autowired
	private WorkMessagesService wService;
	
	@GetMapping("/message/add")
	public String addMessagePage(Model model) {
		
		WorkMessages newMsg = new WorkMessages();
		
		WorkMessages latestMsg = wService.lastestMessage();
		
		model.addAttribute("workMessages", newMsg);
		model.addAttribute("latestMsg", latestMsg);
		
		return "addMessage";
	}
	
	@PostMapping("/postMessages")
	public String postMessage(@ModelAttribute WorkMessages msg,Model model) {
		wService.insertMessage(msg);
		
		WorkMessages newMsg = new WorkMessages();
		WorkMessages latestMsg = wService.lastestMessage();
		
		model.addAttribute("workMessages", newMsg);
		model.addAttribute("latestMsg", latestMsg);
		
		return "addMessage";
	}
	
	@GetMapping("/message/latest")
	@ResponseBody
	public WorkMessages findLastest() {
		return wService.lastestMessage();
	}
	
	@GetMapping("/message/viewMessages")
	public String viewMessagesPage(@RequestParam(name="p",defaultValue = "1") Integer pageNumber, Model model) {
		Page<WorkMessages> page = wService.findByPage(pageNumber);
		
		model.addAttribute("page", page);
		
		return "viewMessages";
	}
	
	@GetMapping("/message/editMessage/{id}")
	public String editMessagePage(@PathVariable Integer id, Model model) {
		WorkMessages msg = wService.findById(id);
		
		model.addAttribute("workMessages", msg);
		
		return "editMessage";
	}
	
	@PostMapping("/message/editMessage")
	public String editMessagePost(@ModelAttribute WorkMessages msg) {
		// https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.entity-persistence
		wService.insertMessage(msg);
		
		return "redirect:/message/viewMessages";
	}
	
	@GetMapping("/message/deleteMessage/{id}")
	public String deleteMessage(@PathVariable Integer id) {
		wService.deleteMessage(id);
		return "redirect:/message/viewMessages";
	}
	
	@PostMapping("/api/postMessage")
	@ResponseBody
	public List<WorkMessages> postMessageApi(@RequestBody MessageDto dto){
		String text = dto.getMsg();
		
		WorkMessages workMsg = new WorkMessages();
		workMsg.setText(text);
		
		wService.insertMessage(workMsg);
		
		Page<WorkMessages> page = wService.findByPage(1);
		
		List<WorkMessages> list = page.getContent();
		
		return list;
	}

}
