<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${pageContext.request.contextPath}/css/dlstyle.css"
	rel="stylesheet" type="text/css">
</head>

<body>

	<div class="login-boxtitle">
		<a href="home.jsp"><img alt="logo"
			src="${pageContext.request.contextPath}/images/logo.png" /></a>
		<li><span style="font-size: 25px; font-weight: bolder">&nbsp;&nbsp;新途积分商城</span></li>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/images/big.jpg" />
					
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
				
					<form action="${pageContext.request.contextPath }/Emp/Emp_loginIndex.action"  method="post" >
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="username" id="user" placeholder="邮箱/手机/用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password" placeholder="请输入密码">
						</div>
				</div>

				<div class="login-links">
					<label for="remember-me"><input id="remember-me"
						type="checkbox">记住密码</label> <a href="#" class="am-fr">忘记密码</a> 
				</div>
				<div class="am-cf">
					<input type="submit" name="" value="登 录"
						class="am-btn am-btn-primary am-btn-sm">
				</div>
					</form>
				
				<div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#" id="qqLoginBtn" ><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span>
						</a></li>
					</div>
					<script type="text/javascript">
					function toLogin()
					 {
						//onclick='toLogin()'
					   //以下为按钮点击事件的逻辑。注意这里要重新打开窗口
					   //否则后面跳转到QQ登录，授权页面时会直接缩小当前浏览器的窗口，而不是打开新窗口
					   var A=window.open("${pageContext.request.contextPath }/Php/index.php","TencentLogin", 
					   "width=450,height=320,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1");
					 } 
					</script>
					<script type="text/javascript"  charset="utf-8"
					    src="http://connect.qq.com/qc_jssdk.js" 
					    data-appid="1107787832" 
					    data-redirecturi="https://www.baidu.com/" 
					></script>
					<script type="text/javascript">
						    QC.Login({
						       btnId:"qqLoginBtn"    //插入按钮的节点id
						});
						</script>
				</div>

			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>
				<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
					href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p>
				<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
					href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
					- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
					target="_blank">网页模板</a></em>
			</p>
		</div>
	</div>
</body>
</html>