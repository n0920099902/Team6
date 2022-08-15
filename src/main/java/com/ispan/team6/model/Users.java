package com.ispan.team6.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Users")
public class Users {

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 @Column(name = "ID")
 private int id;
 
 @Column(name = "ACCOUNT")
 private String account;
 
 @Column(name = "PASSWORD")
 private String password;
 
 @Column(name = "EMAIL")
 private String email; 
 
 @Column(name = "PHONE")
 private int phone;
 
 @JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss")//json
 @DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")//springmvc
 @Temporal(TemporalType.TIMESTAMP)
 @Column(name = "BIRTHDAY")
 private Date birthday;
 
 @Column(name = "ACCESS")
 private String access;
 
 @Column(name = "PHOTO")
 private byte[] photo;
 
 @Column(name = "REMARK")
 private String remark;

 public Users() {
 }

 public int getId() {
  return id;
 }

 public void setId(int id) {
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

 public int getPhone() {
  return phone;
 }

 public void setPhone(int phone) {
  this.phone = phone;
 }

 public Date getBirthday() {
  return birthday;
 }

 public void setBirthday(Date birthday) {
  this.birthday = birthday;
 }

 public String getAccess() {
  return access;
 }

 public void setAccess(String access) {
  this.access = access;
 }

 public byte[] getPhoto() {
  return photo;
 }

 public void setPhoto(byte[] photo) {
  this.photo = photo;
 }

 public String getRemark() {
  return remark;
 }

 public void setRemark(String remark) {
  this.remark = remark;
 }
 @PrePersist //物件轉換成 persistant狀態以前執行的方法
 public void onCreate() {
  if(birthday ==null) {
   birthday=new Date();
  }
  //++
 }
 
}