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
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/Widget/Validform/5.3.2/Validform.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript" ></script>          
		<script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript" ></script>
         <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript"></script>	
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate.js" type="text/javascript"></script>
<title>管理员</title>
</head>

<body>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
    <div class="search_style">
     <form action="" method="post" name="ssform" >
      <ul class="search_content clearfix">
       <li><label class="l_f">管理员名称</label><input name="ssEmpName" type="text" id="ssEmpName" class="text_add" placeholder=""  style=" width:400px"/></li>
       <li><label class="l_f">添加时间</label><input name="ssData"  class="inline laydate-icon ssData" id="start" style=" margin-left:10px;"></li>
       <input type="hidden" value="${user.position}" id="sspostion" />
       <li style="width:90px;"><button type="button" id="ss" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
      </ul>
      </form>
    </div>
    <!--操作-->
     <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
        <a href="javascript:ovid()" class="btn btn-danger Dels"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
       <span class="r_f">共：<b>${usersum}</b>人</span>
     </div>
     <!--管理员列表-->
     <div class="clearfix administrator_style" id="administrator">
      <div class="left_style">
      <div id="scrollsidebar" class="left_Treeview">
        <div class="show_btn" id="rightArrow"><span></span></div>
        <div class="widget-box side_content" >
         <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">管理员分类列表</h4></div>
         <div class="widget-body">
           <ul class="b_P_Sort_list">
           <li><i class="fa fa-users green"></i> <a href="#">全部管理员（13）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">超级管理员（1）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">普通管理员（5）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">产品编辑管理员（4）</a></li>
            <li><i class="fa fa-users orange"></i> <a href="#">管理员（1）</a></li>
           </ul>
        </div>
       </div>
      </div>  
      </div>
      </div>
      <div class="table_menu_list"  id="testIframe">
           <table class="table table-striped table-bordered table-hover tabemp" id="sample_table">
		<thead>
		 <tr>
				<th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">编号</th>
				<th width="150px">用户名</th>
				<th width="100px">姓名</th>	
				<th width="100px">性别</th>
				<th width="100px">手机</th>
				<th width="100px">积分数</th>
				<th width="180px">转正时间</th>
                <th width="100px">身份证</th>				
				<th width="180px">部门</th>
				<th width="100px">职位</th>				
				<th width="200px">操作</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${userlist}" var="u">
	<c:if test="${u.position<user.position&&u.department.depano==user.department.depano||user.position==4}">
	<tr>
      <td><label><input type="checkbox" value="${u.empno}" class="ace"><span class="lbl"></span></label></td>
      <td>${u.empno }</td>
      <td>${u.username }</td>
      <td>${u.empname }</td>
      <td>${u.empsex }</td>
      <td>${u.empphone }</td>
      <td>${u.intergralno.remainingpoints}</td>
      <td>${u.positivedates }</td>
      <td>${u.idcard }</td>
      <td>${u.department.depaname}</td>
       <td>
			<c:if test="${u.position==1}">普通员工</c:if>
			<c:if test="${u.position==2}">部门经理</c:if>
			<c:if test="${u.position==3}">综合部经理</c:if>
			<c:if test="${u.position==4}">校长</c:if>
      </td>
      <td class="td-manage">
        <a title="删除" href="javascript:;"  onclick="member_del(this,'${u.empno }')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
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
<script type="text/javascript">
$(function(){
	$(".Dels").click(function(){
		var crowd=[];//声明存取复选框值的数组
		$("input:checkbox:checked").each(function(){
		   crowd.push(this.value);
		 });
		$.ajax({
			   url: "${pageContext.request.contextPath}/Emp/Emp_Delemps",
			   data: { "DelNos":crowd.join(",")},
			   type: "POST",
			   dataType:"Text",
			   success:function(data){
				   location.href="${pageContext.request.contextPath}/Emp/Emp_Empfinds";
				} 
			}) 
	})
})
</script>
 <!--添加管理员-->
 <div id="add_administrator_style" class="add_menber" style="display:none">
    <form action="${pageContext.request.contextPath}/Emp/Emp_AddEmp.action" name="add_from" method="post" id="form-admin-add">
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>用户名：</label>
			<div class="formControls">
				<input type="text" class="input-text username" value="" placeholder="" id="user-name" name="newusername" datatype="*2-16" nullmsg="用户名不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls">
			<input type="password" placeholder="密码" name="userpassword" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>确认密码：</label>
			<div class="formControls ">
		<input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error" errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword" id="newpassword2" name="newpassword">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>姓名：</label>
			<div class="formControls">
				<input type="text" class="input-text" value="" placeholder="" id="username" name="empname" datatype="*2-16" nullmsg="姓名不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>性别：</label>
			<div class="formControls  skin-minimal">
		      <label><input name="empsex" type="radio" value="no" class="ace" checked="checked"><span class="lbl">保密</span></label>&nbsp;&nbsp;
            <label><input name="empsex" type="radio" value="男" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;
            <label><input name="empsex" type="radio" value="女" class="ace"><span class="lbl">女</span></label>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label "><span class="c-red">*</span>手机：</label>
			<div class="formControls ">
				<input type="text" class="input-text" value="" placeholder="" id="user-tel" name="empphone" datatype="m" nullmsg="手机不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>身份证：</label>
			<div class="formControls ">
				<input type="text" class="input-text"  name="idcard" id="idcard" nullmsg="请输入身份证！">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label">职位：</label>
			<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="position" size="1">
					<option value="0" selected="selected">请选择</option>
					<option value="1">普通员工</option>
					<option value="2">部门经理</option>
					<option value="3">综合部经理</option>
					<option value="4">校长</option>
				</select>
				</span> </div>
		</div>
		<div class="form-group">
			<label class="form-label">所属部门：</label>
			<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="department.depano" size="1">
					<option value="0" selected="selected">请选择</option>
					<c:forEach items="${depalist}" var="d">
					<option value="${d.depano}">${d.depaname}</option>
					</c:forEach>
				</select>
				</span> </div>
		</div>
		<div> 
        <input class="btn btn-primary radius submit" type="button" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
	</form>
   </div>
 </div>
