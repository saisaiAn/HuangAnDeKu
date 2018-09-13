package com.Integralmall.biz;

import java.util.ArrayList;
import java.util.List;

import com.Integralmall.dao.CommodityTypeDao;
import com.Integralmall.entity.commoditytype;

public class CommodityTypeBiz {
		private CommodityTypeDao commodityTypedao;

		public ArrayList<commoditytype> findAllCommodityType(){
			return commodityTypedao.findAllCommodityType();
		}
		public void AddCommodityType(commoditytype comm){
			commodityTypedao.AddCommodityType(comm);
		}
		public ArrayList<commoditytype> findCommodityTypeRank(Integer commodityRank){
			return commodityTypedao.findCommodityTypeRank(commodityRank) ;
		} 
		public void UpdateCommodityType(commoditytype comm){
			commodityTypedao.UpdateCommodityType(comm);
		}
		public void DelectCommodityType(commoditytype comm){
			commodityTypedao.DelectCommodityType(comm);
		}
		public commoditytype findSuperCommodityType(commoditytype comm){
			return commodityTypedao.findSuperCommodityType(comm);
		} 
		public Integer findtypeCommodityType(commoditytype comm){
			return commodityTypedao.findtypeCommodityType(comm);
		}
		public List<commoditytype> findSonCommodityType(commoditytype comm){
			return commodityTypedao.findSonCommodityType(comm);
		}
		public commoditytype findCommodityType(Integer commoditytypeno){
			commoditytype commtype= commodityTypedao.findCommodityType(commoditytypeno);
			System.out.println("BIZ"+commtype.getCommodityTypeNo());
			return commtype;
		}
	public CommodityTypeDao getCommodityTypedao() {
		return commodityTypedao;
	}

	public void setCommodityTypedao(CommodityTypeDao commodityTypedao) {
		this.commodityTypedao = commodityTypedao;
	}
	
	
}
