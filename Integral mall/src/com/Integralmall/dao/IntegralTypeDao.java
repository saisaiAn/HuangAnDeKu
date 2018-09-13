package com.Integralmall.dao;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.integraltype;

public class IntegralTypeDao {
	private HibernateTemplate hibernateTemplate;
	//增加积分类型
	public void AddIntegralType(integraltype inte){
		hibernateTemplate.save(inte);
	}
	//修改积分类型
	public void UpdateIntegralType(integraltype inte){
		hibernateTemplate.update(inte);
	}
	//删除积分类型
	public void DeleIntegralType(integraltype inte){
		hibernateTemplate.delete(inte);
	}
	//查看积分类型
	public ArrayList<integraltype> findIntegralType(){
		ArrayList<integraltype> inte=(ArrayList<integraltype>) hibernateTemplate.find("from integraltype");
		return inte;
	}
	public integraltype find (Integer integraltypeNo) {
		integraltype inte=(integraltype) hibernateTemplate.find("from integraltype where integraltypeno=?",integraltypeNo).get(0);
		return inte;
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
