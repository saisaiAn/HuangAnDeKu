package com.Integralmall.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.commoditytype;

public class CommodityTypeDao {
	private HibernateTemplate hibernateTemplate;
	//��ѯ��Ʒ����
	public ArrayList<commoditytype> findAllCommodityType(){
		ArrayList<commoditytype> coo=(ArrayList<commoditytype>) hibernateTemplate.find("from commoditytype");
		return coo;
	}
	//������Ʒ����
	public void AddCommodityType(commoditytype comm){
		hibernateTemplate.save(comm);
	}
	//�޸���Ʒ����
	public void UpdateCommodityType(commoditytype comm){
		hibernateTemplate.update(comm);
	}
	//ɾ����Ʒ����
	public void DelectCommodityType(commoditytype comm){
		hibernateTemplate.delete(comm);
	}
	//��ѯ�ϼ�����
	public commoditytype findSuperCommodityType(commoditytype comm){
		commoditytype commtype= (commoditytype) hibernateTemplate.find("from commoditytype c where c.commodityTypeNo=(select a.supercommoditytype from commoditytype a where a.commodityTypeNo=?)",comm.getCommodityTypeNo()).get(0);
		System.out.println(commtype.getCommodityTypeNo());
		return commtype;
	} 
	public List<commoditytype> findSonCommodityType(commoditytype comm){
		//ArrayList<commoditytype> commtype= (ArrayList<commoditytype>) hibernateTemplate.find("from commoditytype c where c.supercommoditytype=?",comm.getCommodityTypeNo());
		
		List<commoditytype> clist = hibernateTemplate.execute(new HibernateCallback<List<commoditytype>>() {
			@Override
			public List<commoditytype> doInHibernate(Session session) throws HibernateException, SQLException {
				String hql ="from commoditytype c where c.supercommoditytype=:aaa";
				Query query = session.createQuery(hql).setLong("aaa", comm.getCommodityTypeNo());
				return query.list();
			}
		});
		
		return clist;
	}
	
	
	
	public commoditytype findCommodityType(Integer commoditytypeno){
		commoditytype commtype= (commoditytype) hibernateTemplate.find("from commoditytype c where c.commodityTypeNo=?",commoditytypeno).get(0);
		return commtype;
	} 
	public ArrayList<commoditytype> findCommodityTypeRank(Integer commodityRank){
		ArrayList<commoditytype> commtype= (ArrayList<commoditytype>) hibernateTemplate.find("from commoditytype c where c.commodityrank=?",commodityRank);
		return commtype;
	} 
	//��ѯ���ͼ���
	public Integer findtypeCommodityType(commoditytype comm){
		Integer i=Integer.parseInt(hibernateTemplate.find("select a.commodityrank from commoditytype a where a.commodityTypeNo=?",comm.getCommodityTypeNo()).toString());
		return i;
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
