package com.Integralmall.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.StringUtils;

import com.Integralmall.biz.CommodityBiz;
import com.Integralmall.biz.CommodityTypeBiz;
import com.Integralmall.biz.DepartmentBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.OrdersBiz;
import com.Integralmall.biz.imagerBiz;
import com.Integralmall.entity.commodity;
import com.Integralmall.entity.commoditytype;
import com.Integralmall.biz.integralBiz;
import com.Integralmall.entity.department;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.imager;
import com.Integralmall.entity.integral;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.orders;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionSupport;

public class EmpAction extends ActionSupport {
	private DepartmentBiz departmentBiz;
	private EmpBiz empBiz;
	private OrdersBiz orderbiz;
	private CommodityTypeBiz ctypebiz;
	private integralBiz integralbiz;
	private CommodityBiz commoditybiz;
	private CommodityTypeBiz commoditytypeBiz;
	private imagerBiz imagerBiz;
	private OrdersBiz ordersBiz;
	 private String empno;// number primary key,--员工编号(EmpNo)	Varchar2	30	否	主键	条件自增
	 private String empname;//EmpName varchar2(30) not null,--姓名(EmpName)	Varchar2	30	否		
	 private String empsex;// EmpSex varchar2(2) not null,--性别(EmpSex)	Varchar2	2	否		只能为:男,女
	 private String idcard;//IDcard varchar2(18) not null,--身份证(IDcard)	Varchar2	18	否		
	 private department department;// DepartmentNo number not null,--部门(DepartmentNo)	Number	30	是	外键	链接部门表
	 private String positivedates;// Positivedates timestamp not null,--转正日期(Positivedates)	Time	Null	否	
	 private String empphone;// EmpPhone varchar2(11) not null,--电话(EmpPhone)	Varchar2	11	否		
	 private integral intergralno;// intergralNo varchar2(20) not null,--积分(intergralNo)	Varchar2	20	否	外键	链接积分表
	 private String position;// position number not null --职位(position)	Number	2	否	用户权限限制	1: 
	 private String username;
	 private String password;
	 private String yzm;
	 private String newpassword;
	 private String userpassword;
	 private String newusername;
	 private String empdelNo;
	 private String ssEmpName;
	 private String ssData;
	 private String qtempno;
	 private String DelNos;
	 private String CustomerId;//商品id
	 private String userNos;//生成订单用户
	 private String commmodityno;//生成订单 商品id
	 private String commoSum;
	private static String SUCCESS="success";
	SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" ); 
	public String findall() {
		ServletActionContext.getRequest().setAttribute("dlist", departmentBiz.findall());
		return SUCCESS;
	}
	//后台登录
	public String login() {
		emp emp= empBiz.findlogin(username, password);
		int empsum=empBiz.findsum();
		int ordersum= orderbiz.findsum();
		commoditytype com=new commoditytype();
		int commoSum=commoditybiz.findAllCommdity().size();
		ArrayList<emp> elist= empBiz.findall();
		com.setCommodityTypeNo(22);
			if(emp!=null) {
				System.out.println(emp.getDepartment());
			ServletActionContext.getRequest().getSession().setAttribute("user", emp);
			ServletActionContext.getRequest().getSession().setAttribute("usersum",empsum );
			ServletActionContext.getRequest().getSession().setAttribute("userlist",elist );
			ServletActionContext.getRequest().getSession().setAttribute("ordersum",ordersum);
			ServletActionContext.getRequest().getSession().setAttribute("orderTj",orderbiz.findTj());
			ServletActionContext.getRequest().getSession().setAttribute("orderDlq",orderbiz.findDlq());//
			ServletActionContext.getRequest().getSession().setAttribute("orderYcj",orderbiz.findYcj());
			ServletActionContext.getRequest().getSession().setAttribute("tlist",ctypebiz.findCommodityTypeRank(1));
			ServletActionContext.getRequest().getSession().setAttribute("depalist", departmentBiz.findall());
			ServletActionContext.getRequest().getSession().setAttribute("commoSum", commoSum);
			return SUCCESS;
			}else {
			ServletActionContext.getRequest().setAttribute("pd", "登录失败");
			return "false";
			}
	}
	public String Empfinds() {
		int empsum=empBiz.findsum();
		ArrayList<emp> elist= empBiz.findall();
		ServletActionContext.getRequest().getSession().setAttribute("usersum",empsum );
		ServletActionContext.getRequest().getSession().setAttribute("userlist",elist );
		return "administrator";
	}
	public String EmpfindUsername() throws IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		System.out.println(empBiz.findUsername(username));
		int a=0;
		if(empBiz.findUsername(username)) {
			a=1;
		}
		out.println(a);
		out.close();
		return null;
	}
	//前台登录
	public String loginIndex() {
		emp emp=empBiz.findlogin(username, password);
		int empsum=empBiz.findsum();
		int ordersum= orderbiz.findsum();
		ArrayList<commoditytype> typelist=commoditytypeBiz.findAllCommodityType();
		ServletActionContext.getRequest().getSession().setAttribute("typelist",typelist);
		ArrayList<commodity> clist= commoditybiz.findAllCommdity();
		ArrayList<commodity> tjlist=new ArrayList<commodity>();
		for (int i = 0; i < clist.size(); i++) {
			if(i<4){
				tjlist.add(clist.get(i));
			}
		}
		Map<String,List> cmap=new HashMap();
		for (commoditytype commoditytype : typelist) {
			if (commoditytype.getCommodityrank()==2) {
				ArrayList<commodity> comlist= new ArrayList<commodity>();
				for (commodity commodity : clist) {
					if(commodity.getCommoditytypeno().getSupercommoditytype().getCommodityTypeNo()==commoditytype.getCommodityTypeNo()) {
						comlist.add(commodity);
					}
				}
				if(comlist.size()>3) {
					cmap.put(commoditytype.getCommoditytypename(),comlist);
				}
			}
		}
		ServletActionContext.getRequest().getSession().setAttribute("cmap", cmap);
		ServletActionContext.getRequest().getSession().setAttribute("clist", clist);
		System.out.println(emp.getIntergralno());
		if(!StringUtils.isEmpty(emp)) {
			ServletActionContext.getRequest().getSession().setAttribute("user", emp);
			return "login";
		}else{
			return "loginfalse";
		}
	}
	public String orders() {
		ServletActionContext.getRequest().setAttribute("orders", ordersBiz.findemp(empBiz.find(Integer.parseInt(empno))));//通过用户名查询订单
		return "orders";
	}
	//修改电话
	public String UpdEmpPhone() {
		emp emp=empBiz.find(Integer.parseInt(qtempno));
		emp.setEmpphone(empphone);
		empBiz.UpdEmp(emp);
		ServletActionContext.getRequest().getSession().setAttribute("user", empBiz.find(Integer.parseInt(qtempno)));
		return "updphone";
	}
	//修改员工
	public String UpdEmp() {
		emp emp=empBiz.find(Integer.parseInt(empno));
		emp.setDepartment(departmentBiz.find(department.getDepaname()));
		emp.setEmpname(empname);
		emp.setEmpphone(empphone);
		emp.setEmpsex(empsex);
		emp.setIdcard(idcard);
		emp.setUsername(username);
		emp.setPosition(Integer.parseInt(position));
		 java.util.Date d = null;  
	        try {  
	            d = sdf.parse(positivedates);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        java.sql.Timestamp date = new java.sql.Timestamp(d.getTime());  
		emp.setPositivedates(date);
		emp.setPassword(password);
		empBiz.UpdEmp(emp);
		ServletActionContext.getRequest().getSession().setAttribute("user", empBiz.find(Integer.parseInt(empno)));
		return "admin";
	}
	public String AddEmp() {
		System.out.println(department.getDepano()+"========");
		emp emp=new emp();
		emp.setDepartment(departmentBiz.findNo(department.getDepano()));
		emp.setEmpname(empname);
		emp.setEmpphone(empphone);
		emp.setEmpsex(empsex);
		emp.setIdcard(idcard);
		emp.setUsername(newusername);
		emp.setPosition(Integer.parseInt(position));
		java.sql.Timestamp currentDate = new java.sql.Timestamp(System.currentTimeMillis());
		emp.setPositivedates(currentDate);
		emp.setPassword(newpassword);
		Integer empn= empBiz.AddEmp(emp);
		integral integral=new integral();
		emp.setEmpno(empn);
		integral.setEmp(emp);
		integral.setHaveintegral(0);
		integral.setLastchangetime(currentDate);
		integral.setRemainingpoints(0);
		integral.setTotalintegral(0);
		integralbiz.AddIntegral(integral);
		int empsum=empBiz.findsum();
		ArrayList<emp> elist= empBiz.findall();
		ServletActionContext.getRequest().getSession().setAttribute("usersum",empsum );
		ServletActionContext.getRequest().getSession().setAttribute("userlist",elist );
		return "administrator";
	}
	public String Delemps() throws IOException {
		String[] Delnos= DelNos.split(",");
		System.out.println(DelNos+"========");
		for (String string : Delnos) {
			System.out.println(string);
			emp emp= empBiz.find(Integer.parseInt(string));
			integralbiz.DelEmpIntegral(emp);
			empBiz.DelEmp(emp);
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");
		out.close();
		return null;
	}
	public String Delemp() throws IOException, ParseException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		emp emp=new emp();
		emp.setEmpno(Integer.parseInt(empdelNo));
		integralbiz.DelEmpIntegral(emp);
		empBiz.DelEmp(emp);
		List<emp> elist=empBiz.findall();
		List<emp> sonlist=new ArrayList<emp>();
		for (emp e : elist) {
			e.getDepartment().setEmps(null);
			e.getDepartment().setDepano(e.getDepartment().getDepano());
			e.getDepartment().setDepaname(e.getDepartment().getDepaname());
			System.out.println(e.getIntergralno());
			sonlist.add(e);
		}
		StringBuffer array=new StringBuffer();
		array.append("[");
		for (emp emp2 : sonlist) {
			Calendar calendar = Calendar.getInstance();
			Calendar calendar2 = Calendar.getInstance();
		    calendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(emp2.getPositivedates().toString()));
		    calendar2.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(emp2.getIntergralno().getLastchangetime().toString()));
				String arr="{\"empno\" : "+emp2.getEmpno()+","
						+ "\"empname\" : \""+emp2.getEmpname()+"\","
						+"\"empphone\": \""+emp2.getEmpphone()+"\","
						+ "\"empsex\":\""+emp2.getEmpsex()+"\","
						+ "\"idcard\":\""+emp2.getIdcard()+"\","
						+ "\"password\":\""+emp2.getPassword()+"\","
						+ "\"position\":\""+emp2.getPosition()+"\","
						+ "\"positivedates\":"+calendar.getTimeInMillis()+","
						+ "\"username\":\""+emp2.getUsername()+"\","
						+ "\"department\":{\"depaname\":\""+emp2.getDepartment().getDepaname()+"\",\"depano\":\""+emp2.getDepartment().getDepano()+"\"},"
						+ "\"intergralno\":{\"emp\":{},\"haveintegral\":"+emp2.getIntergralno().getHaveintegral()+
						",\"integralschedules\":[],\"intergralno\":"+emp2.getIntergralno().getIntergralno()+
						",\"lastchangetime\":"+calendar2.getTimeInMillis()+
						",\"remainingpoints\":"+emp2.getIntergralno().getRemainingpoints()+
						",\"totalintegral\":"+emp2.getIntergralno().getTotalintegral()+
						"}},";
				array.append(arr);
		}
		array.deleteCharAt(array.length()-1);
		array.append("]");
		/*String json=JSON.toJSONString(sonlist, SerializerFeature.WriteMapNullValue);
		System.out.println(json);
		//DisableCircularReferenceDetact
		JSONArray array= JSONArray.parseArray(JSON.toJSONString(sonlist,SerializerFeature.DisableCircularReferenceDetect));
		System.out.println(array+"====================");*/
		out.print(array);
		out.close();
		return null;
	}
	//订单查询
	public String findorder() {
			ServletActionContext.getRequest().getSession().setAttribute("usersum",empBiz.findsum() );
			ServletActionContext.getRequest().getSession().setAttribute("ordersum",orderbiz.findsum());
			ServletActionContext.getRequest().getSession().setAttribute("orderTj",orderbiz.findTj());
			ServletActionContext.getRequest().getSession().setAttribute("orderDlq",orderbiz.findDlq());
			ServletActionContext.getRequest().getSession().setAttribute("orderYcj",orderbiz.findYcj());
			return "home";
	}
	//前台修改
	public String findEmpNo() throws IOException {
		System.out.println(empno+"findEmpNo");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		emp emp=empBiz.find(Integer.parseInt(empno));
		out.print(emp.getPassword());
		out.close();
		return null;
	}
	public String UpdMM() {
		emp emp=empBiz.find(Integer.parseInt(empno));
		emp.setPassword(newpassword);
		empBiz.UpdEmp(emp);
		ServletActionContext.getRequest().getSession().setAttribute("user", empBiz.find(Integer.parseInt(empno)));
		return "admin";
	}
	public String ssEmp() throws ParseException, IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		List<emp> sonlist=empBiz.find(ssEmpName, ssData);
		StringBuffer array=new StringBuffer();
		array.append("[");
		for (emp emp2 : sonlist) {
			Calendar calendar = Calendar.getInstance();
			Calendar calendar2 = Calendar.getInstance();
		    calendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(emp2.getPositivedates().toString()));
		    calendar2.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(emp2.getIntergralno().getLastchangetime().toString()));
				String arr="{\"empno\" : "+emp2.getEmpno()+","
						+ "\"empname\" : \""+emp2.getEmpname()+"\","
						+"\"empphone\": \""+emp2.getEmpphone()+"\","
						+ "\"empsex\":\""+emp2.getEmpsex()+"\","
						+ "\"idcard\":\""+emp2.getIdcard()+"\","
						+ "\"password\":\""+emp2.getPassword()+"\","
						+ "\"position\":\""+emp2.getPosition()+"\","
						+ "\"positivedates\":"+calendar.getTimeInMillis()+","
						+ "\"username\":\""+emp2.getUsername()+"\","
						+ "\"department\":{\"depaname\":\""+emp2.getDepartment().getDepaname()+"\",\"depano\":\""+emp2.getDepartment().getDepano()+"\"},"
						+ "\"intergralno\":{\"emp\":{},\"haveintegral\":"+emp2.getIntergralno().getHaveintegral()+
						",\"integralschedules\":[],\"intergralno\":"+emp2.getIntergralno().getIntergralno()+
						",\"lastchangetime\":"+calendar2.getTimeInMillis()+
						",\"remainingpoints\":"+emp2.getIntergralno().getRemainingpoints()+
						",\"totalintegral\":"+emp2.getIntergralno().getTotalintegral()+
						"}},";
				array.append(arr);
		}
		array.deleteCharAt(array.length()-1);
		array.append("]");
		System.out.println(array.length()+"========");
		if(array.length()==1) {
			array=new StringBuffer();
			array.append("[{\"bool\":\"true\"}]");
		}
		out.print(array);
		out.close();
		return null;		
	}
	//单个商品查询
	public String OneCustome(){
		commodity commodity = new commodity();
		commodity.setCommodityno(Integer.parseInt(CustomerId));
		ServletActionContext.getRequest().setAttribute("OneCustome",commoditybiz.findcommodity(commodity));
		return "OneCustome";
	}
	//前台订单生成
	public String addOrder() {
		orders orders=new orders();//订单表
		//commodity  commodity=new  commodity();//商品表
		//new commodity().getCommodityno();
		commodity commodity=commoditybiz.findcommodity(Integer.parseInt(commmodityno));
		emp emp=empBiz.find(Integer.parseInt(userNos));//用户表
		int sumintegral=commodity.getNeedintegral()*Integer.parseInt(commoSum);
		orders.setOrderintegral(Integer.toString(sumintegral*(-1)));//生成订单所需积分
		orders.setOrdercommodityno(commodity);//生成订单商品
		Timestamp currentDate = new Timestamp(System.currentTimeMillis());
		orders.setOrdertime(currentDate);
		orders.setOrderstatus(1);
		orders.setEmpno(emp);
		orders.setCommoditySum(Integer.parseInt(commoSum));
		 String str="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		    //由Random生成随机数
		        Random random=new Random();  
		        StringBuffer sb=new StringBuffer();
		        //长度为几就循环几次
		        for(int i=0; i<6; ++i){
		          //产生0-61的数字
		          int number=random.nextInt(62);
		          //将产生的数字通过length次承载到sb中
		          sb.append(str.charAt(number));
		        }
		        System.out.println();
		orders.setRandom(sb.toString());
		System.out.println(sb.toString());
		integral integral=emp.getIntergralno();
		integral.setHaveintegral(integral.getHaveintegral()+Integer.parseInt(orders.getOrderintegral()));
		integral.setRemainingpoints(integral.getRemainingpoints()-Integer.parseInt(orders.getOrderintegral()));
		integral.setLastchangetime(currentDate);
		commodity.setCommodityinventory(commodity.getCommodityinventory()-Integer.parseInt(commoSum));
		commoditybiz.UpdateCommdity(commodity);
		integralbiz.Update(integral);
		int OrderNo= ordersBiz.AddOrders(orders);
		ServletActionContext.getRequest().getSession().setAttribute("user", empBiz.find(Integer.parseInt(userNos)));
		ServletActionContext.getRequest().setAttribute("Orders",ordersBiz.find(OrderNo));
		return "addOrder";
	}
	
	public String getUserNos() {
		return userNos;
	}
	public void setUserNos(String userNos) {
		this.userNos = userNos;
	}
	public String getCommmodityno() {
		return commmodityno;
	}
	public void setCommmodityno(String commmodityno) {
		this.commmodityno = commmodityno;
	}
	public DepartmentBiz getDepartmentBiz() {
		return departmentBiz;
	}
	public void setDepartmentBiz(DepartmentBiz departmentBiz) {
		this.departmentBiz = departmentBiz;
	}
	
