package com.ispan.team6.entity;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

public class Shop {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String account;

	private String password;

	private String email;

	private String phone;

	private String access;

	@Lob
	private Blob photo;

	private String remark;

	// 一對多 User對Comment(一個User可以有多筆Comment)
	@OneToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Comment> comment = new LinkedHashSet<Comment>();

	// 一對多 User對Order(一個User可以有多筆Order)
	@OneToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Orders> orders = new LinkedHashSet<Orders>();

	@Transient
	private String confimation_password;


}
