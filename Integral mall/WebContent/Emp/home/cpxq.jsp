<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品页面</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<script src="${pageContext.request.contextPath}/script/global.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/script/head.js" type="text/javascript"></script>

<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet">	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/stylea.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/base.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/head.css" />



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
<script type="text/javascript">
$(function(){
	//加数量  积分变动
	$("#jian").click(function(){
		var a=$("#number").val();
		if(a>1){
			$("#number").val(eval(a+"-"+1));
		}
		$("#sum").text(parseInt($("#price").val())*eval(a+"-"+1));
	})
	$("#jia").click(function(){
		var a=$("#number").val();
		var b=$("#tory").val();
		if(a<parseInt(b)){
			$("#number").val(eval(a+"+"+1));
		}
		$("#sum").text(parseInt($("#price").val())*eval(a+"+"+1));
	})
	
	$("#sub").click(function(){
		 if(parseInt($("#number").val())<=parseInt($("#tory").val())){
			if(parseInt($("#sum").text())<parseInt($("#ye").val())){
			location.href="${pageContext.request.contextPath}/Emp/Emp_addOrder?commmodityno="+$("#commoNo").val()+"&userNos="+$("#empNo").val()+"&commoSum="+$("#number").val();
			}else{
				alert("积分不足！");
			}			
		}else{
			alert("库存不足！");
		} 
	})
})
</script>

<body>
<input type="hidden" id="ye" value="${user.intergralno.remainingpoints}">
<!--抬头开始-->

<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
				<a href="login.jsp" target="_top" class="h">亲，请登录</a>	
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="Emp/home/index.jsp"" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="person/index.jsp" target="_top"><i
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
<!--抬头结束-->


<!--导航开始-->


