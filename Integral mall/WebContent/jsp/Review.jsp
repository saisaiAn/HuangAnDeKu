<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.Integralmall.entity.IntegralSystem" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"  media="all">
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate.js" type="text/javascript"></script>
<title>留言</title>
<script type="text/javascript">
layui.use(['element', 'layer'], function(){
	  var element = layui.element;
	  var layer = layui.layer;
	  
	  //监听折叠
	  element.on('collapse(test)', function(data){
	    layer.msg('展开状态：'+ data.show);
	  });
	});
</script>
<style>
	
.aaa{
    pointer-events:none;
    cursor:not-allowed;
}
</style>
</head>

<body>
<div class="margin clearfix">
 <div class="Guestbook_style">
 <div class="search_style">
     <form action="${pageContext.request.contextPath}/integral/Integral_Review.action" method="post">
      <ul class="search_content clearfix">
       <li><label class="l_f">申请人姓名</label><input name="ssEmpName" type="text" id="ssEmpName" class="text_add" placeholder="输入留言信息" style=" width:250px"></li>
       <li><label class="l_f">时间</label><input name="scData" class="inline laydate-icon ssData" id="ssData" style=" margin-left:10px;"></li>
       <input type="hidden" value="${user.position}" id="sspostion" />
       <li style="width:90px;"><button type="submit" id="ss1" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
       <li style="width:120px;"><button type="button" style="width:120px;" class="btn_search">  <a href="${pageContext.request.contextPath}/integral/Integral_downFile.action?filename=${filename}">下载积分奖惩制度</a></button></li>
       <li style="width:120px;"><button type="button" style="width:120px;" class="btn_search">  <a href="${pageContext.request.contextPath}/integral/Integral_Excel.action"><i class="fa fa-search"></i>积分奖惩制度</a></button></li>
      </ul>
     </form>
    </div>
    <!-- <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" class="btn btn-danger Dels"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
        <a href="javascript:ovid()" class="btn btn-sm btn-primary" id="add_integral"><i class="fa fa-check"></i>&nbsp;申请积分</a>
       </span>
       <span class="r_f">共：<b>2334</b>条</span>
     </div> -->
    <!--留言列表-->
    <div class="Guestbook_list">
      <table class="table table-striped table-bordered table-hover tabemp" id="sample-table">
      <thead>
		 <tr>
          <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="80">ID</th>
          <th width="150px">用户名</th>
		  <th width="100px">姓名</th>	
		  <th width="100px">性别</th>
	   	  <th width="100px">手机</th>
		  <th width="100px">积分数</th>
		  <th width="100px">转正时间</th>
		  <th width="180px">部门</th>
		  <th width="100px">职位</th>				
		  <th width="200px">操作</th>
         </tr>
      </thead>
	<tbody>
		<c:forEach items="${userlist}" var="u">
			<c:if test="${u.position<user.position}">
			<tr>
		      <td><label><input type="checkbox" value="${u.empno}" class="ace"><span class="lbl"></span></label></td>
		      <td>${u.empno }</td>
		      <td>${u.username }</td>
		      <td>${u.empname }</td>
		      <td>${u.empsex }</td>
		      <td>${u.empphone }</td>
		      <td>${u.intergralno.remainingpoints}</td>
		      <td>${u.positivedates }</td>
		      <td>${u.department.depaname}</td>
		       <td>
					<c:if test="${u.position==1}">普通员工</c:if>
					<c:if test="${u.position==2}">部门经理</c:if>
					<c:if test="${u.position==3}">综合部经理</c:if>
					<c:if test="${u.position==4}">校长</c:if>
		      </td>
		      <td class="td-manage">
		      	<a  id=""   
		      	<c:forEach items="${tglist}" var="t">
		      	<c:if test="${u.empno==t}">onclick="" title="已审核" </c:if>
		      	</c:forEach>
		      	onclick="Guestbook_iew('${a.integralauditno}')"
		      	 href="javascript:;" class="btn btn-xs btn-info Guestbook_iew" ><i class="fa fa-edit bigger-120"></i></a>       
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
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">用户名 </label>
       <div id="sname" class="col-sm-9">胡海天堂</div>
       <input type="hidden" value="" id="sEmpNo">
       <input type="hidden" value="${user.empno}" id="sReviewNo">
	</div>
    <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否审核 </label>
       <div class="col-sm-9">
       <label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"> 审核</span></label>
       <div class="Reply_style">
     		<% 
     		ArrayList<IntegralSystem> Slist=(ArrayList<IntegralSystem>)ServletActionContext.getRequest().getAttribute("Elist");
    		 for (IntegralSystem integralSystem : Slist) {
     		%>
       			<div><input type="checkbox" class="review" value="<%=integralSystem.getSystemIntegral()%>"><%=integralSystem.getSystemDetails() %></div>
       		<% 
    		 }
       		%>
       </div>
       </div>
	</div>
 </div>
   </div>
</body>
</html>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript">
 /*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*留言-删除*/
/* function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			   url: "${pageContext.request.contextPath}/integral/Integral_DelIntgral",
			   data: { "IntegralNo":id},
			   type: "POST",
			   dataType:"Text",
			   success:function(data){
				   window.location.reload();
				} 
			}) 
	});
} */

