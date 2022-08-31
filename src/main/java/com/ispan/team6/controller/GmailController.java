package com.ispan.team6.controller;

import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.team6.entity.Users;
import com.ispan.team6.model.UsersDao;
import com.ispan.team6.service.UsersService;

@Controller
@SessionAttributes({"userGet","verificationCode"})
public class GmailController {

	@Autowired 
	private JavaMailSender  mailSender;

	@Autowired
	private UsersDao uDao;
	@Autowired
	private UsersService uService;

	    //接收使用者信箱，發送信件和驗證碼
	    @PostMapping("/users/send/email")
	 public String sendSimpleMail(@RequestParam("email") String email,Model model) throws Exception {
	     //亂數碼
	     StringBuilder verificationCode= new StringBuilder();
	     Random randomNumber = new Random();
	      for (int i = 0; i < 6; i++) {
	       verificationCode.append(randomNumber.nextInt(10));
	        }
	      System.out.println(verificationCode);
	         SimpleMailMessage message = new SimpleMailMessage();
	         message.setFrom("eeit147java@gmail.com");
	         message.setTo(email);
	         message.setSubject("主旨：饗訂重新設定密碼");
	         message.setText("很高興歡迎您，這是您的驗證碼"+verificationCode);
	         mailSender.send(message);
	         Users userEmail = uDao.findByEmail(email);
	         System.out.println(userEmail+"=========================================");
	          Integer userId = ((Users) userEmail).getId();
	          System.out.println(userId);
	          Optional<Users> user = uDao.findById(userId);
	          Users userGet = user.get();
	         
	         model.addAttribute("userGet", userGet);
	         model.addAttribute("message", message);
	         model.addAttribute("verificationCode",verificationCode);
	         //需要導入首頁
	         return "confirmVerificationCode";
	     }
	    //確認驗證碼是否相同
	    @PostMapping("/users/confirm/email")
	    public String confirm(@RequestParam("code") String code,Model model) {
	     
	     StringBuilder verificationCode =(StringBuilder) model.getAttribute("verificationCode");
	     System.err.println(verificationCode);
	     Users userGet =(Users) model.getAttribute("userGet");
	     String vCode = verificationCode.toString();
	     if(vCode.equals(code)) {
	      Integer userIdGet = userGet.getId();
	      Users userbean = new Users();
	      userbean.setId(userIdGet);
	      model.addAttribute("userbean", userbean);
	      return "confirmPasswordWhenForgot";
	     }
	     //需要登入失敗的頁面
	     model.addAttribute("msg", "驗證碼錯誤");
	     return "redirect:/member/login"; 
	     
	    }
	    @PostMapping("/users/confirm/password")
	    public String confirmPassword(@RequestParam("password") String pwd,
	             @RequestParam("id") Integer id) {
	     Optional<Users> userId = uDao.findById(id);
	     Users userGet = userId.get();
	     userGet.setPassword(pwd);
	     uDao.save(userGet);
	     return "login";
	    }
}