<div class="headNav">
  <div class="navCon w1020">
    <div class="navCon-cate fl navCon_on">
      <div class="navCon-cate-title"> <a href="#">全部商品分类</a></div>
      <div class="cateMenu hide">
        <ul>
          <li style="border-top: none;">
            <div class="cate-tag"> <strong><a href="#">白酒</a></strong>
              <div class="listModel">
                <p> <a href="#">茅台</a> <a href="#">洋河</a> <a href="#">郎酒</a> <a href="#">古井贡酒</a> </p>
                <p> <a href="#">习酒</a> <a href="#">珍酒</a> <a href="#">红星</a> <a href="#">泸州老窖</a> </p>
                <p> <a href="#">沱牌</a> <a href="#">国台</a> <a href="#">五粮液</a> <a href="#">剑南春</a> </p>
              </div>
            </div>
            <div class="list-item hide">
              <ul class="itemleft">
                <dl>
                  <dt>品牌</dt>
                  <dd> <a href="#">茅台</a> <a href="#">五粮液</a> <a href="#">剑南春</a> <a href="#">水井坊</a> <a href="#">汾酒</a> <a href="#">洋河</a> <a href="#">泸州老窖</a> <a href="#">珍酒</a> <a href="#">郎酒</a> <a href="#">古井贡酒</a> <a href="#">西凤酒</a> <a href="#">董酒</a> <a href="#">酒鬼酒</a> <a href="#">红星</a> <a href="#">文君酒</a> <a href="#">牛栏山</a> <a href="#">四特酒</a> <a href="#">口子酒</a><a href="#">星河湾</a> <a href="#">百年传奇</a> </dd>
                </dl>
                <div class="fn-clear"></div>
                <dl>
                  <dt>香型</dt>
                  <dd> <a href="#">酱香型</a> <a href="#">浓香型</a> <a href="#">清香型</a> <a href="#">凤香型</a> <a href="#">馥郁香</a> <a href="#">董香型</a> <a href="#">特香型</a> <a href="#">芝麻香</a> <a href="#">兼香型</a> <a href="#">金门香型</a> <a href="#">老干白</a> <a href="#">绵柔型</a> <a href="#">柔和型</a> <a href="#">小曲型</a> <a href="#">生态竹香型</a> </dd>
                </dl>
                <div class="fn-clear"></div>
              </ul>
              <ul class="itemright">
                <dl>
                  <dt>促销信息</dt>
                </dl>
                <div class="news-list">
                  <p> <span class="red">[杜康]</span> <a href="#">酒体窖香幽雅、陈香舒适,只需156元，值得一试的好酒</a> </p>
                  <p> <span class="red">[红星]</span> <a href="#">经典红星153元热销千瓶，敢于全网誓比价！</a> </p>
                  <p> <span class="red">[太白]</span> <a href="#">中国第一诗酒，全场满200减50</a> </p>
                </div>
                <dl>
                  <dt>促销活动</dt>
                </dl>
                <div class="ad-list mt10"> <a href="#"><img src='http://img0.gjw.com/famous/2013/1108/f011895a50564f6fa4a689b053e9437c.jpg' width='210' height='100' /></a> <a href="#"><img src='http://img0.gjw.com/famous/2013/1108/67e10be5b9a045d68e01b395b94f57a4.jpg' width='210' height='100' /></a> <a href="#"><img src='http://img0.gjw.com/famous/2013/1108/3dcc2411eb9847d08e7b80e82d130ebc.jpg' width='210' height='100' /></a> </div>
              </ul>
            </div>
          </li>
          <li >
            <div class="cate-tag"> <strong><a href="#">葡萄酒</a></strong>
              <div class="listModel">
                <p> <a href="#">中国</a> <a href="#">法国</a> <a href="#">智利</a> <a href="#">葡萄牙</a> </p>
                <p> <a href="#">意大利</a> <a href="#">澳大利亚</a> <a href="#">德国</a> <a href="#">南非</a> </p>
                <p> <a href="#">美国</a> <a href="#">阿根廷</a> <a href="#">西班牙</a> </p>
              </div>
            </div>
            <div class="list-item hide">
              <ul class="itemleft">
                <dl>
                  <dt>产区</dt>
                  <dd> <a href="#">澳大利亚</a> <a href="#">德国</a> <a href="#">法国</a> <a href="#">加拿大</a> <a href="#">美国</a> <a href="#">西班牙</a> <a href="#">智利</a> <a href="#">葡萄牙</a> <a href="#">俄罗斯</a> <a href="#">阿根廷</a> <a href="#">新西兰</a> <a href="#">南非</a> <a href="#">意大利</a> <a href="#">中国</a> <a href="#">希腊</a> </dd>
                </dl>
                <div class="fn-clear"></div>
                <dl>
                  <dt>类型</dt>
                  <dd> <a href="#">红葡萄酒</a> <a href="#">白葡萄酒</a> <a href="#">桃红葡萄酒</a> <a href="#">起泡酒/香槟</a> <a href="#">冰酒/贵腐/甜酒</a> </dd>
                </dl>
                <div class="fn-clear"></div>
                <dl>
                  <dt>品种</dt>
                  <dd> <a href="#">芭贝拉</a> <a href="#">长相思</a> <a href="#">解百纳</a> <a href="#">玛尔维萨</a> <a href="#">综合佳酿</a> <a href="#">美乐</a> </dd>
                </dl>
                <div class="fn-clear"></div>
              </ul>
              <ul class="itemright">
                <dl>
                  <dt>促销信息</dt>
                </dl>
                <div class="news-list">
                  <p> <span class="red">[加州乐事]</span> <a href="#">美国爆款红酒，超市89元，68元特价售</a> </p>
                  <p> <span class="red">[华尔兹]</span> <a href="#">德国经典款，39元继续热卖中</a> </p>
                  <p> <span class="red">[贵妇]</span> <a href="#">法国进口红酒，购满6瓶每瓶仅需38元，超值专享价</a> </p>
                </div>
                <dl>
                  <dt>促销活动</dt>
                </dl>
                <div class="ad-list mt10"> <a href="#"><img src='http://img0.gjw.com/famous/2013/1115/c32d2be3c2f345138b717f8a13fed00e.jpg' width='210' height='100' /></a> <a href="#"><img src='http://img0.gjw.com/famous/2013/1115/294a3235681345b4a097ef769fdb9348.jpg' width='210' height='100' /></a> </div>
              </ul>
            </div>
          </li>
          <li >
            <div class="cate-tag"> <strong><a href="#">洋酒</a></strong>
              <div class="listModel">
                <p> <a href="#">格兰威特</a> <a href="#">杰克丹尼</a> <a href="#">轩尼诗</a> </p>
                <p> <a href="#">尊尼获加</a> <a href="#">皇家路易</a> <a href="#">百龄坛</a> </p>
              </div>
            </div>
            <div class="list-item hide">
              <ul class="itemleft">
                <dl>
                  <dt>品牌</dt>
                  <dd><a href="#">第林可</a> <a href="#">本尼维斯</a> <a href="#">奇滋</a> <a href="#">奥凯</a> <a href="#">剑威</a> <a href="#">帕夫利季斯</a> <a href="#">佩特雷城堡</a> <a href="#">斯多克</a> <a href="#">爱德华</a> <a href="#">格兰御鹿</a> <a href="#">萨隆公爵</a> </dd>
                </dl>
                <div class="fn-clear"></div>
                <dl>
                  <dt>酒种</dt>
                  <dd> <a href="#">白兰地</a> <a href="#">伏特加</a> <a href="#">朗姆酒</a> <a href="#">力娇酒</a> <a href="#">墨西哥烈酒</a> <a href="#">甜酒</a> <a href="#">威士忌</a> <a href="#">金酒</a> <a href="#">利口酒</a> </dd>
                </dl>
                <div class="fn-clear"></div>
              </ul>
              <ul class="itemright">
                <dl>
                  <dt>促销信息</dt>
                </dl>
                <div class="news-list">
                  <p> <span class="red">[威士忌]</span> <a href="#">芝华士，月销万瓶！</a> </p>
                </div>
                <dl>
                  <dt>促销活动</dt>
                </dl>
                <div class="ad-list mt10"> <a href="#"><img src='http://img0.gjw.com/famous/2013/1115/51ee0f88c7664b099526214a45076686.jpg' width='210' height='100' /></a> <a href="#"><img src='http://img0.gjw.com/famous/2013/1115/0815723969be40cb8126353991470fb1.jpg' width='210' height='100' /></a> <a href="#"><img src='http://img0.gjw.com/famous/2013/1115/ce2c2e1eae804529b68785bfd92f5a44.jpg' width='210' height='100' /></a> </div>
              </ul>
            </div>
          </li>
          <li >
            <div class="cate-tag"> <strong><a href="#">黄酒</a></strong>
              <div class="listModel">
                <p> <a href="#">石库门</a> <a href="#">女儿红</a> <a href="#">古越龙山</a> </p>
              </div>
            </div>
            <div class="list-item hide">
              <ul class="itemleft">
                <dl>
                  <dt>品牌</dt>
                  <dd> <a href="#">石库门</a> <a href="#">和酒</a> <a href="#">古越龙山</a> <a href="#">女儿红</a> <a href="#">沙洲优黄</a> <a href="#">会稽山</a> <a href="#">塔牌</a> <a href="#">乌毡帽</a> <a href="#">唐宋黄酒</a> <a href="#">钱塘人家</a> <a href="#">咸亨黄酒</a> <a href="#">嘉善黄酒</a> <a href="#">绍兴师爷</a> <a href="#">梁祝</a> <a href="#">组合装</a> </dd>
                </dl>
                <div class="fn-clear"></div>
                <dl>
                  <dt>年份</dt>
                  <dd> <a href="#">100年</a> <a href="#">10年</a> <a href="#">12年</a> <a href="#">15年</a> <a href="#">18年</a> <a href="#">20年</a> <a href="#">25年</a> <a href="#">30年</a> <a href="#">3年</a> <a href="#">5年</a> <a href="#">6年</a> <a href="#">8年</a> <a href="#">9年</a> <a href="#">常规年份</a> </dd>
                </dl>
                <div class="fn-clear"></div>
              </ul>
              <ul class="itemright">
                <dl>
                  <dt>促销活动</dt>
                </dl>
                <div class="ad-list mt10"> <a href="#"><img src='http://img0.gjw.com/famous/2013/1108/c58fc62653c64cfb8e7b93ce34733535.jpg' width='210' height='100' /></a> <a href="#"><img src='http://img0.gjw.com/famous/2013/1108/ee9514f6a1c341efb0889917e51072af.jpg' width='210' height='100' /></a> </div>
              </ul>
            </div>
          </li>
          <li >
            <div class="cate-tag"> <strong><a href="#">保健酒与啤酒</a></strong>
              <div class="listModel">
                <p> <a href="#">百威</a> <a href="#">青岛</a> <a href="#">喜力</a> <a href="#">劲酒</a> </p>
              </div>
            </div>
            <div class="list-item hide">
              <ul class="itemleft">
                <dl>
                  <dt>品牌</dt>
                  <dd> <a href="#">百威</a> <a href="#">喜力</a> <a href="#">青岛</a> <a href="#">劲酒</a> <a href="#">黄金酒</a> <a href="#">蓝莓酒</a> <a href="#">银杏</a> <a href="#">春生堂</a> <a href="#">张裕酒</a> <a href="#">丹力</a> <a href="#">桂花酒</a> <a href="#">森林大猫</a> <a href="#">卡力特</a> <a href="#">麒麟</a> <a href="#">凯撒</a> <a href="#">修士</a> <a href="#">黑森马蹄</a> <a href="#">威兰仕</a> <a href="#">科罗娜</a> <a href="#">蓝带</a> <a href="#">布格福斯</a> <a href="#">博瑞克</a> <a href="#">力兹堡</a> <a href="#">嘉士伯</a> <a href="#">美名格</a> <a href="#">阿登堡</a> <a href="#">博德</a> <a href="#">德福堡</a> <a href="#">德力士</a> <a href="#">朗克</a> <a href="#">麦德奥黑</a> <a href="#">威欧</a> <a href="#">威斯玛</a> <a href="#">朝日</a> <a href="#">彼乐</a> <a href="#">白鹳</a> <a href="#">德博</a> <a href="#">庄园主</a> <a href="#">德拉克</a> <a href="#">西藏青稞</a> </dd>
                </dl>
                <div class="fn-clear"></div>
              </ul>
              <ul class="itemright">
                <dl>
                  <dt>促销活动</dt>
                </dl>
                <div class="ad-list mt10"> <a href="#"><img src='http://img0.gjw.com/famous/2013/1108/882341974a8543cf93f2a7d18ff277ab.jpg' width='210' height='100' /></a> </div>
              </ul>
            </div>
          </li>
          <li>
            <div class="float-list-dnav"> </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="navCon-menu fl">
      <ul>
        <li><a class="curMenu" href="index.jsp">商城首页</a></li>
        <li><a href="#">特色产品</a></li>
        <li><a href="#">VIP专区</a></li>
        <li><a href="#">服务支持</a></li>
        <li><a href="#">相关资讯</a></li>
      </ul>
    </div>
  </div>
