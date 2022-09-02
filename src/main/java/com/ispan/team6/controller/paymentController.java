package com.ispan.team6.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ispan.team6.entity.Orders;
import com.ispan.team6.entity.OrdersDetail;
import com.ispan.team6.entity.Users;
import com.ispan.team6.model.OrdersDao;
import com.ispan.team6.model.OrdersDetailDao;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;

@Controller
@SessionAttributes({"orderPay","member"})
public class paymentController {
	
	@Autowired
	private OrdersDao oDao;
	
	@Autowired
	private OrdersDetailDao odDao;
	
	public static AllInOne all;
	
	private static void initial() {
		all = new AllInOne("");
	}
	
	
	
	
//	 from here   +++++++++++++++++++++++++++++++++++++++++++++++++++++
@GetMapping("/restaurant/cart/payment/{id}")
@ResponseBody
	public  String genAioCheckOutDevide(HttpSession orderPay,@PathVariable("id") Integer id,Model m) {
	
	
	
//		+++++++++++++++++++++++++++++++++++++++++++++++++++++
    
	   Orders o=oDao.findOrdersById(id);
	   
	   
	   List<OrdersDetail> od=odDao.findByOrderId(o.getId());
	   
	   
	   //商品明細的String 文件中說使用 # 可以換行
	   String total="";
	   
	   for(int i=0;i<od.size()-1;i++) {
		   total+=od.get(i).getDish().getDishName()+"*"+Integer.toString(od.get(i).getQuantity())+"#";
	   }
	   total+=od.get(od.size()-1).getDish().getDishName()+"*"+Integer.toString(od.get(od.size()-1).getQuantity());
	
//		+++++++++++++++++++++++++++++++++++++++++++++++++++++
		AllInOne  all = new AllInOne("");
		Integer random = (int)(Math.random()* 999999999);
		String No = random.toString();
		System.out.println("亂數生成號碼"+No);
//		+++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		AioCheckOutDevide obj = new AioCheckOutDevide();
		obj.setMerchantTradeNo(No);
		obj.setMerchantTradeDate(o.getOrdersTime());
		obj.setTotalAmount(Integer.toString(o.getTotalPrice()));
		obj.setTradeDesc("test Description");
		obj.setItemName(total);
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setOrderResultURL("http://localhost:8080/FeastEat/order/confirmBuy/"+id);
		obj.setNeedExtraPaidInfo("N");
		obj.setCreditInstallment("12");
		String form = all.aioCheckOut(obj, null);
		
//		+++++++++++++++++++++++++++++++++++++++++++++++++++++	
		Users u= o.getUsers();
//		System.out.println("sdsadsadsadsadsad"+u.getId()+u.getAccount());
		m.addAttribute("member", u);
		
		return form;
	}
//		to here   +++++++++++++++++++++++++++++++++++++++++++++++++++++


}
