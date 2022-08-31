package com.ispan.team6.controller;

import java.io.IOException;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.entity.Users;
import com.ispan.team6.service.MemberService;

@Controller
public class UsersBackController {

	@Autowired
	private MemberService service;
	
	@PostMapping("/register")
	public String addMemberPage2(@RequestParam("account") String account, @RequestParam("password") String password,
//			@RequestParam("Birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") String birthday,
			@RequestParam("email") String email, 
			@RequestParam("phone") String phone,
			@RequestParam("access") String access,
//			@RequestParam("remark") String remark,
			@RequestParam("Img") MultipartFile file, Model m) throws IOException {

		Users u = new Users();
		byte[] bytes = file.getBytes();
		u.setAccount(account);
		u.setAccess(access);
//		u.setBirthday(birthday);
		u.setEmail(email);
		u.setPhone(phone);
		u.setPassword(password);
		if (file != null && !file.isEmpty()) {
			try {
				Blob blob = new SerialBlob(bytes);
				u.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		service.insertMember(u);

		return "memberin";
	}

//	@GetMapping(path = "member/img")
//	public void processAction(@RequestParam("id") int id, HttpServletResponse response) throws IOException {
//		Users m = service.findByIdSerUsers(id);
//		byte[] bytes = m.getPhoto();
//		response.setContentType(MediaType.IMAGE_JPEG_VALUE);
//		OutputStream out = response.getOutputStream();
//		out.write(bytes);
//		out.flush();
//		out.close();
//
//	}

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
		model.addAttribute("update", update);
		
		Map<String, String> access = new HashMap<>();
		access.put("User", "會員");
		access.put("Shop", "店家");
		
		model.addAttribute("access", access);
		//		Users users = new Users();
//		Users update = service.UpdateById(id);
//
//		model.addAttribute("getId", update.getId());
//		model.addAttribute("getAccount", update.getAccount());
////		if( users.getAccess().equals("User")) {
//		model.addAttribute("getBirthday", update.getBirthday());
////		}
//		model.addAttribute("getEmail", update.getEmail());
//		model.addAttribute("getPassword", update.getPassword());
//		model.addAttribute("getPhone", update.getPhone());

		return "updatePage";
	}
	
	@PostMapping("/users/updateUser2")
	public String updateUser2(@ModelAttribute("update") Users u) throws IOException {
//		member.setPhoto(file.getBytes());
		MultipartFile file = u.getImage();
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				Blob blob = new SerialBlob(bytes);	
				u.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
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
