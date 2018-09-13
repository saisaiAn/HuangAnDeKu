package com.Integralmall.action;

import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.Integralmall.biz.DepartmentBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.OrdersBiz;
import com.Integralmall.entity.department;
import com.Integralmall.entity.emp;
import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport {
	private DepartmentBiz departmentBiz;
	private OrdersBiz ordersbiz;
	private String orderss;
	private String orderssDate;
	private String orderNo;
	public String find() {
		ServletActionContext.getRequest().setAttribute("Orders", ordersbiz.find(orderss, orderssDate));
		return "success";
	}
	public String finda() {
		ServletActionContext.getRequest().setAttribute("Orders", ordersbiz.find(orderss, orderssDate));
		return "handling";
	}
	public String findd() {
		ServletActionContext.getRequest().setAttribute("order", ordersbiz.find(Integer.parseInt(orderNo)));
		return "detailed";
	}
	public DepartmentBiz getDepartmentBiz() {
		
		return departmentBiz;
	}
	public void setDepartmentBiz(DepartmentBiz departmentBiz) {
		this.departmentBiz = departmentBiz;
	}
	public String getOrderss() {
		return orderss;
	}
	public void setOrderss(String orderss) {
		this.orderss = orderss;
	}
	public String getOrderssDate() {
		return orderssDate;
	}
	public void setOrderssDate(String orderssDate) {
		this.orderssDate = orderssDate;
	}
	public OrdersBiz getOrdersbiz() {
		return ordersbiz;
	}
	public void setOrdersbiz(OrdersBiz ordersbiz) {
		this.ordersbiz = ordersbiz;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
}
