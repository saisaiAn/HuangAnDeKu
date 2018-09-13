<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>好看的amazeui用户充值界面代码</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/cssTwo/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/cssTwo/main.css" />
<script type="text/javascript">
</script>
</head>
<body><script src="/demos/googlegg.js"></script>
<input type="hidden" value="${integralCount}" id="Count" />
<input type="hidden" value="${user.empno}" id="userNo" />
<div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
		<div class="tr_rechtext">
			<p class="te_retit"><img src="${pageContext.request.contextPath }/images/coin.png" alt="" />充值中心</p>
			<p>1.积分是积分商城出的虚拟货币，你可以使用积分购买商城内的商品。</p>
			<p>2.积分与人民币换算为1：10，即10元=1积分，你可以通过微信的付款方式来进行充值，积分每次10个起充。</p>
		</div>
		<form action="" class="am-form" id="doc-vld-msg" method="post">
			<div class="tr_rechbox" style="position: relative;">
				<div class="tr_rechhead">
					<img src="${pageContext.request.contextPath }/images/ys_head2.jpg" />
					<p>充值帐号：
						<a>${user.empname}</a>
						<input name="userNo" id="userNO" type="hidden" value="${user.empno}"/>
					</p>
					<div class="tr_rechheadcion">
						<img src="${pageContext.request.contextPath }/images/coin.png" alt="" />
						<span>当前余额：<span>${user.intergralno.remainingpoints}</span></span>
					</div>
				</div>
				<div class="tr_rechli am-form-group">
					<ul class="ui-choose am-form-group" id="uc_01">
						<li>
							<label class="am-radio-inline">
									<input type="radio"  value="100" name="docVlGender" required data-validation-message="请选择一项充值额度"> 100￥
								</label>
						</li>
						<li>
							<label class="am-radio-inline">
									<input type="radio" name="docVlGender" value="200" data-validation-message="请选择一项充值额度"> 200￥
								</label>
						</li>

						<li>
							<label class="am-radio-inline">
									<input type="radio" name="docVlGender" value="500" data-validation-message="请选择一项充值额度"> 500￥
								</label>
						</li>
						<li>
							<label class="am-radio-inline">
									<input type="radio" name="docVlGender" value="" class="oradio" data-validation-message="请选择一项充值额度"> 其他金额
								</label>
						</li>
					</ul>
					<!--<span>1招兵币=1元 10元起充</span>-->
				</div>
				<div class="tr_rechoth am-form-group">
					<span>其他金额：</span>
					<input type="number" min="10" max="10000" value="10.00元" class="othbox" data-validation-message="充值金额范围：10-10000元" />
					<!--<p>充值金额范围：10-10000元</p>-->
				</div>
				<div style="text-align:center;position:absolute; top:200px;left:76%; width: 150px;height:150px;">
					<img alt="" src="${ercodeUrl}" id="wxzf" width="150px" height="150px"  >
				</div>
				<div class="tr_rechcho am-form-group" style="display: block;">
					<span>充值方式：</span>
				<img src="${pageContext.request.contextPath }/images/wechatpay.png">
				</div>
				<div class="tr_rechnum" style="display: block;">
					<span>应付金额：</span>
					<p class="rechnum">0.00元</p>
				</div>
			</div>
			<div class="tr_paybox" style="display: block;">
				<input type="button"  value="确认支付" id="sub" class="tr_pay am-btn" />
				<span>温馨提示：积分只限于在商城中购买商品，遇到问题请拨打联系电话。</span>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ui-choose.js"></script>
<script type="text/javascript">
	$(function(){
		 var inter;
		$("#sub").click(function(){
			if($('input:radio[name="docVlGender"]:checked').val()!=null){
				 $.ajax({
					   url: "${pageContext.request.contextPath }/pay/pay-pay.action",
					   data: { "docVlGender":$('.rechnum').text().substr(0,$('.rechnum').text().length-4),"userNo":$("#userNO").val()},
					   type: "POST",
					   dataType:"Text",
					   success:function(data){
					     $("#wxzf").attr("src",data);
					     inter= setInterval(function(){
					    	 $.ajax({
					             type: "POST",
					             url: "${pageContext.request.contextPath}/integral/Integral_topupTwo.action",
					             dataType: "Text",
					             success: function(data) {
					 				if(data>$("#Count").val()){
					 					clearInterval(inter);
					 					$("#wxzf").attr("src","${pageContext.request.contextPath }/images/timg.jpg");
					 					parent.location.reload(); 
					 					//window.location.href = "${pageContext.request.contextPath}/integral/Integral_topup.action?empno="+$("#userNo").val();
					 				}
					             }
					         });
					     },500);//轮询执行，500ms一次
					   }
					}); 
			}else{
				var $group = $("#uc_01");
				var $alert = $group.find('.am-alert');
				// 使用自定义的提示信息 或 插件内置的提示信息
				var msg ="请选择一项充值额度";
				if(!$alert.length) {
					$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
					appendTo($group);
				}
				$alert.html(msg).show();
			}
		});
	})
</script>
<script type="text/javascript">
	// 将所有.ui-choose实例化
	$('.ui-choose').ui_choose();
	// uc_01 ul 单选
	var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
	uc_01.click = function(index, item) {
		console.log('click', index, item.text())
	}
	uc_01.change = function(index, item) {
		console.log('change', index, item.text())
	}
	$(function() {
		$('#uc_01 li:eq(3)').click(function() {
			$('.tr_rechoth').show();
			$('.tr_rechoth').find("input").attr('required', 'true')
			$('.rechnum').text('100.00元');
			 $("#wxzf").attr("src","");
		})
		$('#uc_01 li:eq(0)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('100.00元');
			$('.othbox').val('');
			 $("#wxzf").attr("src","");
		})
		$('#uc_01 li:eq(1)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('200.00元');
			$('.othbox').val('');
			 $("#wxzf").attr("src","");
		})
		$('#uc_01 li:eq(2)').click(function() {
			$('.tr_rechoth').hide();
			$('.rechnum').text('500.00元');
			$('.othbox').val('');
			 $("#wxzf").attr("src","");
		})
		$(document).ready(function() {
			$('.othbox').on('input propertychange', function() {
				var num = $(this).val();
				$('.rechnum').html(num + ".00元");
				$('.oradio').val(num);
				 $("#wxzf").attr("src","");
			});
		});
	})

	$(function() {
		$('#doc-vld-msg').validator({
			onValid: function(validity) {
				$(validity.field).closest('.am-form-group').find('.am-alert').hide();
			},
			onInValid: function(validity) {
				var $field = $(validity.field);
				var $group = $field.closest('.am-form-group');
				var $alert = $group.find('.am-alert');
				// 使用自定义的提示信息 或 插件内置的提示信息
				var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

				if(!$alert.length) {
					$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
					appendTo($group);
				}
				$alert.html(msg).show();
			}
		});
	});
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
<p>来源：<a href="http://www.lanrenzhijia.com/" target="_blank">懒人</a></p>
</div>
</body>
</html>