package com.ispan.team6.entity;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "Restaurant")
public class Restaurant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;

	private String phone;

	private String address;

	@DateTimeFormat(pattern = "HH:mm:ss") // SpringMVC
	private String startTime;

	@DateTimeFormat(pattern = "HH:mm:ss") // SpringMVC
	private String endTime;

	private String startDate;

	private String endDate;

	private String remark;

	@Lob
	private Blob photo;

	// 一對多 Restaurant對Orders外鍵(一間Restaurant可以有多筆Order)
	@OneToMany(mappedBy = "restaurant", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Orders> orders = new LinkedHashSet<Orders>();

	// 多對一 Restaurant對RestaurantType外鍵(一種RestaurantType會有多間Restaurant)
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_type_id")
	private RestaurantType restaurantType;

	// 一對一 Restaurant對Users外鍵(一個access為shop的user_account對一間Restaurant)
	@OneToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "fk_user_id")
	private Users users;

	@Transient
	private MultipartFile Image;

	public Restaurant() {
	}

	public Restaurant(Integer id, String name, String phone, String address, String type, String startTime,
			String endTime, String startDate, String endDate, String remark, Integer fk_type_id, Blob photo,
			Set<Orders> orders, RestaurantType restaurantType, Users users) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.startTime = startTime;
		this.endTime = endTime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.remark = remark;
		this.photo = photo;
		this.orders = orders;
		this.restaurantType = restaurantType;
		this.users = users;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public RestaurantType getRestaurantType() {
		return restaurantType;
	}

	public void setRestaurantType(RestaurantType restaurantType) {
		this.restaurantType = restaurantType;
	}

	public Set<Orders> getOrder() {
		return orders;
	}

	public void setOrder(Set<Orders> orders) {
		this.orders = orders;
	}

	public Set<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Set<Orders> orders) {
		this.orders = orders;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public MultipartFile getImage() {
		return Image;
	}

	public void setImage(MultipartFile image) {
		Image = image;
	}

}
