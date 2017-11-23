<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>和孝 | 首页</title>
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
<script src="${pageContext.request.contextPath}/JSP/RP/js/jquery-1.11.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/move-top.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/js/easing.js"></script>
<style>
	
   .mscBtn {
	   height: 50px;
	   float: left;
       display:inline;
	}
	.agile-login img{
	   border-radius:50%;
	   margin-right:15px;
	}
  
</style>
<script type="text/javascript">

	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
	window.onload=function(){
	
	if("${sessionScope.loginuser.user_name}"==""){
	$(".agile-login ul .ulofnologin").css("display","inline");
	}else{
	$(".agile-login ul .uloflogin").css("display","inline");
	}
	}; 
</script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    function audioAutoPlay() {
        var audio = document.getElementById('bg-music');
            audio.play();
        document.addEventListener("WeixinJSBridgeReady", function () {
            audio.play();
        }, false);
    }
    audioAutoPlay();
});
 
</script>
<script>
$(function(){
var music = document.getElementById('bg-music');
$("#audioBtn").click(function(){
if(music.paused){music.play();
$("#iconOfPlayer").removeClass("fa fa-close fa-2x").addClass("fa fa-music fa-2x");
$("#audioBtn").removeClass("pause").addClass("play");
}else{music.pause();
$("#iconOfPlayer").removeClass("fa fa-music fa-2x").addClass("fa fa-close fa-2x");
$("#audioBtn").removeClass("play").addClass("pause");}});
});

/* $(function(){
	$("input[name='submit']").click(function(){   
     //点击图片后发送跳转到指定页面的事件。
    window.location.href="${pageContext.request.contextPath}/shoppingcart/queryShoopingCart.action?user_id=1";  
	});
}); */
</script>

<!-- start-smoth-scrolling -->
</head>
	
	
	
<body>

<!--header-->
<div class="preloader">
     <div class="sk-spinner sk-spinner-wordpress">
          <span class="sk-inner-circle"></span>
     </div>
	</div>
 
 <div class="top-wrapper">
        
            
               <div class="agileits_header" >
		<div class="container">
		
			<div class="w3l_offers">
				 <a href="${pageContext.request.contextPath}/JSP/RP/index.jsp"><i class="fa fa-home fa-2x" style="color: white"></i></a>
			</div>
			<div class="agile-login" style="width:600px;">
				<ul>

						<li class="ulofnologin"  style="display:none;"><a href="register.jsp"> 注册</a></li>
					    <li class="ulofnologin" style="display:none;"><a href="login.jsp">登录</a></li>      

						<li class="uloflogin" style="display:none;"><img src="${pageContext.request.contextPath }${sessionScope.loginuser.user_image}" width="40px;" height="40px;"><a href="#">欢迎，${sessionScope.loginuser.user_name}</a></li>
						<li class="uloflogin" style="display:none;"><a href="personcar.jsp">个人中心</a></li>		
						<li class="uloflogin" style="display:none;"><a href="${pageContext.request.contextPath }/userlist/queryusercollect.action">收藏夹</a></li>
						<li class="uloflogin" style="display:none;"><a href="${pageContext.request.contextPath }/userlist/queryuserLoginExit.action">退出登陆</a></li>			
                        
					    <li ><a href="contact.html">联系我们</a></li> 
					    <li ><a href="${pageContext.request.contextPath }/shoppingcart/queryShoopingCart.action?"><i class="fa fa-cart-arrow-down fa-2x"  aria-hidden="true"></i></a></li>
					
				</ul>
			</div>
			
			
		</div>
	</div>
              
        <!--hidden-box-->
        <div data-toggle="hidden-box" id="nav-box1" class="user-box" >
			
        </div>

 <!--scroll-top-->
        <div class="scroll-search" style="height: 80px;">
           	<div class="logo_products" >
		<div class="container">
		
		   <a class="mscBtn" id="audioBtn"  style="cursor:pointer;"><i id="iconOfPlayer" class="fa fa-music fa-2x" style="color: black;"></i></a>
        <audio style="display:none; " id="bg-music" preload="auto" src="王筝-我们都是好孩子 - 铃声.mp3" loop></audio>
		<div class="w3ls_logo_products_left1"  >
				<ul class="phone_email">
					<li style="margin-left: 100px;"><i class="fa fa-phone" aria-hidden="true"></i>客服 : (+0123) 234 567</li>
					
				</ul>
			</div>
			
		<div class="w3l_search"  >
			<form action="${pageContext.request.contextPath}/rpsearch/searchgoods.action" method="post">
				<input type="search" name="keywords" placeholder="搜索商品..." required="">
				<button type="submit" class="btn btn-default search" aria-label="Left Align">
					<i class="fa fa-search" aria-hidden="true"> </i>
				</button>
				<div class="clearfix"></div>
			</form>
		</div>
			
			
		</div>
	</div>
        </div>
    </div>

