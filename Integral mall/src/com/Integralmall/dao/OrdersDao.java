package com.Integralmall.dao;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.emp;
import com.Integralmall.entity.orders;

public class OrdersDao {
	private HibernateTemplate hibernateTemplate;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	//添加订单
	public int AddOrders(orders orders) {
		return (int) hibernateTemplate.save(orders);
	}
	//条件查询
	public ArrayList<orders> find(String ssEmpname,String ssData) {
		String hql="from orders e where 1=1 ";
		System.out.println(ssEmpname+"=====================================================================");
		if (ssEmpname!=null&&!"".equals(ssEmpname)) {
			hql+="and e.orderno="+ssEmpname;
		}
		if (ssData!=null&&!"".equals(ssData)) {
			hql+=" and to_char(e.ordertime,'yyyy-mm-dd') = '"+ssData+"'";
		}
		System.out.println(hql);
		ArrayList<orders> elist= (ArrayList<orders>) hibernateTemplate.find(hql);
		return elist;
	}
	//查询所有订单
	public ArrayList<orders> findall(){
		ArrayList<orders> olist = (ArrayList<orders>) hibernateTemplate.find("from orders");
		return olist;
	}
	//查询订单 ： 状态查询
	public ArrayList<orders> findTj(int i){
		//i=1:提交
		//i=2:待领取
		//i=3:已领取
		String Hql="from orders where orderstatus="+i;
		ArrayList<orders> olist = (ArrayList<orders>) hibernateTemplate.find(Hql);
		return olist;
	}
	//查询单个订单:通过订单ID
	public orders find(int OrderNo) {
		orders o = (orders) hibernateTemplate.find("from orders o where o.orderno=?",OrderNo).get(0);
		return o;
	}
	//查询单个订单:通过用户ID
	public ArrayList<orders> findemp(emp empno) {
		System.out.println(empno);
		ArrayList<orders> olist = (ArrayList<orders>)hibernateTemplate.find("from orders o where o.empno=?",empno);
		return olist;
	}
	//查询单个订单:通过兑换码
		public orders find(String random) {
			orders o=null;
			if(hibernateTemplate.find("from orders o where o.random=?",random).size()>0) {
				o = (orders)hibernateTemplate.find("from orders o where o.random=?",random).get(0);
			}
			return o;
		}
	//修改
	public void Updorder(orders o) {
		hibernateTemplate.update(o);
	}
	//删除
	public void Delorder(orders o) {
		hibernateTemplate.update(o);
	}
	public Integer findsum() {
		int integer =Integer.parseInt(hibernateTemplate.find("select count(*) from orders").get(0).toString());
		System.out.println(integer);
		return integer;
	}
	public Integer findTj() {
		int integer =Integer.parseInt(hibernateTemplate.find("select count(*) from orders o where o.orderstatus=1").get(0).toString());
		System.out.println(integer);
		return integer;
	}
	public Integer findDlq() {
		int integer =Integer.parseInt(hibernateTemplate.find("select count(*) from orders o where o.orderstatus=2").get(0).toString());
		System.out.println(integer);
		return integer;
	}
	public Integer findYcj() {
		int integer =Integer.parseInt(hibernateTemplate.find("select count(*) from orders o where o.orderstatus=3").get(0).toString());
		System.out.println(integer);
		return integer;
	}
}
