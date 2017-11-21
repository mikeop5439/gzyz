<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >

<head>
		<title>和孝 | 商品详情页</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Super Market Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

	
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/JSP/RP/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- font-awesome icons -->
<link href="${pageContext.request.contextPath}/JSP/RP/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js -->


		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="${pageContext.request.contextPath}/JSP/RP/personal/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="${pageContext.request.contextPath}/JSP/RP/personal/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/quick_links.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/amazeui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/list.js"></script>
		<style>
		.J_Brand p{
		text-align:none
		}
		</style>
	</head>

	<body>
		
<!-- header -->
	<div class="agileits_header">
		<div class="container">
			<div class="w3l_offers">
			<a href="index.html" ><i class="fa fa-home fa-2x" style="color: #FFFFFF;"></i></a>
			
			
			<a href="login.html" style="color: #FCFCFC;margin-left: 20px;">登录</a>
		
			<a href="registered.html" style="color: #FCFCFC;margin-left: 20px;">注册</a>
		
			</div>
			<div class="w3l_search" style="margin-top: 5px;">
			<form action="#" method="post">
				<input type="search" name="Search" placeholder="搜索商品..." required="">
				<button type="submit" class="btn btn-default search" aria-label="Left Align">
					<i class="fa fa-search" aria-hidden="true"> </i>
				</button>
				<div class="clearfix"></div>
			</form>
		</div>
			
			
		 
			
			<div class="clearfix"> </div>
			
		</div>
	</div>

