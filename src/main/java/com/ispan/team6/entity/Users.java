package com.ispan.team6.entity;

import java.sql.Blob;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "ID")
	private Integer id;

//	@Column(name = "ACCOUNT")
	private String account;

//	@Column(name = "PASSWORD")
	private String password;

//	@Column(name = "EMAIL")
	private String email;

//	@Column(name = "PHONE")
	private String phone;

//	@JsonFormat(pattern = "yyyy/MM/dd") // json
//	@DateTimeFormat(pattern = "yyyy/MM/dd") // springmvc
//	@Column(name = "BIRTHDAY")
	private String birthday;

//	@Column(name = "ACCESS")
	private String access;

	@Lob
//	@Column(name = "PHOTO")
	private Blob photo;

//	@Column(name = "REMARK")
	private String remark;

	// 一對多 User對Comment(一個User可以有多筆Comment)
	@OneToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Comment> comment = new LinkedHashSet<Comment>();

	// 一對多 User對Order(一個User可以有多筆Order)
	@OneToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Orders> orders = new LinkedHashSet<Orders>();

	@Transient
	private String confimation_password;

	@Transient
	private MultipartFile Image;

	public Users() {
	}

	public Users(Integer id, String account, String password, String email, String phone, String birthday,
			String access, Blob photo, String remark, Set<Comment> comment, Set<Orders> orders,
			String confimation_password, MultipartFile image) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
		this.access = access;
		this.photo = photo;
		this.remark = remark;
		this.comment = comment;
		this.orders = orders;
		this.confimation_password = confimation_password;
		Image = image;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

//	@PrePersist // 物件轉換成 persistant狀態以前執行的方法
//	public void onCreate() {
//		if (birthday == null) {
//			birthday = new Date();
//		}
//
//	}

	public Set<Comment> getComment() {
		return comment;
	}

	public void setComment(Set<Comment> comment) {
		this.comment = comment;
	}

	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}

	public String getConfimation_password() {
		return confimation_password;
	}

	public void setConfimation_password(String confimation_password) {
		this.confimation_password = confimation_password;
	}

	public MultipartFile getImage() {
		return Image;
	}

	public void setImage(MultipartFile image) {
		Image = image;
	}

}