package com.Integralmall.entity;

import java.io.Serializable;
import java.sql.Timestamp;

//订单表
public class orders implements Serializable {
	private Integer orderno;// OrderNo number primary key,--订单编号(?OrderNo)	Number	30	否	主键	自增
	private String  orderintegral;// OrderIntegral varchar2(10) not null,--订单所用积分(OrderIntegral)	Varchar2	10	否		
	private commodity ordercommodityno;//  OrderCommodityNo number not null,--订单商品(OrderCommodityNo)	Varchar2	20	否	外键
	private Timestamp ordertime;//  OrderTime timestamp not null,--订单生成时间(OrderTime)	Date		否		
	private Integer orderstatus;//  OrderStatus number not null,--订单状态(OrderStatus)	Number	1	否		1为已提交 2为待领取 3为已领取
	private emp empno;//  EmpNo number --下单人(EmpNo)	Varchar2	30	否
	private String random;
	private Integer commoditySum;
	public Integer getOrderno() {
		return orderno;
	}
	public void setOrderno(Integer orderno) {
		this.orderno = orderno;
	}
	public String getOrderintegral() {
		return orderintegral;
	}
	public void setOrderintegral(String orderintegral) {
		this.orderintegral = orderintegral;
	}
	public commodity getOrdercommodityno() {
		return ordercommodityno;
	}
	public void setOrdercommodityno(commodity ordercommodityno) {
		this.ordercommodityno = ordercommodityno;
	}
	
	public String getRandom() {
		return random;
	}
	public void setRandom(String random) {
		this.random = random;
	}
	public Timestamp getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Timestamp ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}
	public emp getEmpno() {
		return empno;
	}
	public void setEmpno(emp empno) {
		this.empno = empno;
	}
	
	public Integer getCommoditySum() {
		return commoditySum;
	}
	public void setCommoditySum(Integer commoditySum) {
		this.commoditySum = commoditySum;
	}
	public orders(Integer orderno, String orderintegral, commodity ordercommodityno, Timestamp ordertime,
			Integer orderstatus, emp empno) {
		super();
		this.orderno = orderno;
		this.orderintegral = orderintegral;
		this.ordercommodityno = ordercommodityno;
		this.ordertime = ordertime;
		this.orderstatus = orderstatus;
		this.empno = empno;
	}
	public orders() {
		super();
	}
	@Override
	public String toString() {
		return "orders [orderno=" + orderno + ", orderintegral=" + orderintegral + ", ordercommodityno="
				+ ordercommodityno + ", ordertime=" + ordertime + ", orderstatus=" + orderstatus + ", empno=" + empno
				+ "]";
	}
	
}