<!--header-->

<!-- navigation -->
	<div class="navigation-agileits" style="margin-top: 70px;" >
		<div class="container">
			<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header nav_2">
								<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
							</div> 
							<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
								<ul class="nav navbar-nav">
									<li class="active"><a href="${pageContext.request.contextPath}/JSP/RP/index.jsp" class="act" >首页</a></li>	
									<!-- Mega Menu -->
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年理疗产品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>理疗产品分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=刮痧板">刮痧板</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗粉">足疗粉</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗药">足疗药</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拔罐器">拔罐器</a></li>
														
													</ul>
												</div>	
												
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年日常用品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>日常用品分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=老年代步车">老年代步车</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=老花眼镜">老花眼镜</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=足疗盆">足疗盆</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=穿袜器">穿袜器</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩鞋"> 按摩鞋 </a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=放大镜指甲刀">放大镜指甲刀</a></li>
													</ul>
												</div>
												
												
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年健身产品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>健身产品分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=跑步机">跑步机</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=收腹机">收腹机</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=踏步机">踏步机</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=握力器">握力器</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=哑铃"> 哑铃</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=仰卧板">仰卧板</a></li>
													</ul>
												</div>
												
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">老年按摩产品<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>按摩产品分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩椅">按摩椅</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=肩颈按摩">肩颈按摩</a></li>
														
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=背背捶">背背捶</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=按摩垫"> 按摩垫 </a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=车载按摩">车载按摩</a></li>
													</ul>
												</div>
												
											
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">家庭医疗机械<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>医疗机械分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=拐杖">拐杖</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=轮椅">轮椅</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=血压计">血压计</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=家用制氧机">家用制氧机</a></li>
														
													</ul>
												</div>
							
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="gourmet.html" class="dropdown-toggle" data-toggle="dropdown">中老年服饰<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>中老年服饰分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=上衣">上衣</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=裤子">裤子</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=鞋子">鞋子</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=包包">包包</a></li>
														
													</ul>
												</div>
							
											</div>
										</ul>
									</li>
									<li class="dropdown">
										<a href="gourmet.html" class="dropdown-toggle" data-toggle="dropdown">孝心礼品类<b class="caret"></b></a>
										<ul class="dropdown-menu multi-column columns-3">
											<div class="row">
												<div class="multi-gd-img">
													<ul class="multi-column-dropdown">
														<h6>孝心礼品分类</h6>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=长寿食品">长寿食品</a></li>
														<li><a href="${pageContext.request.contextPath}/rpsearch/searchscategory.action?searchOfKeywords=养身茶酒">养身茶酒</a></li>	
																					
													</ul>
												</div>
							
											</div>
										</ul>
									</li>
									
									
								</ul>
							</div>
							</nav>
			</div>
		</div>
		
