package com.Integralmall.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.Integralmall.biz.CommodityBiz;
import com.Integralmall.biz.CommodityTypeBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.IntegralTypeBiz;
import com.Integralmall.biz.IntegralscheduleBiz;
import com.Integralmall.biz.OrdersBiz;
import com.Integralmall.biz.imagerBiz;
import com.Integralmall.entity.*;
import com.alibaba.fastjson.JSONArray;
import com.opensymphony.xwork2.ActionSupport;

public class CommodityAction extends ActionSupport {
	private CommodityBiz commodityBiz;
	private static String SUCCESS="success";
	private String commoditytype;
	private commodity commodity;
	private String Commoditytypeno;
	private String imagerTitle;
	private imagerBiz imagerbiz;
	private OrdersBiz ordersbiz;
	private EmpBiz empbiz;
	private IntegralTypeBiz integraltypeBiz;
	private IntegralscheduleBiz integralscheduleBiz;
	
	private File  imager;
	private String imagerContentType;
	private String imagerFileName;
	private String savePath;
	private String commoditytitle;
	private String proname;
	private String delNo;
	private String commotypeNo;
	private String OrderNo;
	private String type;
	private String Random;
	private String commoSum; 
	
	private File file;
	private String fileContentType;
	private String fileFileName;
	private CommodityTypeBiz commoditytypeBiz;
	public String Add() throws Exception  {
		commoditytype com=new commoditytype();
		com.setCommodityTypeNo(Integer.parseInt(Commoditytypeno));
		commodity.setCommoditytypeno(com);
		Integer imagerno = commodityBiz.AddCommdity(commodity);
		String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
		String imgpath=path+"\\"+this.getImagerFileName();
		String imgpaths="updateImg\\"+this.getImagerFileName();
		FileOutputStream fos=new FileOutputStream(imgpath);
		FileInputStream fis=new FileInputStream(imager);
		byte []b=new byte[5000];
		commodity commo=new commodity();
		commo.setCommodityno(imagerno);
		String commoname=commodityBiz.findcommodity(commo).getCommoditytitle();
		int len=-1;
		while((len=fis.read(b))!=-1){
			fos.write(b, 0, len);
		}
		fis.close();
		fos.close();
		imager img=new imager();
		img.setImagerurl(imgpaths);
		img.setImageclassification("1");
		img.setImagerdescription(commoname);
		img.setImagerid(imagerno);
		imagerbiz.Addimager(img);
		ServletActionContext.getRequest().setAttribute("comsize", commodityBiz.findAllCommdity().size());
		ServletActionContext.getRequest().setAttribute("comlist", commodityBiz.findAllCommdity());
		return "plist";
	}
	public String upload() throws IOException {
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		/*//commoditytype ctype=commoditytypeBiz.findCommodityType(Integer.parseInt(commotypeNo));
		//commoditytype superType=ctype.getSupercommoditytype();
		commoditytype com=new commoditytype();
		com.setCommodityTypeNo(Integer.parseInt(commotypeNo));
		List<commoditytype> clist= commoditytypeBiz.findSonCommodityType(com);
		List<commoditytype> sonlist=new ArrayList<commoditytype>();
		for (commoditytype commoditytype : clist) {
			commoditytype.setSupercommoditytype(null);
			sonlist.add(commoditytype);
		}
		JSONArray jsonlist=(JSONArray)JSONArray.toJSON(sonlist);*/
		String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
		String imgpath=path+"\\"+this.getFileFileName();
		String imgpaths="updateImg\\"+this.getFileFileName();
		FileOutputStream fos=new FileOutputStream(imgpath);
		FileInputStream fis=new FileInputStream(file);
		byte []b=new byte[5000];
		int len=-1;
		while((len=fis.read(b))!=-1){
			fos.write(b, 0, len);
		}
		fis.close();
		fos.close();
		imager img=new imager();
		img.setImagerurl(imgpaths);
		img.setImageclassification("1");
		System.out.println(imgpaths);
		imagerbiz.Addimager(img);
		System.out.println(this.getFile().getName());
		System.out.println(this.getFileContentType());
		System.out.println(this.getFileFileName());
		out.print("{[\"bool\":\"Y\"]}");
		out.close();
		return null;
	}
	public String findallcommodity(){
		ServletActionContext.getRequest().setAttribute("Clist", commodityBiz.findAllCommdity());
		return SUCCESS;
	}
	public String findcommodity(){
		ServletActionContext.getRequest().setAttribute("Commodity", commodityBiz.findcommodity(commodity));
		return SUCCESS;
	}
	public String findtitleCommodity() throws IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		JSONArray jsonlist=(JSONArray) JSONArray.toJSON(commodityBiz.findhighSelectCommodity(proname));
		out.print(jsonlist);
		out.close();
		return null;
	}
	public String findsuper() throws IOException {
		System.out.println(commotypeNo);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		//commoditytype ctype=commoditytypeBiz.findCommodityType(Integer.parseInt(commotypeNo));
		//commoditytype superType=ctype.getSupercommoditytype();
		commoditytype com=new commoditytype();
		com.setCommodityTypeNo(Integer.parseInt(commotypeNo));
		List<commoditytype> clist= commoditytypeBiz.findSonCommodityType(com);
		List<commoditytype> sonlist=new ArrayList<commoditytype>();
		for (commoditytype commoditytype : clist) {
			commoditytype.setSupercommoditytype(null);
			sonlist.add(commoditytype);
		}
		JSONArray jsonlist=(JSONArray)JSONArray.toJSON(sonlist);
		System.out.println(jsonlist+"aaaaa");
		out.print(jsonlist);
		out.close();
		return null;
	}
	public String Delcommodity() throws IOException {
		commodity commo= new commodity();
		commo.setCommodityno(Integer.parseInt(delNo));
		commodityBiz.DelectCommdity(commo);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		JSONArray jsonlist=(JSONArray) JSONArray.toJSON(commodityBiz.findAllCommdity());
		out.print(jsonlist);
		return null;
	}
	public String findcommoditys() {
		ServletActionContext.getRequest().setAttribute("comsize", commodityBiz.findAllCommdity().size());
		ServletActionContext.getRequest().setAttribute("comlist", commodityBiz.findAllCommdity());
		return "plist";
	}
	public String Updcommodity() {
		commodityBiz.UpdateCommdity(commodity);
		return SUCCESS;
	}
	public String findOrders() {
		ServletActionContext.getRequest().setAttribute("Orders", ordersbiz.findall());
		return "OrderFrom";
	}
	public String findOrderss() {
		ServletActionContext.getRequest().setAttribute("Orders", ordersbiz.findall());
		return "Order_handling";
	}
	public String ForOrders() throws IOException {
		orders order= ordersbiz.find(Random);
		String pd="Y";
		if(order==null) {
			pd="N";
		}else if(order.getOrderstatus()==1) {
			pd="E";
		}else if(order.getOrderstatus()==3){
			pd="C";
		}else {
			order.setOrderstatus(3);
			ordersbiz.Updorder(order);
//			commodity commo=order.getOrdercommodityno();
//			commo.setCommodityinventory(commo.getCommodityinventory()-1);
//			commodityBiz.UpdateCommdity(commo);
			integralschedule integralschedule=new integralschedule();
			integralschedule.setChangenumber(Integer.parseInt(order.getOrderintegral()));//变更积分数
			integralschedule.setEmpno(order.getEmpno());//申请人
			integralschedule.setReviewer(empbiz.find(80));//审核人
			integralschedule.setIntegraltypeno(integraltypeBiz.find(9));//积分类型
			integralschedule.setIntergralchange(order.getOrdercommodityno().getCommoditytitle());//变动原因
			integralschedule.setIntegralno(order.getEmpno().getIntergralno());//积分表
			java.sql.Timestamp currentDate = new java.sql.Timestamp(System.currentTimeMillis());
			integralschedule.setChangedate(currentDate);
			integralscheduleBiz.AddIntegralaudit(integralschedule);
		}
		ServletActionContext.getRequest().setAttribute("Orders", ordersbiz.findall());
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print(pd);
		return null;
	}
	public String UpdateOrders() throws IOException {
		orders order= ordersbiz.find(Integer.parseInt(OrderNo));
		order.setOrderstatus(Integer.parseInt(type));
		ordersbiz.Updorder(order);
		ServletActionContext.getRequest().setAttribute("Orders", ordersbiz.findall());
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		out.print("Y");
		return null;
	}
	
	public String getCommotypeNo() {
		return commotypeNo;
	}
	public void setCommotypeNo(String commotypeNo) {
		this.commotypeNo = commotypeNo;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public CommodityBiz getCommodityBiz() {
		return commodityBiz;
	}
	public void setCommodityBiz(CommodityBiz commodityBiz) {
		this.commodityBiz = commodityBiz;
	}
	public commodity getCommodity() {
		return commodity;
	}
	public void setCommodity(commodity commodity) {
		this.commodity = commodity;
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
	public String getCommoditytype() {
		return commoditytype;
	}
	public void setCommoditytype(String commoditytype) {
		this.commoditytype = commoditytype;
	}
	public String getImagerTitle() {
		return imagerTitle;
	}
	public void setImagerTitle(String imagerTitle) {
		this.imagerTitle = imagerTitle;
	}
	public String getCommoditytypeno() {
		return Commoditytypeno;
	}
	public void setCommoditytypeno(String commoditytypeno) {
		Commoditytypeno = commoditytypeno;
	}
	public String getCommoditytitle() {
		return commoditytitle;
	}
	public void setCommoditytitle(String commoditytitle) {
		this.commoditytitle = commoditytitle;
	}
	public String getDelNo() {
		return delNo;
	}
	public void setDelNo(String delNo) {
		this.delNo = delNo;
	}
	public CommodityTypeBiz getCommoditytypeBiz() {
		return commoditytypeBiz;
	}
	public void setCommoditytypeBiz(CommodityTypeBiz commoditytypeBiz) {
		this.commoditytypeBiz = commoditytypeBiz;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public OrdersBiz getOrdersbiz() {
		return ordersbiz;
	}
	public void setOrdersbiz(OrdersBiz ordersbiz) {
		this.ordersbiz = ordersbiz;
	}
	public String getOrderNo() {
		return OrderNo;
	}
	public void setOrderNo(String orderNo) {
		OrderNo = orderNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRandom() {
		return Random;
	}
	public void setRandom(String random) {
		Random = random;
	}
	public EmpBiz getEmpbiz() {
		return empbiz;
	}
	public void setEmpbiz(EmpBiz empbiz) {
		this.empbiz = empbiz;
	}
	public IntegralTypeBiz getIntegraltypeBiz() {
		return integraltypeBiz;
	}
	public void setIntegraltypeBiz(IntegralTypeBiz integraltypeBiz) {
		this.integraltypeBiz = integraltypeBiz;
	}
	public IntegralscheduleBiz getIntegralscheduleBiz() {
		return integralscheduleBiz;
	}
	public void setIntegralscheduleBiz(IntegralscheduleBiz integralscheduleBiz) {
		this.integralscheduleBiz = integralscheduleBiz;
	}
	public String getCommoSum() {
		return commoSum;
	}
	public void setCommoSum(String commoSum) {
		this.commoSum = commoSum;
	}
	
}
