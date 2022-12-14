package com.ispan.team6.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ispan.team6.entity.Restaurant;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.UsersDao;
import com.ispan.team6.service.RestaurantService;
import com.ispan.team6.service.UsersService;

@Controller
@SessionAttributes({ "member", "shop" })
public class UsersApi {
	@Autowired
	private UsersDao dao;

	@Autowired
	private UsersService uService;

	@Autowired
	private RestaurantService rService;

	@PostMapping("member/login")
	public String Login(@RequestParam("mAccount") String account, @RequestParam("mPassword") String pwd, Model m) {
		Users member = dao.findByAccountAndPassword(account, pwd);
		if (member == null) {
			m.addAttribute("message", "登入失敗,請重新登入");
			return "login";
		}
		Restaurant r = rService.findByUsers(member);
		if (member.getAccess().equals("Shop") && r == null) {
			m.addAttribute("shop", "NO");
		}
		if (member.getAccess().equals("Shop") && r != null) {
			m.addAttribute("shop", "YES");
		}
		m.addAttribute("member", member);

		return "redirect:/restaurant";
	}

	@GetMapping("member/logout")
	public String LogOutAction(@ModelAttribute("member") Users member, HttpSession httpSession, Model m) {
		httpSession.invalidate();
		m.addAttribute("member", null);
		m.addAttribute("shop", null);
		return "redirect:/restaurant";

	}

	@PostMapping("member/sign")
	public String Sign(@RequestParam("mAccount") String account, @RequestParam("mPassword") String pwd,
			@RequestParam("mEmail") String email, @RequestParam("mPhone") String phone,
			@RequestParam("mBirthday") @DateTimeFormat(pattern = "yyyy-MM-dd") String birthday,
			@RequestParam("mAccess") String access, @RequestParam("Img") MultipartFile file, Model m)
			throws IOException {
		Users mem = new Users();
		mem.setAccount(account);
		mem.setPassword(pwd);
		mem.setEmail(email);
		mem.setPhone(phone);
		mem.setBirthday(birthday);
		mem.setAccess(access);
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				Blob blob = new SerialBlob(bytes);
				mem.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		Users resMem = dao.save(mem);
		if (resMem == null) {
			m.addAttribute("message", "註冊失敗");
		}
		m.addAttribute("message", "註冊成功");
		return "login";
	}

	// 拿大頭貼
	@GetMapping(path = "member/img")
	public void processAction(@RequestParam("id") Integer id, HttpServletResponse response, Model model)
			throws IOException {
		Users m = uService.findById(id);
		int len = 0;
		try {
			len = (int) m.getPhoto().length();
			byte[] bytes = m.getPhoto().getBytes(1, len);
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
			OutputStream out = response.getOutputStream();
			if (bytes != null) {
				out.write(bytes);
				out.flush();
			}
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@GetMapping("/users/updateUserPage")
	public String updateUserPage() {

		return "updateUser";
	}

	@PostMapping("/users/updateUser")
	public String updateUserAction(@ModelAttribute("member") Users member) throws IOException {
//		member.setPhoto(file.getBytes());
		byte[] bytes = null;
		MultipartFile file = member.getImage();
		if (file != null && !file.isEmpty()) {
			try {
				bytes = file.getBytes();
				Blob blob = new SerialBlob(bytes);
				member.setPhoto(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		uService.insertUser(member);

		return "userCentre";
	}

	@GetMapping("/typeUserOldPasswordPage")
	public String typeUserOldPasswordPage() {

		return "typeUserOldPassword";
	}

	@PostMapping("/users/checkUserOldPassword/{id}")
	public String checkUserOldPassword(@ModelAttribute Users member, @PathVariable Integer id, String password,
			Model model) {

		if (uService.findPasswordById(id).getPassword().equals(password)) {

			return "updateUserPassword";
		} else {
			model.addAttribute("message", "密碼輸入錯誤，請重新輸入");
			return "typeUserOldPassword";
		}
	}

	@GetMapping("/users/updateUserPassword")
	public String updateUserPasswordPage() {

		return "updateUserPassword";
	}

	@PostMapping("/users/updateUserPassword/{id}")
	public String updateUserPassword(@ModelAttribute("member") Users member, @PathVariable Integer id, String password,
			String confimation_password, HttpSession httpSession, Model model) {
		if (id != null) {
			Users members = uService.findById(id);
			model.addAttribute("member", members);
		}
		if (member.getPassword() == "") {
			model.addAttribute("message", "密碼不得為空白");
			return "updateUserPassword";
		}
		if (password.equals(confimation_password)) {
			httpSession.invalidate();
			model.addAttribute("member", null);
			model.addAttribute("shop", null);
			model.addAttribute("message", "修改成功，請重新登入");
			uService.insertUser(member);
			System.out.println("password========>" + password);
			System.out.println("member.getPassword()" + member.getPassword());
			return "login";
		} else {
			model.addAttribute("message", "兩次密碼不相符，請重新輸入");
			return "updateUserPassword";
		}
	}

}