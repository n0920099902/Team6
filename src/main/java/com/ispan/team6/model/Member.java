package com.ispan.team6.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "member")
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private  Integer id;
	@Column(name = "account")
	private  String account;
	
	@Column(name = "password")
	private  String password;
	
	@Column(name = "email")
	private  String email;
	
	@Column(name = "phone")
	private  Integer phone;
	
	@Column(name = "remark")
	private  String remark;

	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss",timezone = "Asia/Taipei")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") 
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "bithday")
	private  Date bithday;
	
	public Member() {
	}
	public void onCreate() {
		if (bithday == null) {
			bithday = new Date();
		}
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getBithday() {
		return bithday;
	}
	public void setBithday(Date bithday) {
		this.bithday = bithday;
	}
}
