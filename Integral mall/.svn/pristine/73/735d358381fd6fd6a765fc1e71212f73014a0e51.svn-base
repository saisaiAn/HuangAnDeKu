package com.Integralmall.entity;

import java.io.Serializable;

//商品评论表
public class commodityreview implements Serializable {
	 private Integer commodityreviewno;//CommodityReviewNo number primary key,--商品评论编号(CommodityReviewNo)	Number	不限制	否	主键	
	 private commodity commodityno;//CommodityNo number not null,--评论所属商品编号(CommodityNo)	Varchar2	20	否	外键	
	 private String reviewcontent;//ReviewContent varchar2(300) not null,--评论内容(ReviewContent)	Varchar2	300	否		
	 private emp empno;//EmpNo number not null,--评论员工(EmpNo)	Varchar2	30	否	外键	
	 private String reviewtime;//ReviewTime timestamp not null,--商品评论时间(ReviewTime)	Varchar2	300	否	
	 private imager imagerno;//imagerNo number --商品图片描述(imagerNo)	Number	30
	public Integer getCommodityreviewno() {
		return commodityreviewno;
	}
	public void setCommodityreviewno(Integer commodityreviewno) {
		this.commodityreviewno = commodityreviewno;
	}
	public commodity getCommodityno() {
		return commodityno;
	}
	public void setCommodityno(commodity commodityno) {
		this.commodityno = commodityno;
	}
	public String getReviewcontent() {
		return reviewcontent;
	}
	public void setReviewcontent(String reviewcontent) {
		this.reviewcontent = reviewcontent;
	}
	public emp getEmpno() {
		return empno;
	}
	public void setEmpno(emp empno) {
		this.empno = empno;
	}
	public String getReviewtime() {
		return reviewtime;
	}
	public void setReviewtime(String reviewtime) {
		this.reviewtime = reviewtime;
	}
	public imager getImagerno() {
		return imagerno;
	}
	public void setImagerno(imager imagerno) {
		this.imagerno = imagerno;
	}
	public commodityreview(Integer commodityreviewno, commodity commodityno, String reviewcontent, emp empno,
			String reviewtime, imager imagerno) {
		super();
		this.commodityreviewno = commodityreviewno;
		this.commodityno = commodityno;
		this.reviewcontent = reviewcontent;
		this.empno = empno;
		this.reviewtime = reviewtime;
		this.imagerno = imagerno;
	}
	public commodityreview() {
		super();
	}
	@Override
	public String toString() {
		return "commodityreview [commodityreviewno=" + commodityreviewno + ", commodityno=" + commodityno
				+ ", reviewcontent=" + reviewcontent + ", empno=" + empno + ", reviewtime=" + reviewtime + ", imagerno="
				+ imagerno + "]";
	}
	 
}
