package com.Integralmall.entity;
//商品表

import java.io.Serializable;
import java.util.Set;

public class commodity implements Serializable {
	private Integer commodityno;//CommodityNo number  primary key,--商品编号(?CommodityNo)	Varchar2	20	否	主键	条件自增
	private double price;//price  NUMBER(38,2) not null,--商品价格(price)	Double	10	否		
	private Integer needintegral;//NeedIntegral number not null,--商品所需积分(NeedIntegral)	Number	不限制	否		
	private String commoditytitle;//Commoditytitle varchar2(50) not null,--商品标题(Commoditytitle)	Varchar2	50	否		
	private String commoditydetails;//Commoditydetails varchar2(300) not null,--商品详情(Commoditydetails)	Varchar2	300	否		商品具体详情
	private Integer commodityinventory;//Commodityinventory number not null,--商品库存(Commodityinventory)	Number	30	否		不可为负，可为零
	private commoditytype commoditytypeno;//CommodityTypeNo number not null--商品分类编号(CommodityTypeNo)	Number	30	否	外键	链接商品分类表
	private Set<commodityreview> commodityreviews;
	private Set<imager> imagers;
	public Integer getCommodityno() {
		return commodityno;
	}
	public void setCommodityno(Integer commodityno) {
		this.commodityno = commodityno;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getNeedintegral() {
		return needintegral;
	}
	public void setNeedintegral(Integer needintegral) {
		this.needintegral = needintegral;
	}
	public String getCommoditytitle() {
		return commoditytitle;
	}
	public void setCommoditytitle(String commoditytitle) {
		this.commoditytitle = commoditytitle;
	}
	public String getCommoditydetails() {
		return commoditydetails;
	}
	public void setCommoditydetails(String commoditydetails) {
		this.commoditydetails = commoditydetails;
	}
	public Integer getCommodityinventory() {
		return commodityinventory;
	}
	public void setCommodityinventory(Integer commodityinventory) {
		this.commodityinventory = commodityinventory;
	}
	public commoditytype getCommoditytypeno() {
		return commoditytypeno;
	}
	public void setCommoditytypeno(commoditytype commoditytypeno) {
		this.commoditytypeno = commoditytypeno;
	}
	public Set<commodityreview> getCommodityreviews() {
		return commodityreviews;
	}
	public void setCommodityreviews(Set<commodityreview> commodityreviews) {
		this.commodityreviews = commodityreviews;
	}
	public Set<imager> getImagers() {
		return imagers;
	}
	public void setImagers(Set<imager> imagers) {
		this.imagers = imagers;
	}
	@Override
	public String toString() {
		return "commodity [commodityno=" + commodityno + ", price=" + price + ", needintegral=" + needintegral
				+ ", commoditytitle=" + commoditytitle + ", commoditydetails=" + commoditydetails
				+ ", commodityinventory=" + commodityinventory + ", commoditytypeno=" + commoditytypeno
				+ ", commodityreviews=" + commodityreviews + "]";
	}
	
}
