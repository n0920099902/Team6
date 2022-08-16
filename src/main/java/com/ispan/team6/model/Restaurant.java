package com.ispan.team6.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Restaurant")
public class Restaurant {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "phone")
	private String phone;

	@Column(name = "address")
	private String address;

	@DateTimeFormat(pattern = "HH:mm:ss") // SpringMVC
	@Column(name = "starttime")
	private String starttime;

	@DateTimeFormat(pattern = "HH:mm:ss") // SpringMVC
	@Column(name = "endtime")
	private String endtime;

	@Column(name = "startdate")
	private String startDate;

	@Column(name = "enddate")
	private String endDate;

	@Column(name = "remark")
	private String remark;

//	@Column(name = "fk_type_id")
//	private Integer fk_type_id;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_type_id")
	private RestaurantType restaurantType;

	@Lob
	@Column(name = "photo")
	private byte[] photo;

	public Restaurant() {
	}

	public Restaurant(Integer id, String name, String phone, String address, String type, String starttime,
			String endtime, String startDate, String endDate, String remark, byte[] photo) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
//		this.fk_type_id = fk_type_id;
		this.address = address;
		this.starttime = starttime;
		this.endtime = endtime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.remark = remark;
		this.photo = photo;
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

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
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

//	public Integer getfk_type_id() {
//		return fk_type_id;
//	}
//
//	public void setfk_type_id(Integer fk_type_id) {
//		this.fk_type_id = fk_type_id;
//	}
//
//	public Integer getFk_type_id() {
//		return fk_type_id;
//	}
//
//	public void setFk_type_id(Integer fk_type_id) {
//		this.fk_type_id = fk_type_id;
//	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

}
