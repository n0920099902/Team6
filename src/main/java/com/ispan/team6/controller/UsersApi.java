package com.ispan.team6.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.entity.Users;
import com.ispan.team6.model.UsersDao;
import com.ispan.team6.service.UsersService;

@Controller
public class UsersApi {
	@Autowired
	private UsersDao dao;

	@Autowired
	private UsersService uService;

	@PostMapping("member/login")
	public String Login(@RequestParam("mAccount") String account, @RequestParam("mPassword") String pwd, Model m) {
		Users member = dao.findByAccountAndPassword(account, pwd);
		if (member == null) {
			m.addAttribute("message", "登入失敗,請重新登入");
			return "login";
		}
		m.addAttribute("member", member);

		return "index";
	}

	@GetMapping("member/logout")
	public String LogOutAction(@ModelAttribute("member") Users member, HttpSession httpSession, Model m) {
		httpSession.invalidate();
		m.addAttribute("member", null);
		return "index";

	}

	@PostMapping("member/sign")
	public String Sign(@RequestParam("mAccount") String account, @RequestParam("mPassword") String pwd,
			@RequestParam("mEmail") String email, @RequestParam("mPhone") String phone,
			@RequestParam("mBirthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthday,
			@RequestParam("mAccess") String access, @RequestParam("Img") MultipartFile file, Model m)
			throws IOException {
		Users mem = new Users();
		byte[] bytes = file.getBytes();
		mem.setAccount(account);
		mem.setPassword(pwd);
		mem.setEmail(email);
		mem.setPhone(phone);
		mem.setBirthday(birthday);
		mem.setAccess(access);
		mem.setPhoto(bytes);
		Users resMem = dao.save(mem);
		if (resMem == null) {
			m.addAttribute("message", "註冊失敗");
		}
		m.addAttribute("message", "註冊成功");
		return "login";
	}

	// 拿大頭貼
	@GetMapping(path = "member/img")
	public void processAction(@RequestParam("id") Integer id, HttpServletResponse response) throws IOException {
		Users m = uService.findById(id);
		byte[] bytes = m.getPhoto();
		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
		OutputStream out = response.getOutputStream();
		out.write(bytes);
		out.flush();
		out.close();

	}

}
