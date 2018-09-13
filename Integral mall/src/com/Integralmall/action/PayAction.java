package com.Integralmall.action;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.IntegralAuditBiz;
import com.Integralmall.biz.IntegralTypeBiz;
import com.Integralmall.biz.IntegralscheduleBiz;
import com.Integralmall.biz.integralBiz;
import com.Integralmall.entity.Pay;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.integral;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.integralschedule;
import com.opensymphony.xwork2.ActionSupport;



import test.HttpsRequest;
import test.Sign;
import test.Util;
// http://gjynewer.qicp.io:57914/weixinzhifu/pay-pay.action
// 一定要开启花生壳软件 采用以上的域名
public class PayAction extends ActionSupport implements RequestAware {
	private String docVlGender;
	private String userNo;
	private EmpBiz empbiz;
	private integralBiz integralbiz;
	private IntegralscheduleBiz integralschedulebiz;
	private IntegralTypeBiz integralTypebiz;
	private IntegralAuditBiz integralAuditBiz;
	
    private Map<String, Object> request;
	
	 public Map<String, Object> getRequest() {
		return request;
	}

	
	 public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
	}
 
	
	
public  void pay() throws IOException{	//3：
			String Key ="06ac5788d4096164d55c6ec4b1a5a489";
			String appid = "wx9b2de5f5e481c6c6";//appid,mch_id,Key这些都需要微信支付官方文档提供
			String mch_id = "1493285492";
			String  spbill_create_ip="49.221.62.131";//终端ip 随机可以写一个
			String body = "测试微商城";
			String trade_type = "NATIVE";//NATIVE 表示扫码支付//?userNo="+userNo+"&docVlGender="+docVlGender
			System.out.println(userNo+"========"+docVlGender);
			ServletActionContext.getRequest().getSession().setAttribute("userNo",userNo );
			ServletActionContext.getRequest().getSession().setAttribute("docVlGender",docVlGender );
			String notify_url ="http://21917g73x4.imwork.net/Integral_mall/pay/pay-huidao.action";//通知地址 使用花生壳 必须需要 内网与外网的映射
			//若要启用支付金额，请复制：Integer.parseInt(docVlGender)*100，将下方数字 1 替换；
			int total_fee =1;
			String nonce_str=Util.getRandomString(20);//随机字符串
			String out_trade_no=Util.getCurrTime()+Util.getRandomString(4);//订单号
			SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();	
			     parameters.put("appid",appid);
				 parameters.put("mch_id",mch_id);
				 parameters.put("body",body);
				 parameters.put("spbill_create_ip",spbill_create_ip);
				 parameters.put("trade_type",trade_type);
				 parameters.put("notify_url",notify_url);
				 parameters.put("nonce_str",nonce_str);
				 parameters.put("out_trade_no",out_trade_no);
				 parameters.put("total_fee",total_fee);
				 //parameters.put("EmpNo",userNo);
				 String sign=Sign.Sign(parameters, Key);
		
			 Pay pay=new Pay();
			 pay.setAppid(appid);
			 pay.setBody(body);
			 pay.setMch_id(mch_id);
			 pay.setNonce_str(nonce_str);
			 pay.setNotify_url(notify_url);
			 pay.setOut_trade_no(out_trade_no);
			 pay.setSign(sign);
			 pay.setSpbill_create_ip(spbill_create_ip);
			 pay.setTotal_fee(total_fee);
			 pay.setTrade_type(trade_type);
			test.XSteram.xstream .alias("xml",Pay.class);
		   String reqXml=test.XSteram.xstream.toXML(pay);
		    reqXml= reqXml.replaceAll("__", "_");
			  System.out.println(reqXml);
			String respxml=null;
			String requestUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	
			  try {
				 respxml=test.HttpsRequest.httpsRequest(requestUrl, "POST",reqXml);//发送一个https请求，把统一下单的reqXml发送到requestUrl 进行验证
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		  System.out.println("respxml:"+respxml); 
		  System.out.println("jiage"+docVlGender);
			String codeurl=null;
			try {
				Document doc=DocumentHelper.parseText(respxml);//进行验证后 成功后 才能找到code_url
				Element root=doc.getRootElement();
				List<Element>elementList=root.elements();
				for (int i = 0; i < elementList.size(); i++) {
					
					if(elementList.get(i).getName().equals("code_url")){
					codeurl=elementList.get(i).getTextTrim();
					
					}
				}
				integralaudit integralaudit=new integralaudit();
				integralaudit.setEmpno(empbiz.find(Integer.parseInt(userNo)));
				integralaudit.setReviewer(empbiz.find(80));
				integralaudit.setAudittype(1);
				integralaudit.setChangenumber(Integer.parseInt(docVlGender));
				integralaudit.setAuditopinion("钱多任性");
				integralaudit.setIntergralchange("钱多任性");
				integralaudit.setIntegraltypeno(integralTypebiz.find(21));
				integralAuditBiz.AddIntegralaudit(integralaudit);
			} catch (DocumentException e) {
				e.printStackTrace();
			}

			

	
	String codeapiUrl="http://qr.liantu.com/api.php?bg=f3f3f3&fg=ff0000&gc=222222&el=l&w=200&m=2&text=URL";
	
	String ercodeUrl=codeapiUrl.replaceAll("URL", codeurl);//生成一个收钱的二维码
	
	System.out.println("===================" + codeurl);
	request.put("ercodeUrl", ercodeUrl);
	HttpServletResponse response=ServletActionContext.getResponse();
	response.setContentType("text/html;charset=UTF-8"); 
	PrintWriter out = response.getWriter();
	out.println(ercodeUrl);
	out.close();
		 //return "pay";

}

public void huidao() throws Exception{
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpServletResponse   response = ServletActionContext.getResponse();         
    InputStream inputStream = null;
    inputStream = request.getInputStream(); 
    StringBuffer sb=new StringBuffer();
    BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));  
    String s;
    while ((s = in.readLine()) != null){  
        sb.append(s);  
    }  
    in.close();  
    inputStream.close();  
   
   String respxml=sb.toString();
   System.out.println("respxml"+respxml);
   String code;
   Document doc=DocumentHelper.parseText(respxml);
	Element root=doc.getRootElement();
	List<Element>elementList=root.elements();
	String pd="N";
	for (int i = 0; i < elementList.size(); i++) {
		if(elementList.get(i).getName().equals("sign")) {
			System.out.println(elementList.get(i).getTextTrim()+"ddddd");
		}
		if(elementList.get(i).getName().equals("result_code")){
			code=elementList.get(i).getTextTrim();
			
			if(code.equals("SUCCESS")){
				//System.out.println(elementList.get(i).getName().);
				/*String resXml = "<xml>" +"<return_code><![CDATA[SUCCESS]]></return_code>"  
						+ "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";  
						 //HttpServletResponse   response = ServletActionContext.getResponse();         
						BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
						out.write(resXml.getBytes());  
						//out.("回复成功");
						out.flush(); 
						out.close();  */
				//return SUCCESS;
				/*response.getWriter().println("ok");
				response.getWriter().close();*/
				integralaudit integralaudit = integralAuditBiz.findIntegralDESC();
				emp emp=integralaudit.getEmpno();
				integralschedule integralschedule=new integralschedule();
				Integer empno=emp.getEmpno();
				integral integral=integralbiz.findRestIntegral(empno);
				integralschedule.setChangenumber(integralaudit.getChangenumber()/10);//变更积分数
				integralschedule.setEmpno(emp);//申请人
				integralschedule.setReviewer(empbiz.find(80));//审核人
				integralschedule.setIntegraltypeno(integralTypebiz.find(21));//积分类型
				integralschedule.setIntergralchange("充值"+integralaudit.getChangenumber()+"元");//变动原因
				integralschedule.setIntegralno(integral);//积分表
				java.sql.Timestamp currentDate = new java.sql.Timestamp(System.currentTimeMillis());
				integralschedule.setChangedate(currentDate);
				integral.setTotalintegral(integral.getTotalintegral()+integralschedule.getChangenumber());
				integral.setRemainingpoints(integral.getRemainingpoints()+integralschedule.getChangenumber());
				integral.setLastchangetime(currentDate);
				integralbiz.Update(integral);
				integralschedulebiz.AddIntegralaudit(integralschedule);
				integralAuditBiz.DeleIntegralaudit(integralaudit);
				String resXml = "<xml>" +"<return_code><![CDATA[SUCCESS]]></return_code>"  
				+ "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";  
				BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
				out.write(resXml.getBytes());  
				System.out.println("充值成功");
				out.flush(); 
				out.close();
			
				/*pd="Y";
				//response.sendRedirect("/jsp/index.jsp");
				return;*/
				}
			}
		}
	//return SUCCESS;
	//request.setAttribute("chongziTYpe",pd);
	}
