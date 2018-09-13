package com.Integralmall.dao;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.commodity;

public class CommodityDao {
	private HibernateTemplate hibernateTemplate;
	//��ѯ������Ʒ
	public ArrayList<commodity> findallCommdity(){
		System.out.println("commdityDao");
		ArrayList<commodity> clist=(ArrayList<commodity>) hibernateTemplate.find("from commodity");
		for (commodity commodity : clist) {
			System.out.println(commodity.getCommoditytypeno()+"=="+commodity.getCommodityreviews());
		}
		return clist;
	}
	//ɾ����Ʒ
	public void DelectCommdity(commodity commodity){
		hibernateTemplate.delete(commodity);
	}
	//������Ʒ
	public Integer AddCommdity(commodity commodity){
		System.out.println("���ӷ���");
		return (Integer) hibernateTemplate.save(commodity);
	}
	//�޸���Ʒ
	public void UpdateCommdity(commodity commodity){
		hibernateTemplate.update(commodity);
	}
	//�߼���ѯ������Ʒ���࣬����
	public ArrayList<commodity> findhighSelectCommodity(int commoditytypeno,String commoditytitle){
		System.out.println("commdityDaohigh");
		ArrayList<commodity> colist=(ArrayList<commodity>) hibernateTemplate.find("from commodity c where 1=1 and c.commoditytypeno=? and c.commoditytitle like ?",commoditytypeno,"%"+commoditytitle+"%");
		return colist;
	}
	public ArrayList<commodity> findhighSelectCommodity(String commoditytitle){
		ArrayList<commodity> colist=(ArrayList<commodity>) hibernateTemplate.find("from commodity c where c.commoditytitle like ?","%"+commoditytitle+"%");
		return colist;
	}
	//���ݼ۸��ѯ
	public ArrayList<commodity> findpriceSelect(int price1,int price2){
		ArrayList<commodity> alist=(ArrayList<commodity>) hibernateTemplate.find("from commodity c where c.price between ? and ?",price1,price2);
		return alist;
	}
	public commodity findcommodity(commodity commodity) {
		commodity commodit=(com.Integralmall.entity.commodity) hibernateTemplate.find("from commodity c where c.commodityno=?",commodity.getCommodityno()).get(0);
	return commodit;
	}
	public commodity findcommodity(Integer commodity) {
		commodity commodit=(com.Integralmall.entity.commodity) hibernateTemplate.find("from commodity c where c.commodityno=?",commodity).get(0);
	return commodit;
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
