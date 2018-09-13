<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
 <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ysnidongma.css">
        <link href="${pageContext.request.contextPath}/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript" ></script>
<title>订单处理</title>
</head>

<body>
<div class="clearfix">
 <div class="handling_style" id="order_hand">
      <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">订单操作</h4></div>
         <div class="widget-body">
          <ul class="b_P_Sort_list">
             <li><i class="orange  fa fa-reorder"></i><a href="#">全部订单(235)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">已完成(235)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">代付款(15)</a> </li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">代发货(56)</a></li>
             <li><i class="fa fa-sticky-note pink "></i> <a href="#">代收货(32)</a></li>
            </ul>
        </div>
       </div>
      </div>  
     </div>
 <div class="order_list_style" id="order_list_style">
  <div class="search_style">
     
      <ul class="search_content clearfix">
        <form action="${pageContext.request.contextPath}/Order/Order_finda" method="post">
       <li><label class="l_f">订单编号</label><input  type="text" name="orderss" class="text_add" placeholder="订单订单编号" style=" width:250px"></li>
       <li><label class="l_f">时间</label><input class="inline laydate-icon" name="orderssDate" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="submit" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
      </form>
       <li style="width:120px;"><button type="button" style="width:120px;" onClick="Delivery_stop(this,'1')" class="btn_search"><i class="fa fa-search"></i>积分兑换</button></li>
      </ul>
    </div>
    <!--交易订单列表-->
    <div class="Orderform_list">
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="120px">订单编号</th>
				<th width="250px">订单商品</th>
				<th width="100px">商品数量</th>
				<th width="100px">订单所用积分</th>
                <th width="100px">订单时间</th>				
				<th width="180px">所属类型</th>
				<th width="70px">状态</th>                
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
 	<c:forEach items="${Orders}" var="order">
	<c:if test="${order.orderstatus!=1}">
     <tr>
     <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
     <td>${order.orderno }</td>
     <td class="order_product_name">
     <c:forEach items="${order.ordercommodityno.imagers}"  var="i">
      <a href="#"><img src="${pageContext.request.contextPath}/${i.imagerurl}"  title="${order.ordercommodityno.commoditytitle}"/></a>
     </c:forEach>
     </td>
     <td>${order.commoditySum}</td>
     <td>${order.orderintegral}</td>
     <td>${order.ordertime}</td>
     <td>${order.ordercommodityno.commoditytypeno.commoditytypename}</td>
      <td class="td-status">
      <c:if test="${order.orderstatus==1}"><span class="label label-warning radius">已提交</span></c:if>
      <c:if test="${order.orderstatus==2}"><span class="label label-info radius">待领取</span></c:if>
      <c:if test="${order.orderstatus==3}"><span class="label label-danger radius">已领取</span></c:if>
      </td>
     <td>
     <a title="订单详细"  href="${pageContext.request.contextPath}/Order/Order_findd?orderNo=${order.orderno}"  class="btn btn-xs btn-info order_detailed" ><i class="fa fa-list bigger-120"></i></a> 
     <a title="删除" href="javascript:;"  onclick="Order_form_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>    
     </td>
     </tr>
     </c:if>
     </c:forEach>
    </tbody>
    </table>   
    </div>
 </div>
 </div>
</div>
<!--发货-->
 <div id="Delivery_stop" style=" display:none">
  <div class="">
    <div class="content_style">
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 请输入兑换码： </label>
    <div class="col-sm-9"><input type="text" id="form-field-1" placeholder="兑换码" class="col-xs-10 col-sm-5" style="margin-left:0px;"></div>
	</div>
 </div>
  </div>
 </div>
</body>
</html>
<script>
$(function() { 
	$("#order_hand").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:30,//设置隐藏时的距离
	    spacingh:250,//设置显示时间距
		table_menu:'.order_list_style',
	});
});


//时间
 laydate({
    elem: '#start',
    event: 'focus' 
});
//初始化宽度、高度  
 $(".widget-box").height($(window).height()); 
$(".order_list_style").width($(window).width()-220);
 $(".order_list_style").height($(window).height()-30);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height());
	 $(".order_list_style").width($(window).width()-234);
	  $(".order_list_style").height($(window).height()-30);
});
/**发货**/
function Delivery_stop(obj,id){
	layer.open({
        type: 1,
        title: '发货',
		maxmin: true, 
		shadeClose:false,
        area : ['500px' , ''],
        content:$('#Delivery_stop'),
		btn:['确定','取消'],
		yes: function(index, layero){
			 $.ajax({
				   url: "${pageContext.request.contextPath}/Commodity/Commodity_ForOrders",
				   data: { "Random": $("#form-field-1").val()},
				   type: "POST",
				   dataType:"Text",
				   contentType: "application/x-www-form-urlencoded;",
				   scriptCharset : 'utf-8',
				   success:function(data){
								if("Y"==data.trim()){
									alert("兑换成功！");
									window.location.reload()
								}else if("N"==data.trim()){
									alert("兑换失败，该兑换码无效！");
									window.location.reload()
								}else if("E"==data.trim()){
									alert("兑换失败，管理员未发货！");
									window.location.reload()
								}else if("C"==data.trim()){
									alert("兑换失败，该兑换码已使用！");
									window.location.reload()
								}			   		
					   }
				 }); 
		}
	})
};
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,8,9]}// 制定列不参与排序
		] } );
                 //全选操作
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			});
</script>
