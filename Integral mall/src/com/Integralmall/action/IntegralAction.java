package com.Integralmall.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.Integralmall.biz.CommodityBiz;
import com.Integralmall.biz.CommodityTypeBiz;
import com.Integralmall.biz.DepartmentBiz;
import com.Integralmall.biz.EmpBiz;
import com.Integralmall.biz.IntegralAuditBiz;
import com.Integralmall.biz.IntegralTypeBiz;
import com.Integralmall.biz.IntegralscheduleBiz;
import com.Integralmall.biz.OrdersBiz;
import com.Integralmall.biz.integralBiz;
import com.Integralmall.dao.IntegralscheduleDao;
import com.Integralmall.entity.IntegralSystem;
import com.Integralmall.entity.commodity;
import com.Integralmall.entity.emp;
import com.Integralmall.entity.integral;
import com.Integralmall.entity.integralaudit;
import com.Integralmall.entity.integralschedule;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;


public class IntegralAction extends ActionSupport{
	private IntegralTypeBiz itgraltypebiz;
	private DepartmentBiz departmentBiz;
	private EmpBiz empBiz;
	private OrdersBiz orderbiz;
	private CommodityTypeBiz ctypebiz;
	private integralBiz integralbiz;
	private CommodityBiz commoditybiz;
	private CommodityTypeBiz commoditytypeBiz;
	private IntegralAuditBiz integralAuditBiz;
	private IntegralscheduleBiz integralscheduleBiz;
	private IntegralTypeBiz integralTypeBiz;
	private File file;//文件
	private String fileFileName;//文件名称    
	private String fileContentType; //文件类型   
	private InputStream inputStream;
	private String savePath;
	private String filename;

