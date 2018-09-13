package com.Integralmall.biz;

import java.util.ArrayList;

import com.Integralmall.dao.DepartmentDao;
import com.Integralmall.entity.department;

public class DepartmentBiz{
	private DepartmentDao departmentDao;
	public ArrayList<department> findall() {
		System.out.println(departmentDao);
		return departmentDao.findall();
	}
	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
	public department find(String depaname) {
		return departmentDao.find(depaname);
	}
	public department findNo(Integer depaNo) {
		return departmentDao.findNo(depaNo);
	}
}
