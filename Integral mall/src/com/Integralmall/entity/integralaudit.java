package com.Integralmall.entity;

import java.io.Serializable;

//积分审核表
public class integralaudit implements Serializable {
	private Integer integralauditno;// IntegralAuditNo number primary key,--积分审核编号(IntegralAuditNo)	Number	不限制	否	主键	自增
	private emp empno;//  empNo number not null,--员工编号(empNo)	Varchar2	30	否		用于显示具体员工
	private String intergralchange;//  intergralChange varchar2(300) not null,--积分变动原因(intergralChange)	Varchar2	300	否		
	private Integer changenumber;// ChangeNumber number not null,--变更积分的数量(ChangeNumber)	Number	不限制	否		可为负数，用于加减积分
	private emp reviewer;//  reviewer number not null,--审核人(reviewer)	Varchar2	30	否		积分加减的审核人
	private integraltype integraltypeno;//  IntegralTypeNo number not null,--积分变动所属类别(IntegralTypeNo)	Number	30	否	外键	
	private Integer audittype;//  AuditType number not null,--审核状态(AuditType)	Number	2	否		用于判断意见状态
	private String auditopinion;//  AuditOpinion varchar2(300)--审核人意见(AuditOpinion)	Varchar2	300	是		
	public Integer getIntegralauditno() {
		return integralauditno;
	}
	public void setIntegralauditno(Integer integralauditno) {
		this.integralauditno = integralauditno;
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
	public Integer getAudittype() {
		return audittype;
	}
	public void setAudittype(Integer audittype) {
		this.audittype = audittype;
	}
	public String getAuditopinion() {
		return auditopinion;
	}
	public void setAuditopinion(String auditopinion) {
		this.auditopinion = auditopinion;
	}
	public integralaudit(Integer integralauditno, emp empno, String intergralchange, Integer changenumber, emp reviewer,
			integraltype integraltypeno, Integer audittype, String auditopinion) {
		super();
		this.integralauditno = integralauditno;
		this.empno = empno;
		this.intergralchange = intergralchange;
		this.changenumber = changenumber;
		this.reviewer = reviewer;
		this.integraltypeno = integraltypeno;
		this.audittype = audittype;
		this.auditopinion = auditopinion;
	}
	public integralaudit() {
		super();
	}
	@Override
	public String toString() {
		return "integralaudit [integralauditno=" + integralauditno + ", empno=" + empno + ", intergralchange="
				+ intergralchange + ", changenumber=" + changenumber + ", reviewer=" + reviewer + ", integraltypeno="
				+ integraltypeno + ", audittype=" + audittype + ", auditopinion=" + auditopinion + "]";
	}
	
}
