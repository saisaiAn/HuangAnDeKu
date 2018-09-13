package com.Integralmall.action;

import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.Integralmall.biz.DepartmentBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.entity.department;
import com.Integralmall.entity.emp;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport {
	private DepartmentBiz departmentBiz;
	public String findall() {
		ServletActionContext.getRequest().setAttribute("dlist", departmentBiz.findall());
		return "success";
	}
	public DepartmentBiz getDepartmentBiz() {
		return departmentBiz;
	}
	public void setDepartmentBiz(DepartmentBiz departmentBiz) {
		this.departmentBiz = departmentBiz;
	}
	
}
