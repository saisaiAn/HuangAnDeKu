package com.Integralmall.entity;

import java.io.Serializable;
import java.sql.Timestamp;

//积分明细表
public class integralschedule implements Serializable {
	private Integer intergralscheduleno;// intergralScheduleNo number primary key,--积分记录编号(intergralScheduleNo)	Number	不限制	否	主键	自增
	private emp empno;//  empNo number not null,--员工编号(empNo)	Varchar2	30	否		用于显示具体员工
	private String intergralchange;//  intergralChange varchar2(300) not null,--积分变动原因(intergralChange)	Varchar2	300	否		
	private Integer changenumber;//  ChangeNumber number not null,--变更积分的数量(ChangeNumber)	Number	不限制	否		可为负数，用于加减积分
	private Timestamp changedate;//  ChangeDate timestamp not null,--积分变动时间(ChangeDate)	Time		否		查询积分具体变动时间
	private integral integralno;//  IntegralNo number not null,--积分表编号(IntegralNo)	Varchar2	20	否		链接积分表，方便查询
	private emp reviewer;//  reviewer number not null,--审核人(reviewer)	Varchar2	30	否		积分加减的审核人
	private integraltype integraltypeno;//  IntegralTypeNo number not null--积分变动所属类别(IntegralTypeNo)	Number	30	否	外键	
	public Integer getIntergralscheduleno() {
		return intergralscheduleno;
	}
	public void setIntergralscheduleno(Integer intergralscheduleno) {
		this.intergralscheduleno = intergralscheduleno;
	}
	public emp getEmpno() {
		return empno;
	}
	public void setEmpno(emp empno) {
		this.empno = empno;
	}
	public String getIntergralchange() {
		return intergralchange;
	}
	public void setIntergralchange(String intergralchange) {
		this.intergralchange = intergralchange;
	}
	public Integer getChangenumber() {
		return changenumber;
	}
	public void setChangenumber(Integer changenumber) {
		this.changenumber = changenumber;
	}
	public Timestamp getChangedate() {
		return changedate;
	}
	public void setChangedate(Timestamp changedate) {
		this.changedate = changedate;
	}
	public integral getIntegralno() {
		return integralno;
	}
	public void setIntegralno(integral integralno) {
		this.integralno = integralno;
	}
	public emp getReviewer() {
		return reviewer;
	}
	public void setReviewer(emp reviewer) {
		this.reviewer = reviewer;
	}
	public integraltype getIntegraltypeno() {
		return integraltypeno;
	}
	public void setIntegraltypeno(integraltype integraltypeno) {
		this.integraltypeno = integraltypeno;
	}
	public integralschedule(Integer intergralscheduleno, emp empno, String intergralchange, Integer changenumber,
			Timestamp changedate, integral integralno, emp reviewer, integraltype integraltypeno) {
		super();
		this.intergralscheduleno = intergralscheduleno;
		this.empno = empno;
		this.intergralchange = intergralchange;
		this.changenumber = changenumber;
		this.changedate = changedate;
		this.integralno = integralno;
		this.reviewer = reviewer;
		this.integraltypeno = integraltypeno;
	}
	public integralschedule() {
		super();
	}
	@Override
	public String toString() {
		return "integralschedule [intergralscheduleno=" + intergralscheduleno + ", empno=" + empno
				+ ", intergralchange=" + intergralchange + ", changenumber=" + changenumber + ", changedate="
				+ changedate + ", integralno=" + integralno + ", reviewer=" + reviewer + ", integraltypeno="
				+ integraltypeno + "]";
	}
	
}
