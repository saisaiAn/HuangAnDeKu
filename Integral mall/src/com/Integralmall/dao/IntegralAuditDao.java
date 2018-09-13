package com.Integralmall.dao;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.emp;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.integralschedule;
import com.Integralmall.entity.integraltype;

/*
 * 积分审核dao
 */
public class IntegralAuditDao {
	private HibernateTemplate hibernateTemplate;
	//增加积分审核
	public void AddIntegralaudit(integralaudit inte){
		hibernateTemplate.save(inte);
	}
	//修改积分审核
	public void UpdateIntegralaudit(integralaudit inte){
		hibernateTemplate.update(inte);
	}
	//删除积分审核
	public void DeleIntegralaudit(integralaudit inte){
		hibernateTemplate.delete(inte);
	}
	//查看积分审核
	public ArrayList<integralaudit> findIntegralaudit(String scName,String scData){
		String hql="from integralaudit i where 1=1 ";
		if (scName!=null&&!"".equals(scName)) {
			hql+="and i.empno.empname like '%"+scName+"%'";
		}
		if (scData!=null&&!"".equals(scData)) {
			hql+=" and i.changedate=to_date('"+scData+"','yyyy-mm-dd')";
		}
		ArrayList<integralaudit> inte=(ArrayList<integralaudit>) hibernateTemplate.find(hql);
		return inte;
	}
	 
	//审核表查审核人
	public ArrayList<integralaudit> findreviewer(emp emp){
		ArrayList<integralaudit> inte=(ArrayList<integralaudit>) hibernateTemplate.find("from integralaudit i inner join i.empno where i.empno=?",emp);
		return inte;
	}
	//查询审核状态
	public ArrayList<integralaudit> findauditType(){
		ArrayList<integralaudit> inte=(ArrayList<integralaudit>) hibernateTemplate.find("from integralaudit i");
		return inte;
	}
	//查询积分审核类别
	public ArrayList<integralaudit> findIntegraltypeno(){
		ArrayList<integralaudit> inte=(ArrayList<integralaudit>) hibernateTemplate.find("from integralaudit i inner join integraltype inte on i.integraltypeno=inte.integraltypeno");
		return inte;
	}
	//根据id
	public integralaudit findIntegralno(Integer IntegralNo){
		integralaudit inte=(integralaudit) hibernateTemplate.find("from integralaudit where integralauditno=?",IntegralNo).get(0);
		return inte;
	}
	public integralaudit findIntegralDESC(){
		integralaudit inte=(integralaudit) hibernateTemplate.find("from integralaudit where rownum=1 order by integralauditno desc").get(0);
		return inte;
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
