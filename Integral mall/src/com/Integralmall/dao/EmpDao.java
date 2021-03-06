package com.Integralmall.dao;

import java.util.ArrayList;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.Integralmall.entity.department;
import com.Integralmall.entity.emp;

public class EmpDao {
	private HibernateTemplate hibernateTemplate;
	//查询所有员工
	public ArrayList<emp> findall() {
		ArrayList<emp> elist= (ArrayList<emp>) hibernateTemplate.find("FROM emp");
		return elist;
	}
	//查询部门员工
	public ArrayList<emp> findal(department department){
		ArrayList<emp> elist= (ArrayList<emp>) hibernateTemplate.find("from emp e inner join department d on e.departmentno = d.depano where e.departmentno=?",department.getDepano());
		return elist;	
	}
	public emp find(Integer empno) {
		ArrayList<emp> elist= (ArrayList<emp>) hibernateTemplate.find("from emp e where e.empno=?",empno);
		emp e=null;
		if(elist.size()>0) {
			e=elist.get(0);
		}
		return e;
	}
	public ArrayList<emp> find(String ssEmpname,String ssData) {
		String hql="from emp e where 1=1 ";
		if (ssEmpname!=null&&!"".equals(ssEmpname)) {
			hql+="and e.empname like '%"+ssEmpname+"%'";
		}
		if (ssData!=null&&!"".equals(ssData)) {
			hql+=" and to_char(e.positivedates,'yyyy-mm-dd') = '"+ssData+"'";
		}
		ArrayList<emp> elist= (ArrayList<emp>) hibernateTemplate.find(hql);
		return elist;
	}
	//登陆方法
	public emp findlogin(String username ,String password) {
		ArrayList<emp> elist= (ArrayList<emp>) hibernateTemplate.find("from emp e where e.username=? and e.password=?",username,password);
		emp e=null;
		if(elist.size()>0) {
			e=elist.get(0);
		}
		return e;
	}
	public Integer findsum() {
		int integer=  Integer.parseInt(hibernateTemplate.find("select count(*) from emp").get(0).toString()) ;
		return integer;
	}
	public boolean findUsername(String username) {
		int integer=  Integer.parseInt(hibernateTemplate.find("select count(*) from emp p where p.username=?",username).get(0).toString()) ;
		return integer>0;
	}
	//添加方法
	public Integer AddEmp(emp emp) {
		return Integer.parseInt( hibernateTemplate.save(emp).toString());
	}
	//修改方法
	public void UpdEmp(emp emp) {
		hibernateTemplate.update(emp);
	}
	public void DelEmp(emp emp) {
		hibernateTemplate.delete(emp);
	}
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
}
