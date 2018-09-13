package com.Integralmall.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.emp;
import com.Integralmall.entity.integral;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.integralschedule;
import com.Integralmall.entity.integraltype;

/*
 * 积分明细dao
 */
public class IntegralscheduleDao {
	private HibernateTemplate hibernateTemplate;
	//增加积分明细
	public void AddIntegralaudit(integralschedule inte){
		System.out.println(inte.getIntergralchange());
		hibernateTemplate.save(inte);
	}
	public ArrayList<integralschedule> findRestIntegral(int empno){
		ArrayList<integralschedule> ilist=(ArrayList<integralschedule>) hibernateTemplate.find("from integralschedule i where i.empno.empno=?",empno);
		return ilist;
	}
	//修改积分明细
	public void UpdateIntegralaudit(integralschedule inte){
		hibernateTemplate.update(inte);
	}
	//删除积分明细
	public void DeleIntegralaudit(integralschedule inte){
		hibernateTemplate.delete(inte);
	}
	//查看积分明细
	public ArrayList<integralschedule> findIntegralaudit(String scName,String scData){
		String hql="from integralschedule i where 1=1 ";
		System.out.println(scName+"========Dao");
		if (scName!=null&&!"".equals(scName)) {
			hql+="and i.empno.empname like '%"+scName+"%'";
		}
		if (scData!=null&&!"".equals(scData)) {
			hql+=" and to_char(i.changedate,'yyyy-mm-dd') = '"+scData+"'";
		}
		ArrayList<integralschedule> inte=(ArrayList<integralschedule>) hibernateTemplate.find(hql);
		return inte;
	}
	//
	public integralschedule findIntegralno(Integer no) {
		integralschedule in=(integralschedule) hibernateTemplate.find("from integralschedule i where i.intergralscheduleno=?",no).get(0);
		return in;
	}
	//根据时间最大值查询考核人数
	public ArrayList<Object> finddatekaohe(){
		ArrayList<Object> olist=(ArrayList<Object>) hibernateTemplate.getSessionFactory().openSession().createSQLQuery("SELECT empno FROM (SELECT T.changedate,  T.empno, ROW_NUMBER() OVER(PARTITION BY T.empno ORDER BY T.changedate DESC) RN    FROM integralschedule T where T.integraltypeno=12 and T.changedate > trunc(sysdate, 'MM')) WHERE RN <= 1").list();
		//ArrayList<emp> elist=(ArrayList<emp>) hibernateTemplate.getSessionFactory().openSession().createSQLQuery("SELECT empno FROM (SELECT T.changedate,  T.empno, ROW_NUMBER() OVER(PARTITION BY T.empno ORDER BY T.changedate DESC) RN    FROM integralschedule T where T.integraltypeno=12 and T.changedate > trunc(sysdate, 'MM')) WHERE RN <= 1;").list();
		       /* hibernateTemplate.getSessionFactory().openSession().createSQLQuery("SELECT empno\r\n" + 
				"  FROM (SELECT T.changedate,\r\n" + 
				"               T.empno,\r\n" + 
				"               ROW_NUMBER() OVER(PARTITION BY T.empno ORDER BY T.changedate DESC) RN\r\n" + 
				"          FROM integralschedule T where T.integraltypeno=12 and T.changedate > trunc(sysdate, 'MM'))\r\n" + 
				" WHERE RN <= 1;").list();*/
		for (Object object : olist) {
			System.out.println(object);
		}
		return (ArrayList<Object>) olist;
		
	}
	public Integer findCount() {
		Integer integralschedule=hibernateTemplate.find("from integralschedule where integraltypeno=21").size();
		return integralschedule;
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
