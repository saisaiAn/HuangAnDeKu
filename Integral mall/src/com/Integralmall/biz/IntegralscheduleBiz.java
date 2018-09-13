package com.Integralmall.biz;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.dao.IntegralscheduleDao;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.integral;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.integralschedule;
import com.Integralmall.entity.integraltype;

/*
 * 积分明细dao
 */
public class IntegralscheduleBiz {
	private IntegralscheduleDao integralscheduleDao;
	//增加积分明细
	public void AddIntegralaudit(integralschedule inte){
		integralscheduleDao.AddIntegralaudit(inte);
	}
	public ArrayList<integralschedule> findRestIntegral(int empno){
		return integralscheduleDao.findRestIntegral(empno);
	}
	//修改积分明细
	public void UpdateIntegralaudit(integralschedule inte){
		integralscheduleDao.UpdateIntegralaudit(inte);
	}
	//删除积分明细
	public void DeleIntegralaudit(integralschedule inte){
		integralscheduleDao.DeleIntegralaudit(inte);
	}
	//查看积分明细
	public ArrayList<integralschedule> findIntegralschedule(String scName,String scData){
		return integralscheduleDao.findIntegralaudit(scName, scData);
	}
	public integralschedule findIntegralno(Integer no) {
		return integralscheduleDao.findIntegralno(no);
	}
	public ArrayList<Object> finddatekaohe(){
		ArrayList<Object> elist=integralscheduleDao.finddatekaohe();
		return elist;
		
	}
	public Integer findCount() {
		return integralscheduleDao.findCount();
	}
	public IntegralscheduleDao getIntegralscheduleDao() {
		return integralscheduleDao;
	}
	public void setIntegralscheduleDao(IntegralscheduleDao integralscheduleDao) {
		this.integralscheduleDao = integralscheduleDao;
	}
	 
	
}
