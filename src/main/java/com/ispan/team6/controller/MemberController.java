package com.ispan.team6.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.model.Users;
import com.ispan.team6.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@PostMapping("/rigister")
	public String addMemberPage2(@RequestParam("account") String account, @RequestParam("password") String password,
			@RequestParam("Birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
			@RequestParam("email") String email, @RequestParam("phone") int phone,
			@RequestParam("access") String access,
//			@RequestParam("remark") String remark,
			@RequestParam("Img") MultipartFile file, Model m) throws IOException {

		Users u = new Users();
		byte[] bytes = file.getBytes();
		u.setAccount(account);
		u.setAccess(access);
		u.setBirthday(birthday);
		u.setEmail(email);
		u.setPhone(phone);
		u.setPassword(password);
//		u.setAccess(remark);
		u.setPhoto(bytes);

		service.insertMember(u);
		System.out.println("access:"+access);
		System.out.println("password:"+password);
		System.out.println("email:"+email);
		System.out.println("phone:"+phone);
		System.out.println("birthday:"+birthday);
//		System.out.println(remark);
		System.out.println(bytes);

		return "memberin";
//		
	}

	@GetMapping(path = "member/img")
	public void processAction(@RequestParam("id") int id, HttpServletResponse response) throws IOException {
		Users m = service.findByIdSerUsers(id);
		byte[] bytes = m.getPhoto();
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		OutputStream out = response.getOutputStream();
		out.write(bytes);
		out.flush();
		out.close();

	}


	@GetMapping("/Users/select")
	public String MemberSelect(Model model) {
		List<Users> list = service.findAllMembers();

		model.addAttribute("allmember", list);

		return "memberselect";
	}

	@GetMapping("/Users/delete/{id}")
	public String deleteMember(@PathVariable Integer id) {
		service.deleteMember(id);
		return "redirect:/Users/select";
	}

	@GetMapping("/Users/update/{id}")
	public String UpdateMember(@PathVariable Integer id, Model model) {
		Users update = service.UpdateById(id);

		model.addAttribute("getAccount", update.getAccount());
		model.addAttribute("getBirthday", update.getBirthday());
		model.addAttribute("getEmail", update.getEmail());
		model.addAttribute("getPassword", update.getPassword());
		model.addAttribute("getPhone", update.getPhone());

		return "updatePage";
	}

	@PostMapping("/Users/update")
	public String editMessagePost(@RequestParam("account") String account, @RequestParam("password") String password,
			@RequestParam("Birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
			@RequestParam("email") String email, @RequestParam("phone") int phone,
			@RequestParam("access") String access,
//			@RequestParam("remark") String remark,
			@RequestParam("Img") MultipartFile file, Model m) throws IOException {
		
		Users u = new Users();
		byte[] bytes = file.getBytes();
		u.setAccount(account);
		u.setAccess(access);
		u.setBirthday(birthday);
		u.setEmail(email);
		u.setPhone(phone);
		u.setPassword(password);
//		u.setAccess(remark);
		u.setPhoto(bytes);
		
		service.insertMember(u);

		return "redirect:/Users/select";
	}

	@GetMapping("/member/search")
	public String Searchaccount(@RequestParam("search") String search, Model m) {
		List<Users> list = service.SearchMember(search);
		System.out.println(search);
		m.addAttribute("allmember", list);

		return "memberselect";
	}
}