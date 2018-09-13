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
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="${pageContext.request.contextPath}/assets/laydate/laydate.js" type="text/javascript"></script>
<title>留言</title>
</head>

<body>
<div class="margin clearfix">
 <div class="Guestbook_style">
 <div class="search_style">
     <form action="${pageContext.request.contextPath}/integral/Integral_findIntegral.action" method="post">
      <ul class="search_content clearfix">
       <li><label class="l_f">申请人姓名</label><input name="scName" type="text" class="text_add" placeholder="输入留言信息" style=" width:250px"></li>
       <li><label class="l_f">时间</label><input name="scData" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li style="width:90px;"><button type="submit" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
       <li style="width:120px;"><button type="button" style="width:120px;" class="btn_search">  <a href="${pageContext.request.contextPath}/integral/Integral_Excel.action"><i class="fa fa-search"></i>积分奖惩制度</a></button></li>
      </ul>
     </form>
    </div>
    <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" class="btn btn-danger Dels"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
        <a href="javascript:ovid()" class="btn btn-sm btn-primary" id="add_integral"><i class="fa fa-check"></i>&nbsp;申请积分</a>
       </span>
       <span class="r_f">共：<b>2334</b>条</span>
     </div>
    <!--留言列表-->
    <div class="Guestbook_list">
      <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="80">ID</th>
          <th width="150px">审核人</th>
          <th width="">申请内容</th>
          <th width="200px">申请人</th>
          <th width="200px">积分数量</th>
          <th width="200px">级别</th>
          <th width="70">状态</th>                
          <th width="250">操作</th>
          </tr>
      </thead>
	<tbody>
		<c:forEach items="${Auditlist}" var="a">
		<c:if test="${a.audittype==1||a.audittype==3}">
		<c:if test="${a.integraltypeno.integraltypeno!=21}">
		<tr>
     	<td><label><input type="checkbox" value="${a.integralauditno}" class="ace"><span class="lbl"></span></label></td>
          <td>${a.integralauditno}</td>
          <td><u style="cursor:pointer"  class="text-primary" onclick="member_show('张小泉','${pageContext.request.contextPath}/jsp/member-show.jsp','1031','500','400')">${a.reviewer.empname}</u></td>
          <td class="text-l">
          ${a.intergralchange}
          </td>
          <td >${a.empno.empname}</td>
          <td>${a.changenumber}</td>
          <td><span class="label label-success radius">${a.integraltypeno.integraltypename}</span></td>
          <td class="td-status"><span class="label label-success radius">
			<c:if test="${a.audittype==1}">审核中</c:if>
			<c:if test="${a.audittype==2}">审核通过</c:if>
			<c:if test="${a.audittype==3}">审核失败</c:if>
			</span>
		 </td>
          <td class="td-manage">
       	 	<a   onclick="Guestbook_iew('${a.integralauditno}')"  title="回复"  href="javascript:;" class="btn btn-xs btn-info Guestbook_iew" ><i class="fa fa-edit bigger-120"></i></a>      
        	<a  href="javascript:;"  onclick="member_del(this,'${a.integralauditno}')" title="删除" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
          </td>
        </tr>
        </c:if>
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
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">留言用户 </label>
       <div id="sname" class="col-sm-9">胡海天堂</div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 留言内容 </label>
       <div id="schange" class="col-sm-9">三年同窗，一起沐浴了一片金色的阳光，一起度过了一千个日夜，我们共同谱写了多少友谊的篇章?愿逝去的那些闪亮的日子，都化作美好的记忆，永远留在心房。认识您，不论是生命中的一段插曲，还是永久的知已，我都会珍惜，当我疲倦或老去，不再拥有青春的时候，这段旋律会滋润我生命的每一刻。在此我只想说：有您真好!无论你身在何方，我的祝福永远在您身边!</div>
	</div>
    <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">是否回复 </label>
       <div class="col-sm-9">
       <label><input name="checkbox" type="checkbox" class="ace" id="checkbox"><span class="lbl"> 回复</span></label>
       <div class="Reply_style">
       	  <input type="radio" name="chenge" id="chengepd" value="2"/>审核成功 &nbsp; &nbsp; &nbsp;<input type="radio" name="chenge" value="3"/>审核失败<br/>
          <textarea name="权限描述" class="form-control" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea>
          <span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span>
       </div>
       </div>
	</div>
 </div>
   </div>
   <!-- 积分申请 -->
 <div id="add_administrator_style" class="add_menber" style="display:none">
    <form name="add_from" action="${pageContext.request.contextPath}/integral/Integral_AddIntegral.action" method="post" id="form-admin-add">
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>申请人：</label>
			<div class="formControls">
				<select class="select" name="IntegralEmpname" size="1">
					<option value="0" selected="selected">请选择</option>
					<c:forEach items="${Emplist}" var="d">
						<c:if test="${user.department.depano==d.department.depano}">
							<c:if test="${d.position<3}"><option value="${d.empno}">${d.empname}</option></c:if>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label ">积分级别：</label>
			<div class="formControls  skin-minimal">
		   		<select class="select" name="integraltypeno" size="1">
					<option value="0" selected="selected">请选择</option>
					<c:forEach items="${integralType}" var="it">
					<option value="${it.integraltypeno}">${it.integraltypename}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label ">积分数：</label>
			<div class="formControls ">
				<input type="text" onkeyup="value=value.replace(/[^\d-+]/g,'') " ng-pattern="/[^a-zA-Z]/" class="input-text" value="" placeholder="" id="user-tel" name="changenumber" datatype="m" nullmsg="手机不能为空">
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label"><span class="c-red">*</span>变动原因：</label>
			<div class="formControls ">
				<textarea name="intergralchange" cols="" rows="" class="textarea" 
				placeholder="说点什么..." datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" 
				onkeyup="textarealength(this,200)"></textarea>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div class="form-group">
			<label class="form-label">审核人：</label>
			<div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="reviewerEmpNo" size="1">
					<option value="0" selected="selected">请选择</option>
					<c:forEach items="${Emplist}" var="d">
						<c:if test="${user.department.depano==d.department.depano}">
							<c:if test="${d.position>2}"><option value="${d.empno}">${d.empname}</option></c:if> 
						</c:if>
					</c:forEach>
				</select>
				</span> </div>
		</div>
		<div class="form-group">
			<label class="form-label">审核人意见：</label>
			<div class="formControls ">
				<textarea name="auditopinion" cols="" rows="" class="textarea" 
				placeholder="说点什么..." datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" 
				onkeyup="textarealength(this,200)"></textarea>
			</div>
			<div class="col-4"> <span class="Validform_checktip"></span></div>
		</div>
		<div> 
        <input class="btn btn-primary radius" type="button" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
	</form>
</div>
</body>
</html>
<script type="text/javascript">
 /*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*留言-删除*/
function member_del(obj,id){
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
}

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
        title: '申请内容',
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
					  var chengeradio= $('input:radio[name="chenge"]:checked').val();
					    $.ajax({
						   url: "${pageContext.request.contextPath}/integral/Integral_Updchenge",
						   data: { "changeNo":id,"schange":$.trim($("#schange").html()),"AuditOpinion":$("#form_textarea").val(),"AuditType":chengeradio},
						   type: "POST",
						   dataType:"Text",
						   success:function(data){
							   location.href="${pageContext.request.contextPath}/integral/Integral_findIntegral.action";
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
				  var a=$(this).parent().parent().children(":eq(4)").html();
				  var b=$(this).parent().parent().children(":eq(3)").html();
				  $("#sname").html(a);
				  $("#schange").html(b);
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
			})
</script>

