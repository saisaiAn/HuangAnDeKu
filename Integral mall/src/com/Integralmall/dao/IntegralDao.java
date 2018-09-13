package com.Integralmall.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.*;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean2a;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.commoditytype;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.imager;
import com.Integralmall.entity.integral;

public class IntegralDao {
	private HibernateTemplate hibernateTemplate;
	//积分查询
	public ArrayList<integral> find(){
		ArrayList<integral> ilist=(ArrayList<integral>) hibernateTemplate.find("from integral ");
		return ilist;
	}
	//积分修改
	public void Update(integral integral){
		hibernateTemplate.update(integral);
		/*hibernateTemplate.execute(new HibernateCallback<Integer>() {
			@Override
			public Integer doInHibernate(Session session) throws HibernateException, SQLException {
				String hql="update integral i set i.totalintegral=:totalintegral,i.haveintegral=:haveintegral,i.remainingpoints=:remainingpoints,i.lastchangetime=SYSDATE where i.empno=:emp";	
				Query query=session.createQuery(hql);
				query.setInteger("totalintegral", integral.getTotalintegral());
				query.setInteger("haveintegral", integral.getHaveintegral());
				query.setInteger("remainingpoints", integral.getRemainingpoints());
				query.setInteger("emp", integral.getEmp().getEmpno());
				return query.executeUpdate();
			}
		});*/
	}
	//积分增加
	public void AddIntegral(integral integral){
		hibernateTemplate.save(integral);
	}
	//积分删除
	public void DelectIntegral(integral integral){
		hibernateTemplate.delete(integral);
	}
	//查询总积分
	public ArrayList<integral> findAllIntegral(int empno){
		ArrayList<integral> ilist=(ArrayList<integral>) hibernateTemplate.find("select totalintegral from integral i where i.emp.empno=?",empno);
		return ilist;
	}
	public void DelEmpIntegral(emp emp) {
	hibernateTemplate.execute(new HibernateCallback<Object>() {
			@Override
			public List<commoditytype> doInHibernate(Session session) throws HibernateException, SQLException {
				String hql ="delete from integral i where i.empno = :aaa";
				SQLQuery query=session.createSQLQuery(hql);
				query.setInteger("aaa", emp.getEmpno());
				 int a=query.executeUpdate();
				System.out.println(a+"删除积分");
				return null;
			}
		});
	}
	//查询已用积分
	public ArrayList<integral> findHaveIntegral(int empno){
		ArrayList<integral> ilist=(ArrayList<integral>) hibernateTemplate.find("select haveintegral from integral i where i.emp.empno=?",empno);
		return ilist;
	}
	//查询剩余积分
	public ArrayList<integral> findRestIntegral(int empno){
		ArrayList<integral> ilist=(ArrayList<integral>) hibernateTemplate.find("select remainingpoints from integral i where i.emp.empno=?",empno);
		return ilist;
	}
	public integral findRestIntegral(Integer empno){
		integral ilist=(integral) hibernateTemplate.find("from integral i where i.emp.empno=?",empno).get(0);
		return ilist;
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}