<!-- //navigation -->
	<!-- main-slider -->
		<ul id="demo1" >
			<li>
				<img src="images/11.jpg" alt="" />
				<!--Slider Description example-->
				<div class="slide-desc">
					<h3>和孝商城，老人最时尚的购物商城</h3>
				</div>
			</li>
			<li>
				<img src="images/22.jpg" alt="" />
				  <div class="slide-desc">
					<h3>我们人老，心可一点儿都不老呢</h3>
				</div>
			</li>
			
			<li>
				<img src="images/44.jpg" alt="" />
				<div class="slide-desc">
					<h3>年轻态，新生活</h3>
				</div>
			</li>
		</ul>
		
	<!-- //main-slider -->
	<!-- //top-header and slider -->
	<!-- top-brands -->
	<div class="fix-right-sub">
	
	<div class="top-brands">
	
		<div   class="container">
		<h2>热卖区</h2>
	        <div class=" grid_3 grid_5 " >
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#expeditions" id="expeditions-tab" role="tab" data-toggle="tab" aria-controls="expeditions" aria-expanded="true">周热榜</a></li>
						<li role="presentation"><a href="#tours" role="tab" id="tours-tab" data-toggle="tab" aria-controls="tours">本期上新</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="expeditions" aria-labelledby="expeditions-tab">
							<div class="agile-tp">
								<center><p>当周热销好货，赶紧带回家吧。</p></center>
							</div>
							<div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="single.html"><img title=" " alt=" " src="images/5.jpg" height="150px;" /></a>		
															<p>皮套豪华型老年手机</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥2000.99 <span>￥3500.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />
																	<input type="hidden" name="amount" value="20.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/7.jpg" height="150px;"/></a>		
															<p>拐杖</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥20.99 <span>￥35.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="basmati rise" />
																	<input type="hidden" name="amount" value="20.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block">
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/2.png" height="150px;" /></a>
															<p>鞋子</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥40.99 <span>￥65.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Pepsi soft drink" />
																	<input type="hidden" name="amount" value="40.00" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								
								<div class="clearfix"> </div>
							</div>
							<div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/8.jpg" height="150px;" /></a>		
															<p>互邦铝合金轮椅</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥350.99 <span>￥550.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />
																	<input type="hidden" name="amount" value="35.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/6.jpg" height="150px;" /></a>		
															<p>广场舞音响</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥30.99 <span>￥45.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="basmati rise" />
																	<input type="hidden" name="amount" value="30.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车"class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block">
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/14.jpg" height="150px;" /></a>
															<p>制氧机</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥800.99 <span>￥1050.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Pepsi soft drink" />
																	<input type="hidden" name="amount" value="80.00" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit"  value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="tours" aria-labelledby="tours-tab">
							<div class="agile-tp">
								
								<center><p>我们从未止步，和孝一直前行为中老年人提供更优质的产品，让中老年人生活更有品质。</p></center>
							</div>
								<div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/17.jpg" height="150px;" /></a>		
															<p>养生枕</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥2000.99 <span>￥3500.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />
																	<input type="hidden" name="amount" value="20.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/17.png" /></a>		
															<p>五谷杂粮</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥200.99 <span>￥350.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="basmati rise" />
																	<input type="hidden" name="amount" value="20.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block">
														<div class="snipcart-thumb">
															<a href="products.html"><img src="images/23.jpg" alt=" "   height="150px;" /></a>
															<p>时尚老花镜</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥40.99 <span>￥65.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Pepsi soft drink" />
																	<input type="hidden" name="amount" value="40.00" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"> </div>
							<div class="agile_top_brands_grids">
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/13.jpg" height="150px;" /></a>		
															<p>血压计</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥350.99 <span>￥550.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Fortune Sunflower Oil" />
																	<input type="hidden" name="amount" value="35.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block" >
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/21.jpg" height="150px;"/></a>		
															<p>中老年人高端踏步机</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥3000.99 <span>￥4500.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="basmati rise" />
																	<input type="hidden" name="amount" value="30.99" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 top_brand_left">
									<div class="hover14 column">
										<div class="agile_top_brand_left_grid">
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid_pos">
												<img src="images/offer.png" alt=" " class="img-responsive" />
											</div>
											<div class="agile_top_brand_left_grid1">
												<figure>
													<div class="snipcart-item block">
														<div class="snipcart-thumb">
															<a href="products.html"><img title=" " alt=" " src="images/4.jpg" height="150px;"/></a>
															<p>收音机</p>
															<div class="stars">
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star blue-star" aria-hidden="true"></i>
																<i class="fa fa-star gray-star" aria-hidden="true"></i>
															</div>
															<h4>￥800.99 <span>￥1050.00</span></h4>
														</div>
														<div class="snipcart-details top_brand_home_details">
															<form action="#" method="post">
																<fieldset>
																	<input type="hidden" name="cmd" value="_cart" />
																	<input type="hidden" name="add" value="1" />
																	<input type="hidden" name="business" value=" " />
																	<input type="hidden" name="item_name" value="Pepsi soft drink" />
																	<input type="hidden" name="amount" value="80.00" />
																	<input type="hidden" name="discount_amount" value="1.00" />
																	<input type="hidden" name="currency_code" value="USD" />
																	<input type="hidden" name="return" value=" " />
																	<input type="hidden" name="cancel_return" value=" " />
																	<input type="submit" name="submit" value="加入购物车" class="button" />
																</fieldset>
															</form>
														</div>
													</div>
												</figure>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