<!-- //header -->
<!-- breadcrumbs -->
	<div class="breadcrumbs" style="margin-bottom: 20px;">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">地址管理</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
			
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" title="pic" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="${pageContext.request.contextPath}/JSP/RP/images/1.png"><img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" alt="细节展示放大镜特效" rel="${pageContext.request.contextPath}/JSP/RP/images/1.png" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" mid="${pageContext.request.contextPath}/JSP/RP/images/1.png" big="${pageContext.request.contextPath}/JSP/RP/images/1.png"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" mid="${pageContext.request.contextPath}/JSP/RP/images/1.png" big="${pageContext.request.contextPath}/JSP/RP/images/1.png"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath}/JSP/RP/images/1.png" mid="${pageContext.request.contextPath}/JSP/RP/images/1.png" big="${pageContext.request.contextPath}/JSP/RP/images/1.png"></a>
									</div>
								</li>
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">

						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
						<c:forEach items="${goodsinfo }" var="info">
							<h1>	
								${info.goods_name }
	         				 </h1>
						</c:forEach>
							
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<c:forEach items="${goodsinfo }" var="info">
										<dd><em>¥</em><b class="sys_item_price">${info.shop_price }</b>  </dd>                                 
									</c:forEach>
								</li>
								<li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<c:forEach items="${goodsinfo }" var="info">
										<dd><em>¥</em><b class="sys_item_mktprice">${info.original_price }</b></dd>
									</c:forEach>
								</li>
								<div class="clear"></div>
							</div>

							<!--地址-->
							<dl class="iteminfo_parameter freight">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
									<div class="am-form-content address">
										<select data-am-selected>
											<option value="a">浙江省</option>
											<option value="b">湖北省</option>
										</select>
										<select data-am-selected>
											<option value="a">温州市</option>
											<option value="b">武汉市</option>
										</select>
										<select data-am-selected>
											<option value="a">瑞安区</option>
											<option value="b">洪山区</option>
										</select>
									</div>
									<div class="pay-logis">
										快递<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl>
							<div class="clear"></div>

							<!--销量-->
							<ul class="tm-ind-panel">
								<li class="tm-ind-item tm-ind-sellCount canClick">
									<div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">1015</span></div>
								</li>
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">6015</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">640</span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">

												<div class="theme-signin-left">

													<div class="theme-options">
														<div class="cart-title">颜色</div>
														<ul>
															<li class="sku-line selected">粉色<i></i></li>
															<li class="sku-line">绿色<i></i></li>
															<li class="sku-line">白色<i></i></li>
															<li class="sku-line">黑色<i></i></li>
														</ul>
													</div>
													<div class="theme-options">
														<div class="cart-title">尺寸</div>
														<ul>
															<li class="sku-line selected">大屏<i></i></li>
															<li class="sku-line">中屏<i></i></li>
															<li class="sku-line">小屏<i></i></li>
														</ul>
													</div>
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<c:forEach items="${goodsinfo }" var="info">
																<span id="Stock" class="tb-hidden">库存<span class="stock">${info.goods_number }</span>件</span>
															</c:forEach>
														</dd>

													</div>
													<div class="clear"></div>

													
												</div>
												

											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							
						</div>

						<div class="pay" style="margin-top: 5px;">
							
							<div class="col-md-4  snipcart-details agileinfo_single_right_details">
							<form action="#" method="post">
								<fieldset>
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1">
									<input type="hidden" name="business" value=" ">
									<input type="hidden" name="item_name" value="pulao basmati rice">
									<input type="hidden" name="amount" value="21.00">
									<input type="hidden" name="discount_amount" value="1.00">
									<input type="hidden" name="currency_code" value="USD">
									<input type="hidden" name="return" value=" ">
									<input type="hidden" name="cancel_return" value=" ">
									<input type="submit" name="submit" value="加入购物车" class="button">
									
									
								</fieldset>
							</form>
						</div>
							<div class="col-md-4 snipcart-details agileinfo_single_right_details">
							<input type="button"  value="立即购买" class="button" onClick="" >
						</div>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				
							
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>
						     	
							      <li class="first">
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/JSP/RP/images/21.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		踏步机
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥3500.90</strong></div>
							      </li>
							    							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/JSP/RP/images/191.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		动感单车
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥3500.90</strong></div>
							      </li>							      
					      
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li>
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
										<c:forEach items="${result}" var="result">
											<li title="">${result }</li>
											<!-- <li title="">原料产地:&nbsp;巴基斯坦</li>
											<li title="">产地:&nbsp;贵州省省贵阳市</li>
											
											<li title="">产品规格:&nbsp;大屏幕</li>
											<li title="">保质期:&nbsp;三年</li>
											<li title="">产品标准号:&nbsp;GB/T 22165</li>
											<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li> -->
										</c:forEach>
										</ul>
										<div class="clear"></div>
									</div>
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品描述：</h4></div>
										<div class="clear"></div>
										<!-- <ul id="J_AttrUL">
											<li title="">1.结合老年人对硬件方面的需求111111111111111111111111111111111111111111111111111111111111111。</li>
											<li title=""></li>
											<li title=""></li>
											<li title="">2.互联网服务让老人体会到高科技的便利。</li>
											<li title=""></li>
											<li title=""></li>
											<li title="">3.为老人提供最贴心的服务。</li>
											
											
										</ul> -->
										<p>结合老年人对硬件方面的需求111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111。</p>
										<div class="clear"></div>
									</div>

									
									<div class="clear"></div>

								</div>
								
								

								<div class="am-tab-panel am-fade">
									
                                    <div class="actor-new">
                                    	<div class="rate">                
                                    		<strong>100<span>%</span></strong><br> <span>好评度</span>            
                                    	</div>
                                        <dl>                    
                                            <dt>买家印象</dt>                    
                                            <dd class="p-bfc">
                                            			<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                            			<q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                            			<q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                            			<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                            			<q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                            			<q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                            			<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                            			<q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                            			<q class="comm-tags"><span>皮很薄</span><em>(831)</em></q> 
                                            </dd>                                           
                                         </dl> 
                                    </div>	
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(32)</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<ul class="am-comments-list am-comments-list-flip">
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/JSP/RP/images/qq_pic_merged_1509681761763.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/JSP/RP/images/09.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/JSP/RP/images/IMG_20171108_182501R.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										
										

									</ul>

									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>

									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>

								</div>

								<div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/JSP/RP/images/5.jpg" />
													<p>【和孝商城】老年豪华手机
														<span>东北红 大屏幕</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>2980.00</strong>
													</p>
												</div>
											</li>
											
										
											
											<li>
												<div class="i-pic limit">
													
													<img src="${pageContext.request.contextPath}/JSP/RP/images/5.jpg" />
													<p>【和孝商城】老年豪华手机
														<span>东北红 大屏幕</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/JSP/RP/images/5.jpg" />
													<p>【和孝商城】老年豪华手机
														<span>东北红 大屏幕</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/JSP/RP/images/5.jpg" />
													<p>【和孝商城】老年豪华手机
														<span>东北红 大屏幕</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<!--分页 -->
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
									<div class="clear"></div>

								</div>

							</div>

						</div>

						<div class="clear"></div>

						
					</div>

				</div>
			

	</body>

</html>