/*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Reply_style').css('display','block');
		}
	else{
		
		 $('.Reply_style').css('display','none');
		}	
	})
$('#add_integral').on('click', function(){
	layer.open({
    type: 1,
	title:'申请积分',
	area: ['700px',''],
	shadeClose: false,
	content: $('#add_administrator_style'),
	});
})
/*留言查看*/
function Guestbook_iew(id){
	var index = layer.open({
        type: 1,
        title: '审核内容',
		maxmin: true, 
		shadeClose:false,
        area : ['600px' , ''],
        content:$('#Guestbook'),
		btn:['确定','取消'],
		yes: function(index, layero){		 
		  if($('input[name="checkbox"]').prop("checked")){			 
			 if($('.form-control').val()==""){
				layer.alert('回复内容不能为空！',{
               title: '提示框',				
			  icon:0,		
			  }) 
			 }else{			
			      layer.alert('确定回复该内容？',{
				   title: '提示框',				
				   icon:0,	
				   btn:['确定','取消'],	
				   yes: function(index){	
					  var $crowd=[];//声明存取复选框值的数组
					  var $sum=0;
						$(".review:checked").each(function(){
						   var Text=$(this).parent().text();
						   $crowd.push(Text);
						   $sum=eval($(this).val()+"+"+$sum);
						 });
						var sEmpNo=$("#sEmpNo").val();
					   $.ajax({
						   url: "${pageContext.request.contextPath}/integral/Integral_SHchenge",
						   data: { "chengeradio":$crowd.join(","),"chengeNumber":$sum,"scName":sEmpNo,"reviewerEmpNo":$("#sReviewNo").val()},
						   type: "POST",
						   dataType:"Text",
						   success:function(data){
							   if($.trim(data) == $.trim("Y")){
								  alert("审核成功");
								  window.location.reload();
							   }
							} 
						})  
					     layer.closeAll();
					   }
				  }); 		  
		   }			
	      }else{			
			 layer.alert('是否要取消回复！',{
               title: '提示框',				
			icon:0,		
			  }); 
			  layer.close(index);      		  
		  }
	   }
	})	
};
	/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
</script>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,5,6]}// 制定列不参与排序
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
				$(".Guestbook_iew").click(function(){
				  var a=$(this).parent().parent().children(":eq(1)").html();
				  var b=$(this).parent().parent().children(":eq(2)").html();
				  $("#sEmpNo").val(a);
				  $("#sname").html(b);
				});
				$("#Add_Administrator").click(function(){
					 var form = $("#form-admin-add").serialize(); 
						var inputall = form.split("&");
						var flag = true;
						for(var i = 0;i < inputall.length;i++){
							var input =  inputall[i].split("=");
							if(input[1] == ""){
								alert("请填写完整的登录信息!");
								$("input[name='"+input[0]+"']").addClass("custom-form-control");
								flag = false;
								break;
							}
						}
						if(flag){
							add_from.submit();
						}
				})
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
							   window.location.reload();
							} 
						}) 
				})
			/* 	$("#ss").click(function(){
					 $.ajax({
						   url: "${pageContext.request.contextPath}/Emp/Emp_ssEmp",
						   data: {"ssEmpName":$("#ssEmpName").val(),"ssData":$(".ssData").val()},
						   type: "POST",
						   dataType:"json",
						   contentType: "application/x-www-form-urlencoded;",
						   scriptCharset : 'utf-8',
						   success:function(data){
						   		$(".tabemp").find("tr:gt(0)").remove();
						   		for (var i = 0; i < data.length; i++) {
						   			$(data[i]).each(function(i,val) { 
						   				if(val.position<$("#sspostion").val()){
						   					var d = new Date(val.positivedates);
							   				var position;
							   				if(val.position==1)position='普通员工';
							   				if(val.position==2)position='部门经理';
							   				if(val.position==3)position='综合部经理';
							   				if(val.position==4)position='校长';
							   				var addtr = $("<tr>"+
							   		      "<td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>"+
							   		      "<td>"+val.empno+"</td>"+
							   		      "<td>"+val.username+"</td>"+
							   		      "<td>"+val.empname +"</td>"+
							   		      "<td>"+val.empsex +"</td>"+
							   		      "<td>"+val.empphone+"</td>"+
							   		      "<td>"+val.intergralno.remainingpoints+"</td>"+
							   		      "<td>"+ //实例化一个新的日期格式，使用1970 年 1 月 1 日至今的毫秒数为参数
							   		   		d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate()
							   		      +"</td>"+
							   		      "<td>"+val.department.depaname+"</td>"+
							   		      "<td>"+position+"</td>"+
							   		      "<td class='td-manage'>"+
							   		        "<a onclick=\"Guestbook_iew('${a.integralauditno}')\" id=\"\"  title=\"审核\"  href=\"javascript:;\" class=\"btn btn-xs btn-info Guestbook_iew\" ><i class=\"fa fa-edit bigger-120\"></i></a>"+      
							   		       "</td></tr>");
							   				addtr.appendTo($(".tabemp")); 
						   				}
						   				})
								}
							   }
						 }); 
				}) */
			})
</script>

