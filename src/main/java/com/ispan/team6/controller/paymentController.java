package com.ispan.team6.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;

@Controller
@SessionAttributes("orderPay")
public class paymentController {
	public static AllInOne all;
	
	private static void initial() {
		all = new AllInOne("");
	}
	
	
//	 from here   +++++++++++++++++++++++++++++++++++++++++++++++++++++
@GetMapping("/restaurant/cart/payment")
@ResponseBody
	public static String genAioCheckOutDevide(HttpSession orderPay) {
		
//		+++++++++++++++++++++++++++++++++++++++++++++++++++++
		AllInOne  all = new AllInOne("");
		Integer random = (int)(Math.random()* 999999999);
		String No = random.toString();
		System.out.println("亂數生成號碼"+No);
//		+++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		AioCheckOutDevide obj = new AioCheckOutDevide();
		obj.setMerchantTradeNo(No);
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("20000");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setOrderResultURL("http://localhost:8080/my-app/");
		obj.setNeedExtraPaidInfo("N");
		obj.setCreditInstallment("12");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
//		to here   +++++++++++++++++++++++++++++++++++++++++++++++++++++


}
