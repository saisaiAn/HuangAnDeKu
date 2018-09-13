<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>积分商城首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/hmstyle.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
				<a href="Emp/home/login.jsp" target="_top" class="h">亲，请登录</a>	
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
				<!--  	<div class="menu-hd">
						<a href="${pageContext.request.contextPath }/Emp/Emp_loginIndex.action" target="_top" class="h">商城首页</a>
					</div>-->
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="Emp/person/index.jsp" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
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
			<!--  <div class="logo"><img src="${pageContext.request.contextPath}/images/logo.png" /></div>-->
			<div class="logoBig">
				<li><img
					src="${pageContext.request.contextPath}/images/logo.png" /></li>
				<li><span style="font-size: 25px; font-weight: bolder;">&nbsp;&nbsp;新途积分商城</span></li>
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

	<div class="shopNav" >
		<div class="slideall" style="height: auto;">

			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="home/index.jsp">首页</a></li>
					<li class="qc"><a href="#">闪购</a></li>
					<li class="qc"><a href="#">限时抢</a></li>
					<li class="qc"><a href="#">团购</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<div class="bannerTwo">
				<!--轮播 -->
				<div class="am-slider am-slider-default scoll" data-am-flexslider
					id="demo-slider-0">
					<ul class="am-slides">
						<li class="banner1"><a href="home/introduction.jsp"><img
								src="${pageContext.request.contextPath}/images/ad5.jpg" /></a></li>
						<li class="banner2"><a><img
								src="${pageContext.request.contextPath}/images/ad6.jpg" /></a></li>
						<li class="banner3"><a><img
								src="${pageContext.request.contextPath}/images/ad7.jpg" /></a></li>
						<li class="banner4"><a><img
								src="${pageContext.request.contextPath}/images/ad8.jpg" /></a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull" style="position: static;">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category" style="box-shadow: none; margin-top: 2px;">
							<ul class="category-list navTwo" id="js_climit_li">
								<c:forEach items="${typelist}" var="t">
							<c:if test="${t.commodityrank=='1'}">
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
										<a style="margin-left: -10px;" class="ml-22" title="点心">${t.commoditytypename}</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
													<c:forEach items="${typelist}" var="ts">
														<c:if test="${t.commodityTypeNo==ts.supercommoditytype.commodityTypeNo}">
														<div style="margin-bottom: 20px;width: 700px;height: 30px;"> 
														<dl class="" style="display: block;float:left;">
															<dt style="display: block; float:left;">
																<h5 title="${ts.commoditytypename}">${ts.commoditytypename}</h5>
															</dt>
															<c:forEach items="${typelist}" var="tss">
																<c:if test="${tss.supercommoditytype.commodityTypeNo==ts.commodityTypeNo}">
																<dd style="display: block;" >
																	<a title="${tss.commoditytypename}" style="padding:1px 2px;" href="#"><span style="font-size: 12px;">${tss.commoditytypename}</span></a>
																</dd>
																</c:if>
															</c:forEach>
														</dl>
														</div>
														</c:if>
														</c:forEach>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								</c:if>
								</c:forEach>
								</ul>

				</div>
			</div>
			<!--导航 -->
			<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>


			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.jsp"><img
						src="${pageContext.request.contextPath}/images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img
						src="${pageContext.request.contextPath}/images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="person/index.jsp"><img
						src="${pageContext.request.contextPath}/images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img
						src="${pageContext.request.contextPath}/images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>


			
			<div class="clear"></div>
			<!--走马灯 -->

			<div class="marqueenTwo">
				<span class="marqueen-title"><i
					class="am-icon-volume-up am-icon-fw"></i>商城头条<em
					class="am-icon-angle-double-right"></em></span>
				<div class="demo">

					<ul>
						<li class="title-first"><a target="_blank" href="#"> <img
								src="${pageContext.request.contextPath}/images/TJ2.jpg"></img> <span>[特惠]</span>洋河年末大促，低至两件五折
						</a></li>
						<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
								<img src="${pageContext.request.contextPath}/images/TJ.jpg"></img>
								<p>XXXXXXXXXXXXXXXXXX</p>
						</a></li>
						<li><a target="_blank" href="#"><span>[特惠]</span>女生节商城爆品1分秒
						</a></li>
						<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
						<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
								买1送1！</a></li>
						<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
						<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>

					</ul>

				</div>
			</div>
			<div class="clear"></div>

		</div>



		<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--热门活动 -->

			<div class="am-container">

				<div class="sale-mt">
					<i></i> <em class="sale-title">限时秒杀</em>
					<div class="s-time" id="countdown">
						<span class="hh">01</span> <span class="mm">20</span> <span
							class="ss">59</span>
					</div>
				</div>
			<script type="text/javascript">
			   				var maxtime = 60 * 60 ; //一个小时，按秒计算，自己调整!   
			                function CountDown() {
			                    if (maxtime >= 0) {
			                    	hours=  Math.floor(maxtime / 3600);
			                        minutes = Math.floor(maxtime / 60);
			                        seconds = Math.floor(maxtime % 60);
			                       msg = "距离结束还有" + minutes + "分" + seconds + "秒";
			                      minutes;
			                       var hh =   document.getElementsByClassName("hh");
			                       hh[0].innerHTML=hours;
			                       var mm =   document.getElementsByClassName("mm");
			                       mm[0].innerHTML=minutes;
			                       var ss =   document.getElementsByClassName("ss");
			                       ss[0].innerHTML=seconds;
			                      if (maxtime == 5 * 60)alert("还剩5分钟");
			                      --maxtime;
			                   } else{
			                       clearInterval(timer);
			                       alert("时间到，结束!");
			                   }
			               }
			               timer = setInterval("CountDown()", 1000); 
			</script>

				<div class="am-g am-g-fixed sale">
				<c:forEach items="${tjlist}" var="tj">
					<div class="am-u-sm-3 sale-item">
						<div class="s-img">
								<c:forEach items="${tj.imagers}" var="i">
							<a href="# "><img
								src="${pageContext.request.contextPath}/${i.imagerurl}" /></a>
								</c:forEach>
						</div>
						<div class="s-info">
							<a href="#"><p class="s-title">${tj.commoditytitle}</p></a>
							<div class="s-price">
								积分:&nbsp;<b>${tj.needintegral}</b> <a class="s-buy" href="#">秒杀</a>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="clear "></div>
			<div class="f1">
				<!--甜点-->
