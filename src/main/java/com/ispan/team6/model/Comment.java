package com.ispan.team6.model;

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
import javax.persistence.criteria.Order;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "comment")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_order_id")
	private OrderBean order;
	
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_mem_id") 
	private Member member;
	
	@Column(name = "comment")
	private String comment;
	
	@Transient
	@Column(name = "score")
	private Integer score;
	
	@Transient
	@Column(name = "remark")
	private String remark;
	
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")  // restful JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")   //SpringMVC
	@Temporal(TemporalType.TIMESTAMP) 
	@Column(name = "time")
	private Date time;
	
	//檢查日期 假如日期沒給 請它幫你做 (物件轉換成 persistent 狀態以前要執行的方法)
	@PrePersist    
	public void onCreate() {
		if(time == null) {
			this.time = new Date();
		}
	}
	
	public Comment() {
	}

	public Comment(Integer id, OrderBean order, Member member, String comment, Integer score, String remark,
			Date time) {
		super();
		this.id = id;
		this.order = order;
		this.member = member;
		this.comment = comment;
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

	public OrderBean getOrder() {
		return order;
	}

	public void setOrder(OrderBean order) {
		this.order = order;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

	@Override
	public String toString() {
		return "Comment [id=" + id + ", order=" + order + ", member=" + member + ", comment=" + comment + ", score="
				+ score + ", remark=" + remark + ", time=" + time + "]";
	}

}
