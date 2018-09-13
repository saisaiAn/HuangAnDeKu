package com.Integralmall.biz;

import java.util.ArrayList;

import com.Integralmall.dao.CommodityDao;
import com.Integralmall.entity.commodity;

public class CommodityBiz{
	private CommodityDao commodityDao;

		public ArrayList<commodity> findAllCommdity(){
			System.out.println("findAllCommdityBiz");
			return commodityDao.findallCommdity();
		}
		//删除
		public void DelectCommdity(commodity commodity){
			commodityDao.DelectCommdity(commodity);
		}
		//增加
		public Integer AddCommdity(commodity commodity){
			return commodityDao.AddCommdity(commodity);
			
		}
		//修改
		public void UpdateCommdity(commodity commodity){
			commodityDao.UpdateCommdity(commodity);
		}
		//高级查询
		public ArrayList<commodity> findhighSelectCommodity(int commoditytypeno,String commoditytitle){
			return commodityDao.findhighSelectCommodity(commoditytypeno, commoditytitle);
		}
		public ArrayList<commodity> findhighSelectCommodity(String commoditytitle){
			ArrayList<commodity> clist =commodityDao.findhighSelectCommodity( commoditytitle);
			for (commodity commodity : clist) {
				System.out.println(commodity);
			}
			return clist;
		}
		//价格查询
		public ArrayList<commodity> findpriceSelect(int price1,int price2){
			return commodityDao.findpriceSelect(price1, price2);
		}
		//查询单个商品根据ID
		public commodity findcommodity(commodity commodity) {
			return commodityDao.findcommodity(commodity);
		}
		public commodity findcommodity(Integer commodityno) {
			return commodityDao.findcommodity(commodityno);
		}
	public CommodityDao getCommodityDao() {
		return commodityDao;
	}

	public void setCommodityDao(CommodityDao commodityDao) {
		this.commodityDao = commodityDao;
	}
	
}