<c:forEach items="${cmap}" var="c">
				<div class="am-container ">
					<div class="shopTitle ">
						<h4 class="floor-title">${c.key}</h4>
						<div class="today-brands " style="right: 0px; top: 13px;">
							<c:forEach items="${c.value}" var="com">
									<a href="# ">${com.commoditytitle}</a>|
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="am-g am-g-fixed floodSix ">
					<c:forEach items="${c.value}" var="com">
									<li><a href="${pageContext.request.contextPath}/Emp/Emp_OneCustome?CustomerId=${com.commodityno}">
										<div class="am-u-md-2 am-u-lg-2 text-three">
											<div class="boxLi"></div>
											<div class="outer-con ">
												<div class="title ">${com.commoditytitle}</div>
												<div class="sub-title ">积分:${com.needintegral}</div>
											</div>
											<c:forEach items="${com.imagers}" varStatus="img" var="i">
												 <c:if test="${img.index == 0}" >  
	               									<a href="${pageContext.request.contextPath}/Emp/Emp_OneCustome?CustomerId=${com.commodityno}"><img src="${pageContext.request.contextPath}/${i.imagerurl}" width="140px" height="150px" /></a>
	           									 </c:if>  
											</c:forEach>
										</div>
										</a>
									</li>
					</c:forEach>
				</div>
				<div class="clear "></div> 
</c:forEach> 
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
						<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
						<a href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板
							<a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
							- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
							target="_blank">网页模板</a>
						</em>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home2.jsp"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.jsp"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="${pageContext.request.contextPath}/person/index.jsp"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img
									src="${pageContext.request.contextPath}/images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="# " class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">0</p>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="${pageContext.request.contextPath}/images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="${pageContext.request.contextPath}/images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span></a>
						<div class="mp_qrcode " style="display: none;">
							<img
								src="${pageContext.request.contextPath}/images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div>
				</a> <a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div>
				</a> <a href="# " target="_blank " class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
		</div>
	</div>
	<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath}/basic/js/quick_links.js "></script>
</body>
</html>
