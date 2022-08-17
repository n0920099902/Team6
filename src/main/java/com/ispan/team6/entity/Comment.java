package com.ispan.team6.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Comment")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@Column(name = "id")
	private Integer id;

//	@Column(name = "comment")
	private String comments;

//	@Column(name = "score")
	private Integer score;

//	@Column(name = "remark")
	private String remark;

	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "Asia/Taipei") // restful JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time")
	private Date time;

	// 一對一 Comment對Orders外鍵(一筆訂單只有一個評論)
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id")
	private Orders orders;

	// 多對一 Comment對Users外鍵(一個User會有多筆評論)
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_users_id")
	private Users users;

	// 檢查日期 假如日期沒給 請它幫你做 (物件轉換成 persistent 狀態以前要執行的方法)
	@PrePersist
	public void onCreate() {
		if (time == null) {
			this.time = new Date();
		}
	}

	public Comment() {
	}

	public Comment(Integer id, Orders orders, Users users, String comments, Integer score, String remark, Date time) {
		super();
		this.id = id;
		this.orders = orders;
		this.users = users;
		this.comments = comments;
		this.score = score;
		this.remark = remark;
		this.time = time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", order=" + orders + ", users=" + users + ", comments=" + comments + ", score="
				+ score + ", remark=" + remark + ", time=" + time + "]";
	}

}