/*emp emp=empbiz.find(Integer.parseInt(userNo));
integralschedule integralschedule=new integralschedule();
Integer empno=Integer.parseInt(userNo);
integral integral=integralbiz.findRestIntegral(empno);
integralschedule.setChangenumber(Integer.parseInt(docVlGender)/10);//变更积分数
integralschedule.setEmpno(emp);//申请人
integralschedule.setReviewer(empbiz.find(80));//审核人
integralschedule.setIntegraltypeno(integralTypebiz.find(21));//积分类型
integralschedule.setIntergralchange("钱多任性！");//变动原因
integralschedule.setIntegralno(integral);//积分表
java.sql.Timestamp currentDate = new java.sql.Timestamp(System.currentTimeMillis());
integralschedule.setChangedate(currentDate);
integral.setTotalintegral(integral.getTotalintegral()+integralschedule.getChangenumber());
integral.setRemainingpoints(integral.getRemainingpoints()+integralschedule.getChangenumber());
integral.setLastchangetime(currentDate);
integralbiz.Update(integral);
integralschedulebiz.AddIntegralaudit(integralschedule);*/

public String getDocVlGender() {
	return docVlGender;
}


public void setDocVlGender(String docVlGender) {
	this.docVlGender = docVlGender;
}


public String getUserNo() {
	return userNo;
}


public void setUserNo(String userNo) {
	this.userNo = userNo;
}


public EmpBiz getEmpbiz() {
	return empbiz;
}


public void setEmpbiz(EmpBiz empbiz) {
	this.empbiz = empbiz;
}


public integralBiz getIntegralbiz() {
	return integralbiz;
}


public void setIntegralbiz(integralBiz integralbiz) {
	this.integralbiz = integralbiz;
}


public IntegralscheduleBiz getIntegralschedulebiz() {
	return integralschedulebiz;
}


public void setIntegralschedulebiz(IntegralscheduleBiz integralschedulebiz) {
	this.integralschedulebiz = integralschedulebiz;
}


public IntegralTypeBiz getIntegralTypebiz() {
	return integralTypebiz;
}


public void setIntegralTypebiz(IntegralTypeBiz integralTypebiz) {
	this.integralTypebiz = integralTypebiz;
}


public IntegralAuditBiz getIntegralAuditBiz() {
	return integralAuditBiz;
}


public void setIntegralAuditBiz(IntegralAuditBiz integralAuditBiz) {
	this.integralAuditBiz = integralAuditBiz;
}



	
}





