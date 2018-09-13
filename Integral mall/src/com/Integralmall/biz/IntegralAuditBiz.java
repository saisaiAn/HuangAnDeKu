package com.Integralmall.biz;

import java.util.ArrayList;

import com.Integralmall.dao.IntegralAuditDao;
import com.Integralmall.dao.IntegralDao;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.integralaudit;

public class IntegralAuditBiz extends IntegralAuditDao {
	private IntegralAuditDao integralauditdao;
	//增加积分类型
	public void AddIntegralaudit(integralaudit inte){
		integralauditdao.AddIntegralaudit(inte);
	}
	//修改积分类型
	public void UpdateIntegralaudit(integralaudit inte){
		integralauditdao.UpdateIntegralaudit(inte);
	}
	//删除积分类型
	public void DeleIntegralaudit(integralaudit inte){
		integralauditdao.DeleIntegralaudit(inte);
	}
	//查询所有积分审核数据
	public ArrayList<integralaudit> findIntegralaudit(String scName,String scData){
		return integralauditdao.findIntegralaudit(scName, scData);
	}
	//审核表查审核人
		public ArrayList<integralaudit> findreviewer(emp emp){
			return integralauditdao.findreviewer(emp);
		}
		//查询审核状态
		public ArrayList<integralaudit> findauditType(){
			return integralauditdao.findauditType();
		}
		//查询积分审核类别
		public ArrayList<integralaudit> findIntegraltypeno(){
			return integralauditdao.findIntegraltypeno();
		}
		
		public integralaudit findIntegralno(Integer IntegralNo){
			return integralauditdao.findIntegralno(IntegralNo);
		}
		public integralaudit findIntegralDESC(){
			return integralauditdao.findIntegralDESC();
		}
	public IntegralAuditDao getIntegralauditdao() {
		return integralauditdao;
	}
	public void setIntegralauditdao(IntegralAuditDao integralauditdao) {
		this.integralauditdao = integralauditdao;
	}
	
	
	
	
}
