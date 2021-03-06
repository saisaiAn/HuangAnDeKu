<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/orstyle.css"
	rel="stylesheet" type="text/css">

<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">亲，请登录</a> 
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="#" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logoBig">
				<li><img
					src="${pageContext.request.contextPath}/images/logo.png" /></li>
					<li><span style="font-size: 25px; font-weight: bolder;color:#FF6666">&nbsp;&nbsp;新途积分商城</span></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	</article> </header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<!-- <li><a href="#tab2">待付款</a></li> 
							<li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
							 <li><a href="#tab5">待评价</a></li> -->
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number" style="margin-left: 70px;">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">&nbsp;</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">订单状态</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">


										<!--不同状态订单-->
										<c:forEach items="${orders}" var="o">
										<div class="order-status3">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">${o.orderno}</a>
												</div>
												<span>生成时间：${o.ordertime}</span>
												<!--    <em>店铺：小桔灯</em>-->
												<div style="border: 0.5px solid skyblue; width: 172px;height: 23px;" class="dhm"><input type="text" class="a" placeholder="悬浮显示兑换码" ><input type="hidden" class="random" value="${o.random}"></div>
												<script type="text/javascript">
													$(function(){
														$(".dhm").hover(function(){
															$(this).children(".random").attr('type','text');
															$(this).children(".a").attr('type','hidden');
														},function(){
															$(this).children(".random").attr('type','hidden');
															$(this).children(".a").attr('type','text');
														})
													})
												</script>
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
															 <c:forEach items="${o.ordercommodityno.imagers}"  var="i">
														    	<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath}/${i.imagerurl}"
																	class="itempic J_ItemImg">
																</a>
														     </c:forEach>
																
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>${o.ordercommodityno.commoditytitle}</p>
																		<p class="info-little">
																			${o.ordercommodityno.commoditydetails}
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">${o.ordercommodityno.needintegral}</div>
														</li>
														<li class="td td-number" style="margin-left: 70px;">
															<div class="item-number">
																<span>×</span>${o.commoditySum}
															</div>
														</li>
													</ul>
												</div>
												<div class="order-right">
												<ul>
													<li class="td td-amount">
														<div class="item-amount">
															合计：${o.orderintegral}
														</div>
													</li>
													
													
													<li class="td td-amount">
														<div class="item-amount">
														 <c:if test="${o.orderstatus==1}"><span style="color:black;">代发货</span></c:if>
     													 <c:if test="${o.orderstatus==2}"><span style="color: blue;">已发货</span></c:if>
      													 <c:if test="${o.orderstatus==3}"><span style="color: red;">已收货</span></c:if>
														</div>
													</li>
													</ul>
												</div>
												
											</div>
										</div>
										</c:forEach>
									</div>

								</div>

							</div>
					
					
				
						</div>

					</div>
				</div>
			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
							href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
							- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
							target="_blank">网页模板</a></em>
					</p>
				</div>

			</div>
		</div>
<aside class="menu">
		<ul>
			<li class="person active"><a href="${pageContext.request.contextPath}/Emp/person/index.jsp"><i
					class="am-icon-user"></i>个人中心</a></li>
			<li class="person">
				<p>
					<i class="am-icon-newspaper-o"></i>个人资料
				</p>
				<ul>
					<li><a href="${pageContext.request.contextPath}/Emp/person/information.jsp">个人信息</a></li>
				</ul>
			</li>
			<li class="person">
				<p>
					<i class="am-icon-balance-scale"></i>我的交易
				</p>
				<ul>
					<li><a href="${pageContext.request.contextPath}/Emp/Emp_orders?empno=${user.empno}">订单管理</a></li>
				</ul>
			</li>
			<li class="person">
				<p>
					<i class="am-icon-dollar"></i>我的资产
				</p>
				<ul>
					<li><a href="${pageContext.request.contextPath}//integral/Integral_points?empno=${user.empno}">我的积分</a></li>
				</ul>
			</li>


			
		</ul>

		</aside>
	</div>

</body>
</html>
