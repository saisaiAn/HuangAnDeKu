<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
 <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ysnidongma.css">
        <link href="${pageContext.request.contextPath}/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/displayPart.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate.js" type="text/javascript"></script>
		  
<title>意见反馈</title>
</head>

<body>
<div class="margin clearfix">
 <div class="Feedback_style">
   <div class="search_style">
     <form action="${pageContext.request.contextPath}/integral/Integral_findIntegrals.action" method="post">
      <ul class="search_content clearfix">
       <li><label class="l_f">留言</label><input name="scName" type="text" class="text_add" placeholder="输入留言信息" style=" width:250px"></li>
       <li><label class="l_f">时间</label><input name="scData" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="submit" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
      </form>
    </div>
  <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" class="btn btn-danger Dels"><i class="fa fa-trash "></i>&nbsp;批量删除</a>
        <a href="javascript:ovid()" class="btn btn-sm btn-primary"><i class="fa fa-check"></i>&nbsp;已浏览</a>
        <a href="javascript:ovid()" class="btn btn-yellow"><i class="fa fa-times"></i>&nbsp;未浏览</a>
        <a href="javascript:ovid()" class="btn btn-success"><i class="fa fa-feed"></i>&nbsp;建议</a>
        <a href="javascript:ovid()" class="btn btn-success"><i class="fa fa-feed"></i>&nbsp;投诉</a>
       </span>
       <span class="r_f">共：<b>2334</b>条</span>
     </div>
    <div class="feedback">
      <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="80">ID</th>
          <th width="">申请内容</th>
          <th width="100px">申请人</th>
          <th width="100px">积分数量</th>
          <th width="100px">审核人</th>
          <th width="">审核意见</th>
          <th width="100px">级别</th>
          <th width="250">操作</th>
          </tr>
      </thead>
	<tbody>
	<c:forEach items="${Auditlist}" var="a">
		<c:if test="${a.audittype==2}">
		<tr>
     <td><label><input type="checkbox" value="${a.integralauditno}" class="ace"><span class="lbl"></span></label></td>
          <td>${a.integralauditno}</td>
          <td class="text-l">
          ${a.intergralchange}
          <td >${a.empno.empname}</td>
          <td>${a.changenumber}</td>
          <td>${a.reviewer.empname}</td>
          <td>${a.auditopinion}</td>
          <td><span class="label label-success radius">${a.integraltypeno.integraltypename}</span></td>
          <td class="td-manage">
       	 	<a  onclick="Guestbook_iew('${a.integralauditno}','${a.changenumber}')"  title="回复"  href="javascript:;" class="btn btn-xs btn-info Feedback_iew" ><i class="fa fa-edit bigger-120"></i></a>      
        	<a  href="javascript:;"  onclick="member_del(this,'1')" title="删除" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
          </td>
        </tr>
        </c:if>
     </c:forEach>
        </tbody>
      </table>
    </div>
 </div>
</div>
<!--留言详细-->
<div id="Guestbook" style="display:none">
 <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">申请人 </label>
       <div class="col-sm-9" id="emp"></div>
	</div>
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">申请内容 </label>
       <div class="col-sm-9" id="intergralchange"></div>
	</div>
     <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">审核人  </label>
       <div class="col-sm-9" id="reviewer"></div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">审核意见  </label>
       <div class="col-sm-9" id="auditopinion"></div>
	</div>
	 <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">审核意见  </label>
       <div class="col-sm-9"><input type="radio" name="chenge" id="chengepd" value="1"/>批准 &nbsp; &nbsp; &nbsp;<input type="radio" name="chenge" value="0"/>不批准<br/></div>
	</div>
	
   
 </div>
</div>
</body>
</html>
<script type="text/javascript">
$(function(){
	$(".Dels").click(function(){
		var crowd=[];//声明存取复选框值的数组
		$("input:checkbox:checked").each(function(){
		   crowd.push(this.value);
		 });
		$.ajax({
			   url: "${pageContext.request.contextPath}/integral/Integral_DelIntgrals",
			   data: { "DelNos":crowd.join(",")},
			   type: "POST",
			   dataType:"Text",
			   success:function(data){
				   location.href="${pageContext.request.contextPath}/integral/Integral_findIntegrals.action";
				} 
			}) 
	})
})
</script>
<script type="text/javascript">
/*留言查看*/
function Guestbook_iew(id,Number){
	var index = layer.open({
        type: 1,
        title: '反馈信息',
		maxmin: true, 
		shadeClose:false,
        area : ['600px' , ''],
        content:$('#Guestbook'),
		btn:['确定','取消'],
		yes: function(index, layero){
			var chengeradio= $('input:radio[name="chenge"]:checked').val();
			 $.ajax({
				   url: "${pageContext.request.contextPath}/integral/Integral_Tjchenge",
				   data: { "changeNo":id,"chengeradio":chengeradio,"chengeNumber":Number},
				   type: "POST",
				   dataType:"Text",
				   success:function(data){
					   window.location.reload();
					} 
				}) 
		}
	})	
};
/*留言-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
jQuery(function($) {
	$(".Feedback_iew").click(function(){
		  var b=$(this).parent().parent().children(":eq(2)").html();
	      var a=$(this).parent().parent().children(":eq(3)").html();
		  var c=$(this).parent().parent().children(":eq(5)").html();
		  var d=$(this).parent().parent().children(":eq(6)").html();
		 $("#emp").html(a);
		 $("#intergralchange").html(b);
		 $("#reviewer").html(c);
		 $("#auditopinion").html(d);
	});
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});	
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
	})

</script>