	private String ssEmpName;
	private String ssData;
	private String IntegralEmpname;
	private String integraltypeno;
	private String changenumber;
	private String intergralchange;
	private String reviewerEmpNo;
	private String auditopinion;
	private String changeNo;
	private String schange;
	private String AuditOpinion;
	private String AuditType;
	private String chengeradio;
	private String chengeNumber;
	private String scName;
	private String scData;
	private String IntegralNo;
	private String DelNos;
	private String empno;
	private static String SUCCESS="success";
	private static final String EXCEL_XLS = "xls";
	private static final String EXCEL_XLSX = "xlsx";
	private static XSSFWorkbook xssfWorkbook = null;
	private static HSSFWorkbook workbook = null;
	public  String findIntegral() {
		ServletActionContext.getRequest().setAttribute("integralType", itgraltypebiz.findIntegralType());
		ArrayList<integralaudit> auditlist=integralAuditBiz.findIntegralaudit(scName, scData);
		ServletActionContext.getRequest().setAttribute("Auditlist", auditlist);
		ServletActionContext.getRequest().setAttribute("Emplist", empBiz.findall());
		for (integralaudit integralaudit : auditlist) {
			System.out.println(integralaudit.getEmpno().getEmpname());
		}
		return "guestbook";
	}
	public String findDetail() {
		System.out.println(scName+"====="+scData);
		ServletActionContext.getRequest().getSession().setAttribute("filename","积分奖惩制度.xls");
		ServletActionContext.getRequest().setAttribute("integrals", integralscheduleBiz.findIntegralschedule(scName, scData));
		return "Detail";
	}
	public  String findIntegrals() {
		ServletActionContext.getRequest().setAttribute("integralType", itgraltypebiz.findIntegralType());
		ServletActionContext.getRequest().getSession().setAttribute("filename","积分奖惩制度.xls");
		ArrayList<integralaudit> auditlist=integralAuditBiz.findIntegralaudit(scName, scData);
		ServletActionContext.getRequest().setAttribute("Auditlist", auditlist);
		ServletActionContext.getRequest().setAttribute("Emplist", empBiz.findall());
		for (integralaudit integralaudit : auditlist) {
			System.out.println(integralaudit.getEmpno().getEmpname());
		}
		return "Feedback";
	}
	public  String AddIntegral() {
		integralaudit integralaudit=new integralaudit();
		integralaudit.setEmpno(empBiz.find(Integer.parseInt(IntegralEmpname)));
		integralaudit.setReviewer(empBiz.find(Integer.parseInt(reviewerEmpNo)));
		integralaudit.setAudittype(1);
		integralaudit.setChangenumber(Integer.parseInt(changenumber));
		integralaudit.setAuditopinion(auditopinion);
		integralaudit.setIntergralchange(intergralchange);
		integralaudit.setIntegraltypeno(itgraltypebiz.find(Integer.parseInt(integraltypeno)));
		integralAuditBiz.AddIntegralaudit(integralaudit);
		ServletActionContext.getRequest().setAttribute("Auditlist", integralAuditBiz.findIntegralaudit(scName, scData));
		return "guestbook";
	}
	public String Updchenge() throws IOException {
		integralaudit integralaudit=integralAuditBiz.findIntegralno(Integer.parseInt(changeNo));
		integralaudit.setAuditopinion(AuditOpinion);
		integralaudit.setAudittype(Integer.parseInt(AuditType));
		integralAuditBiz.UpdateIntegralaudit(integralaudit);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");
		out.close();
		return null;
	}
	public String topup(){
		Integer count= integralscheduleBiz.findCount();
		ServletActionContext.getRequest().setAttribute("integralCount", count);
		ServletActionContext.getRequest().setAttribute("user", empBiz.find(Integer.parseInt(empno)));
		return "topup";
	}
	public String topupTwo() throws IOException{
		Integer count= integralscheduleBiz.findCount();
		//ServletActionContext.getRequest().setAttribute("integralCount", count);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(count);
		out.close();
		return null;
	}
	public String Tjchenge() throws IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		System.out.println(chengeradio);
		if(Integer.parseInt(chengeradio)>0) {
			integralaudit integralaudit=integralAuditBiz.findIntegralno(Integer.parseInt(changeNo));
			integralschedule integralschedule=new integralschedule();
			Integer empno=integralaudit.getEmpno().getEmpno();
			System.out.println(empno);
			integral integral=integralbiz.findRestIntegral(empno);
			integralschedule.setChangenumber(integralaudit.getChangenumber());//变更积分数
			integralschedule.setEmpno(integralaudit.getEmpno());//申请人
			integralschedule.setReviewer(integralaudit.getReviewer());//审核人
			integralschedule.setIntegraltypeno(integralaudit.getIntegraltypeno());//积分类型
			integralschedule.setIntergralchange(integralaudit.getIntergralchange());//变动原因
			integralschedule.setIntegralno(integral);//积分表
			java.sql.Timestamp currentDate = new java.sql.Timestamp(System.currentTimeMillis());
			integralschedule.setChangedate(currentDate);
			integral.setTotalintegral(integral.getTotalintegral()+integralaudit.getChangenumber());
			integral.setRemainingpoints(integral.getRemainingpoints()+integralaudit.getChangenumber());
			integral.setLastchangetime(currentDate);
			integralbiz.Update(integral);
			integralAuditBiz.DeleIntegralaudit(integralaudit);
			integralscheduleBiz.AddIntegralaudit(integralschedule);
			out.println("Y");
		}else {
			integralaudit integralaudit=integralAuditBiz.findIntegralno(Integer.parseInt(changeNo));
			integralaudit.setAudittype(3);
			integralAuditBiz.UpdateIntegralaudit(integralaudit);
			out.println("N");
		}
		out.close();
		return null;
	}
	public String SHchenge() throws IOException {
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		Integer empno=Integer.parseInt(scName);
		integral integral=integralbiz.findRestIntegral(empno);
		integralschedule integralschedule=new integralschedule();
		integralschedule.setChangenumber(Integer.parseInt(chengeNumber));//变更积分数
		integralschedule.setEmpno(empBiz.find(Integer.parseInt(scName)));//申请人
		integralschedule.setReviewer(empBiz.find(Integer.parseInt(reviewerEmpNo)));//审核人
		integralschedule.setIntegraltypeno(integralTypeBiz.find(12));//积分类型
		integralschedule.setIntergralchange(chengeradio);//变动原因
		integralschedule.setIntegralno(integral);//积分表
		java.sql.Timestamp currentDate = new java.sql.Timestamp(System.currentTimeMillis());
		integralschedule.setChangedate(currentDate);
		integral.setTotalintegral(integral.getTotalintegral()+Integer.parseInt(chengeNumber));
		integral.setRemainingpoints(integral.getRemainingpoints()+Integer.parseInt(chengeNumber));
		integral.setLastchangetime(currentDate);
		integralbiz.Update(integral);
		integralscheduleBiz.AddIntegralaudit(integralschedule);
		out.println("Y");
		out.close();
		return null;
	}
	public String DelIntgral() throws IOException {
		integralaudit integralaudit=integralAuditBiz.findIntegralno(Integer.parseInt(IntegralNo));
		integralAuditBiz.DeleIntegralaudit(integralaudit);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");
		out.close();
		return null;
	}
	public String DelIntgrals() throws IOException {
		String[] Delnos= DelNos.split(",");
		for (String string : Delnos) {
			integralaudit integralaudit=integralAuditBiz.findIntegralno(Integer.parseInt(string));
			integralAuditBiz.DeleIntegralaudit(integralaudit);
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");
		out.close();
		return null;
	}
	public String Delchedule() throws IOException {
		String[] Delnos= DelNos.split(",");
		for (String string : Delnos) {
			integralschedule integralschedule=integralscheduleBiz.findIntegralno(Integer.parseInt(string));
			integralscheduleBiz.DeleIntegralaudit(integralschedule);
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("");
		out.close();
		return null;
	}
	public String Review() {
		ServletActionContext.getRequest().getSession().setAttribute("filename","积分奖惩制度.xls");
		int empsum=empBiz.findsum();
		ArrayList<emp> elist= empBiz.find(ssEmpName, ssData);
		ServletActionContext.getRequest().getSession().setAttribute("usersum",empsum );
		ServletActionContext.getRequest().getSession().setAttribute("userlist",elist );
		ServletActionContext.getRequest().getSession().setAttribute("tglist",integralscheduleBiz.finddatekaohe() );
		String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
	  	System.out.println(path);
        String realPath =path+"\\积分奖惩制度.xls";
        System.out.println(realPath);
        ArrayList<IntegralSystem> Slist=ExcelToArray(realPath);
        for (IntegralSystem integralSystem : Slist) {
			System.out.println(integralSystem.getSystemDetails()+"=+="+integralSystem.getSystemIntegral());
		}
        ServletActionContext.getRequest().setAttribute("Elist",Slist);
		return "Review";
	}
	public String points() {
		ServletActionContext.getRequest().setAttribute("integralEmp", integralscheduleBiz.findRestIntegral(Integer.parseInt(empno)) );
		return "points";
	}
	public String newFile() throws IOException  {
		String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
		String Excelpath=path+"\\"+this.getFileFileName();
		String Excelpaths="Excels\\"+this.getFileFileName();
		FileOutputStream fos=new FileOutputStream(Excelpath);
		FileInputStream fis=new FileInputStream(file);
		System.out.println(fileFileName);
		System.out.println(Excelpaths);
		System.out.println(Excelpath);
		byte []b=new byte[5000];
		int len=-1;
		while((len=fis.read(b))!=-1){
			fos.write(b, 0, len);
		}
		fis.close();
		fos.close();
		return "input";
	}
	public String downFile() throws UnsupportedEncodingException, FileNotFoundException {
		  	String inputPath =new String(filename.getBytes("iso-8859-1"),"UTF-8");
		  	String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
		  	System.out.println(inputPath);
		  	System.out.println(path);
	        String realPath =path+"\\"+inputPath;
	        System.out.println(realPath);
	        File file = new File(realPath);
	        inputStream = new FileInputStream(file);
	        System.out.println(inputStream);
	        return "downFile";
	}
	public String Excel() throws UnsupportedEncodingException, FileNotFoundException {
	  	String path=ServletActionContext.getServletContext().getRealPath(getSavePath());
	  	System.out.println(path);
        String realPath =path+"\\积分奖惩制度.xls";
        System.out.println(realPath);
        //JSONArray json=ExcelToJson(realPath);
        //System.out.println(json);
        //ServletActionContext.getRequest().setAttribute("Excel",json);
        ServletActionContext.getRequest().setAttribute("ExcelTwo",ExcelToArray(realPath));
        return "Excel";
		}
	/*辅助方法*/
	private JSONArray ExcelToJson(String filePath) {
		Workbook workbook;
        Sheet sheet;
        Cell cell1,cell2;
        JSONArray jsons = new JSONArray();

        try {
            //获取一个Excel文件  只支持.xls格式
            workbook = Workbook.getWorkbook(new File(filePath));
            //获取文件里的某个表  从0开始
            sheet = workbook.getSheet(0);

            for(int i = 1; i < sheet.getRows(); i++) {
                //循环读出每一数据格的数据
                //sheet.getCell(列，行);
                cell1 = sheet.getCell(0 , i);
                cell2 = sheet.getCell(1 , i);

                //每一行创建一个JSONObject对象
                JSONObject object = new JSONObject();
                object.put("制度详情", cell1.getContents());
                object.put("分数", cell2.getContents());
                //加入json队列
                jsons.add(object);
            }
            //对队列进行输出或者其他操作
            System.out.println(jsons.toJSONString());
            workbook.close();
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }   
		return jsons;
	}
	private ArrayList<IntegralSystem> ExcelToArray(String filePath) {
		Workbook workbook;
        Sheet sheet;
        Cell cell1,cell2;
        ArrayList<IntegralSystem> Slist=new ArrayList<IntegralSystem>();
        try {
            //获取一个Excel文件  只支持.xls格式
            workbook = Workbook.getWorkbook(new File(filePath));
            //获取文件里的某个表  从0开始
            sheet = workbook.getSheet(0);

            for(int i = 1; i < sheet.getRows(); i++) {
                //循环读出每一数据格的数据
                cell1 = sheet.getCell(0 , i);
                cell2 = sheet.getCell(1 , i);
                System.out.println(cell1.getContents()+"=="+cell2.getContents());
                IntegralSystem object = new IntegralSystem(cell1.getContents().toString(),Integer.parseInt(cell2.getContents().toString()));
                Slist.add(object);
            }
            //对队列进行输出或者其他操作
            System.out.println();
            workbook.close();
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }   
		return Slist;
	}
	
	/*getter,setter*/
	public IntegralTypeBiz getItgraltypebiz() {
		return itgraltypebiz;
	}
	public void setItgraltypebiz(IntegralTypeBiz itgraltypebiz) {
		this.itgraltypebiz = itgraltypebiz;
	}
	public DepartmentBiz getDepartmentBiz() {
		return departmentBiz;
	}
	public void setDepartmentBiz(DepartmentBiz departmentBiz) {
		this.departmentBiz = departmentBiz;
	}
	public EmpBiz getEmpBiz() {
		return empBiz;
	}
	public void setEmpBiz(EmpBiz empBiz) {
		this.empBiz = empBiz;
	}
	public OrdersBiz getOrderbiz() {
		return orderbiz;
	}
	public void setOrderbiz(OrdersBiz orderbiz) {
		this.orderbiz = orderbiz;
	}
	public CommodityTypeBiz getCtypebiz() {
		return ctypebiz;
	}
	public void setCtypebiz(CommodityTypeBiz ctypebiz) {
		this.ctypebiz = ctypebiz;
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
	public CommodityTypeBiz getCommoditytypeBiz() {
		return commoditytypeBiz;
	}
	public void setCommoditytypeBiz(CommodityTypeBiz commoditytypeBiz) {
		this.commoditytypeBiz = commoditytypeBiz;
	}
	public IntegralAuditBiz getIntegralAuditBiz() {
		return integralAuditBiz;
	}
	public void setIntegralAuditBiz(IntegralAuditBiz integralAuditBiz) {
		this.integralAuditBiz = integralAuditBiz;
	}
	public IntegralscheduleBiz getIntegralscheduleBiz() {
		return integralscheduleBiz;
	}
	public void setIntegralscheduleBiz(IntegralscheduleBiz integralscheduleBiz) {
		this.integralscheduleBiz = integralscheduleBiz;
	}
	public String getIntegralEmpname() {
		return IntegralEmpname;
	}
	public void setIntegralEmpname(String integralEmpname) {
		IntegralEmpname = integralEmpname;
	}
	public String getIntegraltypeno() {
		return integraltypeno;
	}
	public void setIntegraltypeno(String integraltypeno) {
		this.integraltypeno = integraltypeno;
	}
	public String getChangenumber() {
		return changenumber;
	}
	public void setChangenumber(String changenumber) {
		this.changenumber = changenumber;
	}
	public String getIntergralchange() {
		return intergralchange;
	}
	public void setIntergralchange(String intergralchange) {
		this.intergralchange = intergralchange;
	}
	public String getReviewerEmpNo() {
		return reviewerEmpNo;
	}
	public void setReviewerEmpNo(String reviewerEmpNo) {
		this.reviewerEmpNo = reviewerEmpNo;
	}
	public String getAuditopinion() {
		return auditopinion;
	}
	public void setAuditopinion(String auditopinion) {
		this.auditopinion = auditopinion;
	}
	public String getChangeNo() {
		return changeNo;
	}
	public void setChangeNo(String changeNo) {
		this.changeNo = changeNo;
	}
	public String getSchange() {
		return schange;
	}
	public void setSchange(String schange) {
		this.schange = schange;
	}
	public String getAuditOpinion() {
		return AuditOpinion;
	}
	public void setAuditOpinion(String auditOpinion) {
		AuditOpinion = auditOpinion;
	}
	public String getAuditType() {
		return AuditType;
	}
	public void setAuditType(String auditType) {
		AuditType = auditType;
	}
	public String getChengeradio() {
		return chengeradio;
	}
	public void setChengeradio(String chengeradio) {
		this.chengeradio = chengeradio;
	}
	public String getChengeNumber() {
		return chengeNumber;
	}
	public void setChengeNumber(String chengeNumber) {
		this.chengeNumber = chengeNumber;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
	}
	public String getScData() {
		return scData;
	}
	public void setScData(String scData) {
		this.scData = scData;
	}
	public String getIntegralNo() {
		return IntegralNo;
	}
	public void setIntegralNo(String integralNo) {
		IntegralNo = integralNo;
	}
	public String getDelNos() {
		return DelNos;
	}
	public void setDelNos(String delNos) {
		DelNos = delNos;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public IntegralTypeBiz getIntegralTypeBiz() {
		return integralTypeBiz;
	}
	public void setIntegralTypeBiz(IntegralTypeBiz integralTypeBiz) {
		this.integralTypeBiz = integralTypeBiz;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
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
	
}
