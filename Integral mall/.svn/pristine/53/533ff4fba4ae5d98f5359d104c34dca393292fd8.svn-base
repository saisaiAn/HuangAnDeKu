package com.Integralmall.entity;

import java.io.Serializable;

//图片表
public class imager implements Serializable {
	private Integer imagerno;//imagerNo number primary key,--图片编号(?imagerNo)	Number	30	否	主键	自增
	private String imagerurl;//imagerUrl varchar2(300) not null,--图片路径(imagerUrl)	Varchar2	10	否		
	private String imageclassification;//Imageclassification varchar2(20) not null,--图片所属类型(Imageclassification)	Varchar2	20	否		用于区分图片用途
	private String imagerdescription;//ImagerDescription varchar2(300) ,--图片描述(imagerDescription)	Varchar2	300	是		
	private Integer imagerid;//ImagerId number--图片所属编号(ImagerId)	Varchar2	30
	public imager(Integer imagerno, String imagerurl, String imageclassification, String imagerdescription,
			Integer imagerid) {
		super();
		this.imagerno = imagerno;
		this.imagerurl = imagerurl;
		this.imageclassification = imageclassification;
		this.imagerdescription = imagerdescription;
		this.imagerid = imagerid;
	}
	public imager() {
		super();
	}
	public Integer getImagerno() {
		return imagerno;
	}
	public void setImagerno(Integer imagerno) {
		this.imagerno = imagerno;
	}
	public String getImagerurl() {
		return imagerurl;
	}
	public void setImagerurl(String imagerurl) {
		this.imagerurl = imagerurl;
	}
	public String getImageclassification() {
		return imageclassification;
	}
	public void setImageclassification(String imageclassification) {
		this.imageclassification = imageclassification;
	}
	public String getImagerdescription() {
		return imagerdescription;
	}
	public void setImagerdescription(String imagerdescription) {
		this.imagerdescription = imagerdescription;
	}
	public Integer getImagerid() {
		return imagerid;
	}
	public void setImagerid(Integer imagerid) {
		this.imagerid = imagerid;
	}
	
}