</div>

<!--导航结束-->


<!--banner开始-->


<!--  
<div class="mainbanner">
	<div class="mainbanner_window">
		<ul id="slideContainer">
			<li><a href="#"><img src="${pageContext.request.contextPath}/image/1.jpg" width="1920" height="500"  /></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/image/2.jpg" width="1920" height="500"  /></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/image/3.jpg" width="1920" height="500"  /></a></li>
			<li><a href="#"><img src="${pageContext.request.contextPath}/image/4.jpg" width="1920" height="500" /></a></li>
		</ul>
	</div>
	<ul class="mainbanner_list">
		<li><a href="javascript:void(0);">1</a></li>
		<li><a href="javascript:void(0);">2</a></li>
		<li><a href="javascript:void(0);">3</a></li>
		<li><a href="javascript:void(0);">4</a></li>
	</ul>
</div>

<!--banner结束-->


-->


<!--中部开始-->


<div class="con_ny">

<div class="con_dqwz">您的当前位置：<a href="index.html">首页</a> >> 商品</div>

<!--产品购买详情介绍开始-->

<div class="cpxq_ny1">


<!--相册放大镜开始-->
<div class="fdj">

<SCRIPT src="js/jquery-1.2.6.pack.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/base.js" type=text/javascript></SCRIPT>
<div id=preview>
	<div class=jqzoom id=spec-n1 onClick="window.open('#')">
	<c:forEach items="${OneCustome.imagers}" varStatus="img" var="i">
				 <c:if test="${img.index == 0}" >  
	           	 <IMG height=306	src="${pageContext.request.contextPath}/${i.imagerurl}" jqimg="${pageContext.request.contextPath}/${i.imagerurl}" width=350>
	           	 </c:if>  
	</c:forEach>
	</div>
	<div id=spec-n5>
		<div class=control id=spec-left>
			<!--  <img src="${pageContext.request.contextPath}/image/left.jpg" />-->
		</div>
		<%-- <div id=spec-list>
			<ul class=list-h>
				<li><img src="${pageContext.request.contextPath}/image/1_1.jpg"> </li>
				<li><img src="${pageContext.request.contextPath}/image/1_2.jpg"> </li>
				<li><img src="${pageContext.request.contextPath}/image/1_3.jpg"> </li>
				<li><img src="${pageContext.request.contextPath}/image/1_1.jpg"> </li>
				<li><img src="${pageContext.request.contextPath}/image/1_2.jpg"> </li>
				<li><img src="${pageContext.request.contextPath}/image/1_3.jpg"> </li>
			</ul>
		</div>
		<div class=control id=spec-right>
			<img src="${pageContext.request.contextPath}/image/right.jpg" />
		</div>
		 --%>
    </div>