</body>
</html>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample_table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
		] } );
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			var bool=true;
			$(".username").blur(function(){
				$.ajax({
					   url: "${pageContext.request.contextPath}/Emp/Emp_EmpfindUsername",
					   data: {"username":$("#user-name").val()},
					   type: "POST",
					   dataType:"Text",
					   contentType: "application/x-www-form-urlencoded;",
					   scriptCharset : 'utf-8',
					   success:function(data){
					   		if(data>0){
					   			bool=false;
					   			alert("用户名已存在");
					   		}else{
					   			bool=true;
					   		}
						   }
					 });
			});
		$(".submit").click(function(){
			if(bool){
				add_from.submit();
			}
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
			});

</script>
<script type="text/javascript">
$(function() { 
	$("#administrator").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
	});
	$("#ss").click(function(){
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
				   		      "<td>"+val.idcard+"</td>"+
				   		      "<td>"+val.department.depaname+"</td>"+
				   		      "<td>"+position+"</td>"+
				   		      "<td class='td-manage'>"+
				   		        "<a title='删除' href='javascript:;'  onclick='member_del(this,'"+val.empno+"')' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>"+
				   		       "</td></tr>");
				   				addtr.appendTo($(".tabemp")); 
			   				}
			   				})
					}
				   }
			 });
	})
});
//字数限制
function checkLength(which) {
	var maxChars = 100; //
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
//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 laydate({
    elem: '#start',
    event: 'focus' 
});

/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="fa fa-close bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}
/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="fa fa-check  bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*产品-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*产品-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			   url: "${pageContext.request.contextPath}/Emp/Emp_Delemp",
			   data: {"empdelNo":id},
			   type: "POST",
			   dataType:"json",
			   contentType: "application/x-www-form-urlencoded;",
			   scriptCharset : 'utf-8',
			   success:function(data){
			   		$(".tabemp").find("tr:gt(0)").remove();
			   		for (var i = 0; i < data.length; i++) {
			   			$(data[i]).each(function(i,val) { 
			   				var d = new Date(new Date(val.positivedates));  
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
			   		      "<td>"+val.idcard+"</td>"+
			   		      "<td>"+val.department.depaname+"</td>"+
			   		      "<td>"+position+"</td>"+
			   		      "<td class='td-manage'>"+
			   		        "<a title='删除' href='javascript:;'  onclick='member_del(this,'"+val.empno+"')' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a>"+
			   		       "</td></tr>");
			   				addtr.appendTo($(".tabemp"));     
			   				})
					}
				   }
			 });
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
/*添加管理员*/
$('#administrator_add').on('click', function(){
	layer.open({
    type: 1,
	title:'添加管理员',
	area: ['700px',''],
	shadeClose: false,
	content: $('#add_administrator_style'),
	
	});
})
	//表单验证提交
$("#form-admin-add").Validform({
		 tiptype:2,
		callback:function(data){
		//form[0].submit();
		if(data.status==1){ 
                layer.msg(data.info, {icon: data.status,time: 1000}, function(){ 
                    location.reload();//刷新页面 
                    });   
            } 
            else{ 
                layer.msg(data.info, {icon: data.status,time: 3000}); 
            } 		  
			var index =parent.$("#iframe").attr("src");
			parent.layer.close(index);
			//
		}
		
		
	});	
</script>