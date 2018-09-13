<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ysnidongma.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>   
<link href="${pageContext.request.contextPath}/assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<link href="${pageContext.request.contextPath}/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

<title>新增图片</title>
<style type="text/css">
body { margin:0; } 
.ddd{ border:0; padding:0; margin:0; } 
.div { margin:0 auto; width:100%; overflow:hidden; padding:20px 0; } 
.line { position:relative; margin:0 auto; width:300px; text-align:left } 
.line span.span { float:left; padding-top:2px; } 
.file { position:absolute; left:0; width:250px; top:0;
 height:28px; filter:alpha(opacity=0); opacity:0; cursor: pointer } 
.file1 { float:left; margin-left:8px; z-index:1; width:66px;
 height:28px; line-height:28px; background:url(liulan.gif) no-repeat 0 0;
 text-indent:-9999px; cursor: pointer } 
.inputstyle { border:1px solid #BEBEBE; width:170px; float:left;
 height:23px; line-height:23px; background:#FFF; z-index:99 } 
 
 .styled-select select {
   background: transparent;
   width: 268px;
   padding: 5px;
   font-size: 16px;
   border: 1px solid #ccc;
   height: 34px;
   -webkit-appearance: none; /*for chrome*/
}
</style>
</head>
<body>
<div class="clearfix" id="add_picture">

   <div class="page_left_style">
   <div class="type_title" style="font-size: 30px;text-align: center;">添加商品</div>
   <div style="width: 60%;margin: 0 auto;">
	<form action="${pageContext.request.contextPath}/Commodity/Commodity_Add.action" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
		<div class="clearfix cl">
         <label class="form-label col-2"><span class="c-red">*</span>图片标题：</label>
		 <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder="" id="" name="imagerTitle"></div>
		</div>
		<div class=" clearfix cl">
         <label class="form-label col-2">商品标题：</label>
	     <div class="formControls col-10"><input type="text" class="input-text" value="" placeholder="" id="" name="commodity.commoditytitle"></div>
		</div>
		<div class=" clearfix cl">
            <div class="Add_p_s">
             <label class="form-label col-2">所需积分：</label>	
			 <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder="" id="" name="commodity.needintegral" ></div>
			</div> 
            <div class="Add_p_s">
             <label class="form-label col-2">商品价格：</label>	
			 <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder="" id="" name="commodity.price" ></div>
			</div>
            <div class="Add_p_s">
             <label class="form-label col-2">商品库存：</label>	
			 <div class="formControls col-2"><input type="text" class="input-text" value="" placeholder="" id="" name="commodity.commodityinventory" ></div>
			</div>
			 
		</div>
		 &nbsp; &nbsp; &nbsp;
			<div class="clearfix cl">
			
			<fieldset class="layui-elem-field" style="width:940px;">
		  <legend>商品分类-请从左至右选择</legend>
		  <div class="layui-field-box">
		    <div class="styled-select">
						 <select id="comtypes">
						 <option value="0" selected="selected">请选择</option>
						 	<c:forEach items="${tlist}" var="t">
						 		<option value="${t.commodityTypeNo }">${t.commoditytypename }</option>
						 	</c:forEach>
						 </select>
						 &nbsp; &nbsp; &nbsp;
						  <select id="comtypess">
						 <option value="0" selected="selected">请选择</option>
						 	<%-- <c:forEach items="${tlist}" var="t">
						 		<option value="${t.commodityTypeNo}">${t.commoditytypename}</option>
						 	</c:forEach> --%>
						 </select>
						  &nbsp; &nbsp; &nbsp;
						  <select name="Commoditytypeno" id="comtypesss">
						 <option value="0" selected="selected">请选择</option>
						 <%-- 	<c:forEach items="${tlist}" var="t">
						 		<option value="${t.commodityTypeNo }">${t.commoditytypename }</option>
						 	</c:forEach> --%>
						 </select>
				</div>
		  </div>
		</fieldset>
				
			</div>
		<div class="clearfix cl">
			<label class="form-label col-2">内容摘要：</label>
			<div class="formControls col-10">
				<textarea name="commodity.commoditydetails" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="textarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		
		<div class="clearfix cl">
			<label class="form-label col-2">图片上传：</label>
			<div class="formControls col-10">
				<div class="uploader-list-container"> 
					<div class="div"> 
						<div class="line">
						<div class="layui-upload-drag" id="test10">
						  <i class="layui-icon"></i>
						  <p>点击上传，或将文件拖拽到此处</p>
						</div> 
						<span class="span"> 
						<input name="" type="text" id="viewfile"
						 onmouseout="document.getElementById('upload').style.display='none';"
						 class="inputstyle ddd" /> 
						</span> 
						<label for="unload"
						 onmouseover="document.getElementById('upload').style.display='block';"
						 class="file1">浏览...</label> 
						<input type="file"
						 onchange="document.getElementById('viewfile').value=this.value;this.style.display='block';"
						 class="file ddd" name="imager" id="id-input-file-2" /> 
						</div> 
						</div> 
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;

  //拖拽上传
  upload.render({
    elem: '#test10'
    ,url: '${pageContext.request.contextPath}/Commodity/Commodity_upload.action'
    ,done: function(res){
    }
  });
  
});
</script>
		<div class="clearfix cl">
			<div class="Button_operation">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>保存并提交审核</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	</div>
    </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>   
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/typeahead-bs2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/layer/layer.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/assets/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script> 
<script src="${pageContext.request.contextPath}/js/lrtk.js" type="text/javascript" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.admin.js"></script> 
<script type="text/javascript">
	$(function(){
		$("#comtypes").blur(function(){
			  $.ajax({
				   url: "${pageContext.request.contextPath}/Commodity/Commodity_findsuper",
				   data: { "commotypeNo": $("#comtypes").val()},
				   type: "POST",
				   dataType:"JSON",
				   success:function(data){
				   		$("#comtypess").find("option:gt(0)").remove();
				   		for (var i = 0; i < data.length; i++) {
				   			$(data[i]).each(function(i,val) { 
				   				var addtr="<option value="+val.commodityTypeNo+">"+val.commoditytypename+"</option>";
				   				$("#comtypess").append(addtr);
				   			})
						} 
				   	
					   }
				   
				 });
		});
		$("#comtypess").blur(function(){
			  $.ajax({
				   url: "${pageContext.request.contextPath}/Commodity/Commodity_findsuper",
				   data: { "commotypeNo": $("#comtypess").val()},
				   type: "POST",
				   dataType:"JSON",
				   success:function(data){
				   		$("#comtypesss").find("option:gt(0)").remove();
				   		for (var i = 0; i < data.length; i++) {
				   			$(data[i]).each(function(i,val) { 
				   				var addtr="<option value="+val.commodityTypeNo+">"+val.commoditytypename+"</option>";
				   				$("#comtypesss").append(addtr);
				   			})
						} 
				   	
					   }
				   
				 });
		});
	})
</script>
</body>
</html>