package com.Integralmall.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;
//部门表
public class department implements Serializable {
	private Integer depano;//depaNo number primary key,--部门编号(depaNo)	Number	10	否	主键	用于链接员工表
	private String depaname;//  depaName varchar2(30) not null,--部门名称(depaName)	Varchar2	30	否		
	private Integer parentdepa;//  parentDepa number--上级部门(parentDepa)	Number	10	是		链接上级部门，可不写
	private Set<emp> emps;//员工
	
	public Integer getDepano() {
		return depano;
	}
	public void setDepano(Integer depano) {
		this.depano = depano;
	}
	public String getDepaname() {
		return depaname;
	}
	public void setDepaname(String depaname) {
		this.depaname = depaname;
	}
	public Integer getParentdepa() {
		return parentdepa;
	}
	public void setParentdepa(Integer parentdepa) {
		this.parentdepa = parentdepa;
	}
	public Set<emp> getEmps() {
		return emps;
	}
	public void setEmps(Set<emp> emps) {
		this.emps = emps;
	}
	public department(Integer depano, String depaname, Integer parentdepa, Set<emp> emps) {
		super();
		this.depano = depano;
		this.depaname = depaname;
		this.parentdepa = parentdepa;
		this.emps = emps;
	}
	public department() {
		super();
	}
	@Override
	public String toString() {
		return "department [depano=" + depano + ", depaname=" + depaname + ", parentdepa=" + parentdepa + ", emps="
				+ emps + "]";
	}
	
}
