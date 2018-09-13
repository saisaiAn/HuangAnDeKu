package com.Integralmall.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Set;

//积分表
public class integral implements Serializable {
	private Integer intergralno;//IntergralNo number primary key,--积分编号(intergralNo)	Varchar2	20	否	主键	通过员工表的积分字段链接
	private Integer totalintegral;//TotalIntegral number  not null,--总积分(totalIntegral)	Number	300	否		不可为负，可为零
	private Integer haveintegral;//HaveIntegral number not null,--已用积分(HaveIntegral)	Number	不限制	否		不可为负，可为零
	private Integer remainingpoints;//RemainingPoints number not null,--剩余积分(remainingPoints)	Number		否		不可为负，可为零
	private Timestamp lastchangetime;//LastChangeTime timestamp not null--最后积分变动时间(lastChangeTime)	Time		否		用于具体查询
	private emp emp;
	private Set<integralschedule> integralschedules;
	public Integer getIntergralno() {
		return intergralno;
	}
	public void setIntergralno(Integer intergralno) {
		this.intergralno = intergralno;
	}
	public Integer getTotalintegral() {
		return totalintegral;
	}
	public void setTotalintegral(Integer totalintegral) {
		this.totalintegral = totalintegral;
	}
	public Integer getHaveintegral() {
		return haveintegral;
	}
	public void setHaveintegral(Integer haveintegral) {
		this.haveintegral = haveintegral;
	}
	public Integer getRemainingpoints() {
		return remainingpoints;
	}
	public void setRemainingpoints(Integer remainingpoints) {
		this.remainingpoints = remainingpoints;
	}
	public Timestamp getLastchangetime() {
		return lastchangetime;
	}
	public void setLastchangetime(Timestamp lastchangetime) {
		this.lastchangetime = lastchangetime;
	}
	public Set<integralschedule> getIntegralschedules() {
		return integralschedules;
	}
	public void setIntegralschedules(Set<integralschedule> integralschedules) {
		this.integralschedules = integralschedules;
	}
	public emp getEmp() {
		return emp;
	}
	public void setEmp(emp emp) {
		this.emp = emp;
	}
}
