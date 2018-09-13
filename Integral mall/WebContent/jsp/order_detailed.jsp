<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ysnidongma.css">
        <link href="${pageContext.request.contextPath }/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath }/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/typeahead-bs2.min.js"></script> 
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/H-ui.js"></script>      	
		<script src="${pageContext.request.contextPath }/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath }/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${pageContext.request.contextPath }/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/assets/js/jquery.easy-pie-chart.min.js"></script>
        <script src="${pageContext.request.contextPath }/js/lrtk.js" type="text/javascript" ></script>
<title>订单详细</title>
</head>

<body>
<div class="margin clearfix">
<div class="Order_Details_style">
<div class="Numbering">订单编号:<b>${order.orderno}</b></div></div>
 <div class="detailed_style">
 <!--收件人信息-->
    <div class="Receiver_style">
     <div class="title_name">下单人信息</div>
     <div class="Info_style clearfix">
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 下单人姓名： </label>
         <div class="o_content">${order.empno.empname}</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 下单人电话： </label>
         <div class="o_content">${order.empno.empphone}</div>
        </div>
     </div>
    </div>
    <!--订单信息-->
    <div class="product_style">
    <div class="title_name">产品信息</div>
    <div class="Info_style clearfix">
      <div class="product_info clearfix">
     <c:forEach items="${order.ordercommodityno.imagers}"  var="i">
      <a href="#" class="img_link"><img src="${pageContext.request.contextPath}/${i.imagerurl}"  title="${order.ordercommodityno.commoditytitle}"/></a>
     </c:forEach>
      <span>
      <a href="#" class="name_link">${order.ordercommodityno.commoditytitle }</a>
      <b>${order.ordercommodityno.commoditydetails }</b>
      <p>数量：${order.commoditySum}</p>
      <p>价格：<b class="price"><i>￥</i>${order.ordercommodityno.price}</b></p>  
      <p>单个积分数：<b class="price">${order.ordercommodityno.needintegral}</b></p>  
      <p>总积分数：<b class="price">${order.orderintegral}</b></p>  
      <p>状态：<c:if test="${order.orderstatus==1}"><span class="label label-warning radius">已提交</span></c:if>
      <c:if test="${order.orderstatus==2}"><span class="label label-info radius">待领取</span></c:if>
      <c:if test="${order.orderstatus==3}"><span class="label label-danger radius">已领取</span></c:if></p>   
      </span>
      </div>
    </div>
    </div>
<div class="Button_operation">
				<button onclick="article_save_submit();" id="f" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>返回上一步</button>
</div>
            
            
 </div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#f").click(function(){
			history.go(-1);
		})
	})
</script>
</html>