public CommodityTypeBiz getCtypebiz() {
		return ctypebiz;
	}
	public void setCtypebiz(CommodityTypeBiz ctypebiz) {
		this.ctypebiz = ctypebiz;
	}
	//	public EmpBiz getEmpBiz() {
//		return empBiz;
//	}
//	public void setEmpBiz(EmpBiz empBiz) {
//		this.empBiz = empBiz;
//	}
	
	public String getUsername() {
		return username;
	}
	public String getCustomerId() {
		return CustomerId;
	}
	public void setCustomerId(String customerId) {
		CustomerId = customerId;
	}
	public String getQtempno() {
		return qtempno;
	}
	public void setQtempno(String qtempno) {
		this.qtempno = qtempno;
	}
	public EmpBiz getEmpBiz() {
		return empBiz;
	}
	public void setEmpBiz(EmpBiz empBiz) {
		this.empBiz = empBiz;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public OrdersBiz getOrderbiz() {
		return orderbiz;
	}
	public void setOrderbiz(OrdersBiz orderbiz) {
		this.orderbiz = orderbiz;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmpsex() {
		return empsex;
	}
	public void setEmpsex(String empsex) {
		this.empsex = empsex;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public department getDepartment() {
		return department;
	}
	public void setDepartment(department department) {
		this.department = department;
	}
	public String getPositivedates() {
		return positivedates;
	}
	public void setPositivedates(String positivedates) {
		this.positivedates = positivedates;
	}
	public String getEmpphone() {
		return empphone;
	}
	public void setEmpphone(String empphone) {
		this.empphone = empphone;
	}
	public integral getIntergralno() {
		return intergralno;
	}
	public void setIntergralno(integral intergralno) {
		this.intergralno = intergralno;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public integralBiz getIntegralbiz() {
		return integralbiz;
	}
	public void setIntegralbiz(integralBiz integralbiz) {
		this.integralbiz = integralbiz;
	}
	public CommodityBiz getCommoditybiz() {
		return commoditybiz;
	}
	public void setCommoditybiz(CommodityBiz commoditybiz) {
		this.commoditybiz = commoditybiz;
	}
	public String getYzm() {
		return yzm;
	}
	public void setYzm(String yzm) {
		this.yzm = yzm;
	}
	public CommodityTypeBiz getCommoditytypeBiz() {
		return commoditytypeBiz;
	}
	public void setCommoditytypeBiz(CommodityTypeBiz commoditytypeBiz) {
		this.commoditytypeBiz = commoditytypeBiz;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getNewusername() {
		return newusername;
	}
	public void setNewusername(String newusername) {
		this.newusername = newusername;
	}
	public String getEmpdelNo() {
		return empdelNo;
	}
	public void setEmpdelNo(String empdelNo) {
		this.empdelNo = empdelNo;
	}
	public String getSsEmpName() {
		return ssEmpName;
	}
	public void setSsEmpName(String ssEmpName) {
		this.ssEmpName = ssEmpName;
	}
	public String getSsData() {
		return ssData;
	}
	public void setSsData(String ssData) {
		this.ssData = ssData;
	}
	public imagerBiz getImagerBiz() {
		return imagerBiz;
	}
	public void setImagerBiz(imagerBiz imagerBiz) {
		this.imagerBiz = imagerBiz;
	}
	public String getDelNos() {
		return DelNos;
	}
	public void setDelNos(String delNos) {
		DelNos = delNos;
	}
	public OrdersBiz getOrdersBiz() {
		return ordersBiz;
	}
	public void setOrdersBiz(OrdersBiz ordersBiz) {
		this.ordersBiz = ordersBiz;
	}
	public String getCommoSum() {
		return commoSum;
	}
	public void setCommoSum(String commoSum) {
		this.commoSum = commoSum;
	}
	
}
