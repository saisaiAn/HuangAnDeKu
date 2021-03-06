package com.Integralmall.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;
//员工表
public class emp implements Serializable {
	 private Integer empno;// number primary key,--员工编号(EmpNo)	Varchar2	30	否	主键	条件自增
	 private String empname;//EmpName varchar2(30) not null,--姓名(EmpName)	Varchar2	30	否		
	 private String empsex;// EmpSex varchar2(2) not null,--性别(EmpSex)	Varchar2	2	否		只能为:男,女
	 private String idcard;//IDcard varchar2(18) not null,--身份证(IDcard)	Varchar2	18	否		
	 private department department;// DepartmentNo number not null,--部门(DepartmentNo)	Number	30	是	外键	链接部门表
	 private Timestamp positivedates;// Positivedates timestamp not null,--转正日期(Positivedates)	Time	Null	否	
	 private String empphone;// EmpPhone varchar2(11) not null,--电话(EmpPhone)	Varchar2	11	否		
	 private integral intergralno;// intergralNo varchar2(20) not null,--积分(intergralNo)	Varchar2	20	否	外键	链接积分表
	 private Integer position;// position number not null --职位(position)	Number	2	否	用户权限限制	1: 
	 private String username;
	 private String password;
	 public Integer getEmpno() {
		return empno;
	}
	public void setEmpno(Integer empno) {
		this.empno = empno;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmpsex() {
		return empsex;
	}
	public void setEmpsex(String empsex) {
		this.empsex = empsex;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	public department getDepartment() {
		return department;
	}
	public void setDepartment(department department) {
		this.department = department;
	}
	
	public Timestamp getPositivedates() {
		return positivedates;
	}
	public void setPositivedates(Timestamp currentDate) {
		this.positivedates = currentDate;
	}
	public String getEmpphone() {
		return empphone;
	}
	public void setEmpphone(String empphone) {
		this.empphone = empphone;
	}
	public integral getIntergralno() {
		return intergralno;
	}
	public void setIntergralno(integral intergralno) {
		this.intergralno = intergralno;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public emp(Integer empno, String empname, String empsex, String idcard,
			com.Integralmall.entity.department department, Timestamp positivedates, String empphone, integral intergralno,
			Integer position, String username, String password) {
		super();
		this.empno = empno;
		this.empname = empname;
		this.empsex = empsex;
		this.idcard = idcard;
		this.department = department;
		this.positivedates = positivedates;
		this.empphone = empphone;
		this.intergralno = intergralno;
		this.position = position;
		this.username = username;
		this.password = password;
	}
	public emp() {
		super();
	}
	 
	 
}