<!-- //top-brands -->


 <!--Our gallery start-->
        <div class="our-gallery">
            <div class="bg-img-2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="section-title grey_bg mb-50 text-center">
                                <h2 class="mb-50" >你的健康，我们的快乐</h2>
                                <p> 为天下孝心子女提供方便，满足天下中老年人的需求</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="gallery-menu fix text-center mb-60">
                                <ul>
                                    <li   style="margin-right: 260px; margin-bottom: 10px;font-size: 20px;">健身器械</li>
                                    <li   style="margin-right: 180px;margin-bottom: 10px;font-size: 20px;">家庭医疗</li>
                                    <li   style="margin-left: 140px; margin-bottom: 10px;font-size: 20px;">养生生活</li>
                                   
                                </ul>
                            </div>
                            <div class="gallery-item-box row">
                                <div class="col-md-4 col-sm-6 col-xs-12 gallery-item desert drink mb-30" >
                                    <div class="single-item-gallery" >
                                        <a href="daily_household.html">
                                            <span class="plus" ><i class="fa fa-plus"></i></span>
                                        </a>
                                        <img src="${PageContext.request.contextPath}/JSP/RP/images/120.jpg" alt="" >
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12 gallery-item coffee catering mb-30">
                                    <div class="single-item-gallery">
                                        <a href="images/gallery/2.jpg">
                                            <span class="plus"><i class="fa fa-plus"></i></span>
                                        </a>
                                        <img src="${PageContext.request.contextPath}/JSP/RP/images/1.jpg" alt="">
                                    </div>
                                </div> 
                                <div class="col-md-4 col-sm-6 col-xs-12 gallery-item desert drink mb-30">
                                    <div class="single-item-gallery">
                                        <a href="images/gallery/3.jpg">
                                            <span class="plus"><i class="fa fa-plus"></i></span>
                                        </a>	
                                        <img src="${PageContext.request.contextPath}/JSP/RP/images/191.jpg" alt="">
                                    </div>
                                </div>
                              
                            </div>
                        </div>   
                    </div>
                </div>
        	</div>
        </div>
        <!--Our gallery end-->

<!--banner-bottom-->
				<div class="ban-bottom-w3l">
					
<!--banner-bottom-->

<!-- //footer -->
<div class="footer">
		<div class="container">
			<div class="w3_footer_grids">
				<div class="col-md-3 w3_footer_grid">
					<h3>联系我们</h3>
					
					<ul class="address">
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>江苏省 南通市, 三余镇, <span>通州湾科创城.</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">2350826406@qq.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+189 8400 1236</li>
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>关于我们</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="about.html">关于我们</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="contact.html">联系我们</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>热销商品</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="groceries.html">老人健身产品</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="household.html">老人按摩用品</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="personalcare.html">孝心礼品类</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="packagedfoods.html">中老年服饰</a></li>
						
					</ul>
				</div>
				<div class="col-md-3 w3_footer_grid">
					<h3>后台管理</h3>
					<ul class="info"> 
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="checkout.html">我的积分</a></li>
						<li><i class="fa fa-arrow-right" aria-hidden="true"></i><a href="${pageContext.request.contextPath }/JSP/HT/login.jsp">登录</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
		
		<div class="footer-copy">
			
			<div class="container">
				<p>© 2017 孝和商城. All rights reserved | Design by <a href="http://w3layouts.com/">光宗耀组</a></p>
			</div>
		</div>
		
	</div>	
	<div class="footer-botm">
			<div class="container">
				<div class="w3layouts-foot">
					<ul>
						<li><a href="#" class="w3_agile_facebook"><i class="fa fa-qq" aria-hidden="true"></i></a></li>
						<li><a href="#" class="agile_twitter"><i class="fa fa-weixin" aria-hidden="true"></i></a></li>
						<li><a href="#" class="w3_agile_dribble"><i class="fa fa-weibo" aria-hidden="true"></i></a></li>
						
					</ul>
				</div>
				<div class="payment-w3ls">	
					<img src="${PageContext.request.contextPath}/JSP/RP/images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //footer -->	





<!--[if lte IE 8]>
<script src="js/ieBetter.js"></script>
<![endif]-->
<script src="js/bootstrap.min.js"></script>
<!-- top-header and slider -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/minicart.min.js"></script>
<script>
	// Mini Cart
	paypal.minicart.render({
		action: '#'
	});

	if (~window.location.search.indexOf('reset=true')) {
		paypal.minicart.reset();
	}
</script>
<!-- main slider-banner -->
<script src="${pageContext.request.contextPath}/JSP/RP/js/skdslider.min.js"></script>
<link href="${pageContext.request.contextPath}/JSP/RP/css/skdslider.css" rel="stylesheet">
<script type="text/javascript">
		jQuery(document).ready(function(){
			jQuery('#demo1').skdslider({'delay':5000, 'animationSpeed': 2000,'showNextPrev':true,'showPlayButton':true,'autoSlide':true,'animationType':'fading'});
						
			jQuery('#responsive').change(function(){
			  $('#responsive_wrapper').width(jQuery(this).val());
			});
			
		});

	
	
	
//加载页面

  $(window).load(function(){
    $('.preloader').fadeOut(1000); // set duration in brackets    
  });



//滚动出现固定导航
(function(){
    $(window).scroll(function(){
        var scTop = $(window).scrollTop(),
            $scS = $('.scroll-search'),
            rW;
        rW = ($(window).width() - 1190)/2;

        scTop >= 200 ? $scS.slideDown(200) : $scS.slideUp(200);
        
    });
})(jQuery);


</script>	
<!-- //main slider-banner --> 

</body>
</html>