package com.Integralmall.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.File;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.Integralmall.biz.DepartmentBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.imagerBiz;
import com.Integralmall.entity.department;
import com.Integralmall.entity.emp;
import com.opensymphony.xwork2.ActionSupport;

public class ImagerAction extends ActionSupport {
	private DepartmentBiz departmentBiz;
	private imagerBiz imagerbiz;
	private File  imager;
	private String imagerContentType;
	private String imagerFileName;
	private String savePath;
	private static String SUCCESS="success";
	public String Add() throws Exception  {
		String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
		FileOutputStream fos=new FileOutputStream(path+"\\"+this.getImagerFileName());
		FileInputStream fis=new FileInputStream(imager);
		byte []b=new byte[5000];
		System.out.println(imagerFileName+"=-====================");
		int len=-1;
		while((len=fis.read(b))!=-1){
			fos.write(b, 0, len);
		}
		fis.close();
		fos.close();
		return SUCCESS;
	}
	public DepartmentBiz getDepartmentBiz() {
		return departmentBiz;
	}
	public void setDepartmentBiz(DepartmentBiz departmentBiz) {
		this.departmentBiz = departmentBiz;
	}
	public imagerBiz getImagerbiz() {
		return imagerbiz;
	}
	public void setImagerbiz(imagerBiz imagerbiz) {
		this.imagerbiz = imagerbiz;
	}
	public File getImager() {
		return imager;
	}
	public void setImager(File imager) {
		this.imager = imager;
	}
	public String getImagerContentType() {
		return imagerContentType;
	}
	public void setImagerContentType(String imagerContentType) {
		this.imagerContentType = imagerContentType;
	}
	public String getImagerFileName() {
		return imagerFileName;
	}
	public void setImagerFileName(String imagerFileName) {
		this.imagerFileName = imagerFileName;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
}
