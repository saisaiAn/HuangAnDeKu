package com.Integralmall.dao;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.imager;

public class imagerDao {
	private HibernateTemplate hibernateTemplate;
	//查询图片
	public ArrayList<imager> find(String suoshuneix,Integer No){
		ArrayList<imager> ilist=(ArrayList<imager>) hibernateTemplate.find("from imager i where i.imageclassification=? and i.imagerid=?",suoshuneix,No);
		return ilist;
	}
	//查询所有
	public ArrayList<imager> findall(){
		ArrayList<imager> ilist=(ArrayList<imager>) hibernateTemplate.find("from imager");
		return ilist;
	}
	//删除图片
	public void Delimager(imager imager) {
		hibernateTemplate.delete(imager);
	}
	//修改图片
	public void Updimager(imager imager) {
		hibernateTemplate.update(imager);
	}
	//增加图片
	public void Addimager(imager imager) {
		hibernateTemplate.save(imager);
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
}
