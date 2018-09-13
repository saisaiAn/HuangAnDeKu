package com.Integralmall.biz;

import java.util.ArrayList;

import com.Integralmall.dao.*;
import com.Integralmall.entity.*;
public class OrdersBiz {
	private OrdersDao OrdersDao;

	public OrdersDao getOrdersDao() {
		return OrdersDao;
	}
	public void setOrdersDao(OrdersDao ordersDao) {
		OrdersDao = ordersDao;
	}
		//添加订单
		public int AddOrders(orders orders) {
			return OrdersDao.AddOrders(orders);
		}
		//查询所有订单
		public ArrayList<orders> findall(){
			return OrdersDao.findall();
		}
		//查询订单 ： 状态查询
		public ArrayList<orders> findTj(int i){
			//i=1:提交
			//i=2:待领取
			//i=3:已领取
			return OrdersDao.findTj(i);
		}
		
		//查询单个订单:通过订单ID
		public orders find(int OrderNo) {
			return OrdersDao.find(OrderNo);
		}
		//查询单个订单:通过用户ID
		public ArrayList<orders> findemp(emp empno) {
			return OrdersDao.findemp(empno);
		}
		//查询单个订单:通过兑换码
		public orders find(String random) {
			return OrdersDao.find(random);
		}
		//修改
		public void Updorder(orders o) {
			OrdersDao.Delorder(o);
		}
		public ArrayList<orders> find(String ssEmpname,String ssData) {
			return OrdersDao.find(ssEmpname, ssData);
		}
		//删除
		public void Delorder(orders o) {
			OrdersDao.Delorder(o);
		}
		public Integer findsum() {
			Integer integer = OrdersDao.findsum();
			return integer;
		}
		public Integer findTj() {
			int integer = OrdersDao.findTj();
			System.out.println(integer);
			return integer;
		}
		public Integer findDlq() {
			int integer =OrdersDao.findDlq();
			System.out.println(integer);
			return integer;
		}
		public Integer findYcj() {
			int integer =OrdersDao.findYcj();
			System.out.println(integer);
			return integer;
		}
}
