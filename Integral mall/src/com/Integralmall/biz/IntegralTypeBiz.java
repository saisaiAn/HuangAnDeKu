package com.Integralmall.biz;

import java.util.ArrayList;

import com.Integralmall.dao.IntegralDao;
import com.Integralmall.dao.IntegralTypeDao;
import com.Integralmall.entity.integraltype;

public class IntegralTypeBiz {
	private IntegralTypeDao integraltypedao;
	//增加积分类型
	public void AddIntegralType(integraltype inte){
		integraltypedao.AddIntegralType(inte);
	}
	//修改积分类型
	public void UpdateIntegralType(integraltype inte){
		integraltypedao.UpdateIntegralType(inte);
	}
	//删除积分类型
	public void DeleIntegralType(integraltype inte){
		integraltypedao.DeleIntegralType(inte);
	}
	//查看积分类型
	public ArrayList<integraltype> findIntegralType(){
		return integraltypedao.findIntegralType();
	}
	public integraltype find (Integer integraltypeNo) {
		return integraltypedao.find(integraltypeNo);
	}
	public IntegralTypeDao getIntegraltypedao() {
		return integraltypedao;
	}
	public void setIntegraltypedao(IntegralTypeDao integraltypedao) {
		this.integraltypedao = integraltypedao;
	}
	
	
}