</div>
<SCRIPT type=text/javascript>
	$(function(){			
	   $(".jqzoom").jqueryzoom({
			xzoom:400,
			yzoom:400,
			offset:10,
			position:"right",
			preload:1,
			lens:1
		});
		$("#spec-list").jdMarquee({
			deriction:"left",
			width:350,
			height:56,
			step:2,
			speed:4,
			delay:10,
			control:true,
			_front:"#spec-right",
			_back:"#spec-left"
		});
		$("#spec-list img").bind("mouseover",function(){
			var src=$(this).attr("src");
			$("#spec-n1 img").eq(0).attr({
				src:src.replace("\/n5\/","\/n1\/"),
				jqimg:src.replace("\/n5\/","\/n0\/")
			});
			$(this).css({
				"border":"2px solid #ff6600",
				"padding":"1px"
			});
		}).bind("mouseout",function(){
			$(this).css({
				"border":"1px solid #ccc",
				"padding":"2px"
			});
		});	
	
	})
	</SCRIPT>

<SCRIPT src="js/lib.js" type=text/javascript></SCRIPT>
<SCRIPT src="js/163css.js" type=text/javascript></SCRIPT>

</div>

<!--相册放大镜结束-->

<div class="xjmc_jjsm">
<div class="cpxq_mc_1">${OneCustome.commoditydetails}</div>
<div class="none" style="height:15px;"></div>
<div class="zzl">总 重 量：不详</div>
<div class="zzl">所需积分：<span style="color:#C00; font-weight:600; font-size:18px;">${OneCustome.needintegral}</span>  <span style="padding-left:20px;text-decoration:line-through;">市场价：￥${OneCustome.price}</span></div>
<div class="zzl">库       存：${OneCustome.commodityinventory}</div>
<div class="zzl">花费积分：<span id="sum"  style="color:#C00; font-weight:600;font-size:18px;">${OneCustome.needintegral}</span></div>
<div class="zzl">特产属性：${OneCustome.commoditytypeno.commoditytypename}</div>
<input type="hidden" id="tory" value="${OneCustome.commodityinventory}">
<input type="hidden" id="price" value="${OneCustome.needintegral}">
<input type="hidden" id="commoNo" value="${OneCustome.commodityno}">
<input type="hidden" id="empNo" value="${user.empno}">
<div class="dgsc">
<span class="gmsl">购买数量：<input name="" value="-" type="button" style="background: url(${pageContext.request.contextPath}/image/jia.jpg); width:19px; height:19px;" id="jian">
<input type="text" value="1" id="number" disabled="disabled" style="width:40px; text-align:center; height:18px; border:1px solid #dddddd;" >  <input name="" value="+" type="button" / style="background: url(${pageContext.request.contextPath}/image/jia.jpg); width:19px; height:19px;" id="jia">
</span>


