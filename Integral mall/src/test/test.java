package test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Random;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.Integralmall.biz.CommodityBiz;
import com.Integralmall.biz.CommodityTypeBiz;
import com.Integralmall.biz.DepartmentBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.IntegralAuditBiz;
import com.Integralmall.biz.IntegralTypeBiz;
import com.Integralmall.biz.integralBiz;
import com.Integralmall.dao.DepartmentDao;
import com.Integralmall.entity.commodity;
import com.Integralmall.entity.commoditytype;
import com.Integralmall.entity.department;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.integral;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.integraltype;


public class test {
	public static void main(String[] args) {
		 String str="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		    //由Random生成随机数
		        Random random=new Random();  
		        StringBuffer sb=new StringBuffer();
		        //长度为几就循环几次
		        for(int i=0; i<10; ++i){
		          //产生0-61的数字
		          int number=random.nextInt(62);
		          //将产生的数字通过length次承载到sb中
		          sb.append(str.charAt(number));
		        }
		        System.out.println(sb);
	/*	ApplicationContext atx=new ClassPathXmlApplicationContext("applicationContext.xml");
		IntegralAuditBiz dd= (IntegralAuditBiz) atx.getBean("IntegralauditBiz");
		ArrayList<integralaudit> dlist=dd.findauditType();
	for (integralaudit integralaudit : dlist) {
		System.out.println(integralaudit);
	}*/
//		integralaudit inte=new integralaudit();
//		EmpBiz empbiz=new EmpBiz();
//		inte.setEmpno(empbiz.findlogin("admin", "admin"));
//		inte.setIntergralchange("太王八了");
//		inte.setChangenumber(-100000);
//		inte.setReviewer(empbiz.findlogin("admin", "admin"));
//		inte.setIntegraltypeno(new IntegralTypeBiz().findIntegralType().get(0));
//		inte.setAudittype(2);
//		inte.setAuditopinion("批准，再扣20000");
//		dd.AddIntegralaudit(inte);
//		
//		System.out.println("===="+ctb.findCommodityType(21).getCommoditytypeno());
//		commodity.setCommoditytypeno(ctb.findCommodityType(21));
//		cc.AddCommdity(commodity);
		/*DepartmentBiz dd= (DepartmentBiz) atx.getBean("departmentBiz");
		ArrayList<department> dlist=dd.findall();
		for (department department : dlist) {
			System.out.println(department);
		}*/
		/*EmpBiz eb=(EmpBiz) atx.getBean("empBiz");
		ArrayList<emp> elist=eb.findall();
		for (emp emp : elist) {
			System.out.println(emp);
		}*/
		/*Transaction t=null;
		try {	
			 t=HibernateUtil.currentSession().beginTransaction();
			 Session session=HibernateUtil.currentSession();
		}catch (Exception e) {
			e.printStackTrace();
		}*/
		/*String[] student= {"卢中杰","李雄杰","何佳乐","刘崇","周承冬","游俊","谭旭涛","李征文","付佳成","尹运灿","肖铖胜","唐苗","周亮","张家恺","尹瑶棋","周伟","曾敬伟","匡广腾","旷文亮","胡贵","廖超","谈乐","唐朝",
				"贺威","黄安","袁永捷","戴功磊","杨威杰","曾香","袁烨","杨向丽","谢敏","彭倩","方川南","彭早早","卢毅","肖柳铰","苏庆"};
		Random r=new Random();
		for (int i = 0; i < 8; i++) {
			System.out.print(student[r.nextInt(38)]+"\t");
		}*/
	}
}