<span class="jrsc_2"><a href="home/index.jsp"><img src="${pageContext.request.contextPath}/image/shoucang.jpg" width="170" height="34" /></a></span>
<span class="jrsc_2" style="padding-left:20px;"><button id="sub"><img src="${pageContext.request.contextPath}/image/dinggou.jpg" width="170" height="34" /></button></span>
</div>

</div>


</div>

<!--产品购买详情介绍结束-->
<div class="footer_ys">
<div class="footer_ys1"></div>
</div>



<!--软文开始-->

<div class="ruanwen">

<ul>
<li class="da">关于本亲</li>
<li><a href="#">公司简介</a></li>
<li><a href="#">联系我们</a></li>
<li><a href="#">友情连接</a></li>
</ul>



<ul>
<li class="da">新手指南</li>
<li><a href="#">账户注册</a></li>
<li><a href="#">购物流程</a></li>
<li><a href="#">注册须知</a></li>
</ul>



<ul>
<li class="da">配送范围及须知</li>
<li><a href="#">配送范围</a></li>
<li><a href="#">配送须知</a></li>
<li><a href="#">配送时间</a></li>
</ul>



<ul>
<li class="da">支付方式</li>
<li><a href="#">货到付款</a></li>
<li><a href="#">在线支付</a></li>
<li><a href="#">其他方式支付</a></li>
</ul>


<ul>
<li class="da">售后服务</li>
<li><a href="#">退换货政策</a></li>
<li><a href="#">退换货办理流程</a></li>
<li><a href="#">退款说明</a></li>
</ul>


<ul>
<li class="da">帮助说明</li>
<li><a href="#">找回密码</a></li>
<li><a href="#">帮助中心</a></li>
<li><a href="#">隐私声明</a></li>
</ul>



</div>


<!--软文结束-->



<!--友情链接结束-->

<!--底部结束-->

</div>
</body>
</html>