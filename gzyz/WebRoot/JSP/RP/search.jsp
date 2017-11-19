<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html >

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

		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/amazeui.css" rel="stylesheet" type="text/css">
        
		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/JSP/RP/personal/css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/RP/personal/js/script.js"></script>
		<script type="text/javascript">
		window.onload =function setSpage(){
	     var i=2;
	     var page_id="AllPage"+1;
	     $("#pageUl").empty();
	     $("#pageUl").append("<li><a href='javascript:searchGoodsLimt(1)'>«</a></li>");
	     $("#pageUl").append("<li class='am-active'><a href='javascript:searchGoodsLimt(1)'>1</a></li>");
	      for(i;i<=${result.allpage};i++){
	      page_id="AllPage";
	      page_id=page_id+i;
	      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:searchGoodsLimt("+i+")'>"+i+"</a></li>");
	     } 
	     $("#pageUl").append("<li><a href='javascript:searchGoodsLimt("+${result.allpage}+")'>»</a></li>");
	     
	     };
	     
	     function setpagedate(allpage,nowpage){
	     var i=2;
	     var page_id="AllPage"+1;
	     $("#pageUl").empty();
	     $("#pageUl").append("<li><a href='javascript:searchGoodsLimt(1)'>«</a></li>");
	     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:searchGoodsLimt(1)'>1</a></li>");
	     for(i;i<=allpage;i++){
	      page_id="AllPage";
	      page_id=page_id+i;
	      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:searchGoodsLimt("+i+")'>"+i+"</a></li>");
	     }
	     $("#pageUl").append("<li><a onclick='javascript:searchGoodsLimt("+allpage+")'>»</a></li>");
	     page_id="AllPage"+nowpage;
	     var id="#"+page_id;
	     $("ul.am-pagination li").removeClass("am-active");
	     $(id).addClass("am-active");
	     };
	     
	     function setpagebrand(allpage,nowpage,brand_name){
	     var i=2;
	     var page_id="AllPage"+1;
	     $("#pageUl").empty();
	     $("#pageUl").append("<li><a href='javascript:searchGoodsBrand(1,"+brand_name+")'>«</a></li>");
	     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:searchGoodsBrand(1,"+brand_name+")'>1</a></li>");
	     for(i;i<=allpage;i++){
	      page_id="AllPage";
	      page_id=page_id+i;
	      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:searchGoodsBrand(1,"+brand_name+")'>"+i+"</a></li>");
	     }
	     $("#pageUl").append("<li><a onclick='javascript:searchGoodsBrand(1,"+brand_name+")'>»</a></li>");
	     page_id="AllPage"+nowpage;
	     var id="#"+page_id;
	     $("ul.am-pagination li").removeClass("am-active");
	     $(id).addClass("am-active");
	     };
	     function searchGoodsLimt(nowpage){
	     var keywords = $("#stringofkeyword").text();
	     var count=$("#stringofcount").text()
	     var params = '{"keywords":"'+keywords+'","count":"'+count+'"}';
	     $.ajax({  
	           type:"POST",  
	           url:"${pageContext.request.contextPath }/rpsearch/asearchgoods.action?nowpage="+nowpage, 
		       contentType:'application/json;charset=utf-8',
		       dataType:"json",
		       data:params,
			   success:function(data){
			   setpagedate(data.allpage,nowpage);
			   $("#searchGoodsUl").empty();
			   $.each(data.goods,function(index,content){
			   var li=$("<li></li>");
			   var div=$("<div></div>").addClass("i-pic limit");
			   var img=$("<img></img>").attr("weidth","200px").attr("height","280px").attr("src","${pageContext.request.contextPath }/"+content.original_img);
			   var p1=$("<p></p>").addClass("title fl").append(content.goods_name);
			   var p2=$("<p></p>").addClass("price fl").append($("<b></b>").append("¥")).append($("<strong></strong>").append(content.shop_price));
			   var p3=$("<p></p>").addClass("number fl").append("销量").append($("<span></span>").append(content.sales));
			   div.append(img).append(p1).append(p2).append(p3);
			   $("#searchGoodsUl").append(li.append(div));
			   });
			  } 
			  	   
	       });  
     };
     function searchGoodsBrand(nowpage,brand_name){
	     var keywords = $("#stringofkeyword").text();
	     var count=$("#stringofcount").text();
	     var brandname=brand_name;
	     var params = '{"keywords":"'+keywords+'","count":"'+count+'","brand_name":"'+brandname+'"}';
	     $.ajax({  
	           type:"POST",  
	           url:"${pageContext.request.contextPath }/rpsearch/asearchgoodsbrand.action?nowpage="+nowpage, 
		       contentType:'application/json;charset=utf-8',
		       dataType:"json",
		       data:params,
			   success:function(data){
			   setpagebrand(data.allpage,nowpage,brand_name);
			   initli();
			   $("#searchGoodsUl").empty();
			   $.each(data.goods,function(index,content){
			   var li=$("<li></li>");
			   var div=$("<div></div>").addClass("i-pic limit");
			   var img=$("<img></img>").attr("weidth","200px").attr("height","280px").attr("src","${pageContext.request.contextPath }/"+content.original_img);
			   var p1=$("<p></p>").addClass("title fl").append(content.goods_name);
			   var p2=$("<p></p>").addClass("price fl").append($("<b></b>").append("¥")).append($("<strong></strong>").append(content.shop_price));
			   var p3=$("<p></p>").addClass("number fl").append("销量").append($("<span></span>").append(content.sales));
			   div.append(img).append(p1).append(p2).append(p3);
			   $("#searchGoodsUl").append(li.append(div));
			   }); 
			  } 
			  	   
	       });  
     };
		</script>
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
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">搜索商品</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

			
	<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">老年健身产品</a></li>
					<li class="qc"><a href="#">老年理疗产品</a></li>
					<li class="qc"><a href="#">老年生活用品</a></li>
					<li class="qc"><a href="#">孝心礼品类</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>个人中心
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<b class="line"></b>

			
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">														
							<div class="searchAbout">

							</div>
							<ul class="select">
								<p class="title font-normal">
									<span id= "stringofkeyword"class="fl">${result.keywords}</span>
									<span class="total fl">搜索到<strong id="stringofcount"  class="num">${result.count}</strong>件相关商品</span>
								</p>
								<div class="clear"></div>
								<li class="select-result">
									<dl>
										<dt>已选</dt>
										<dd class="select-no"></dd>
										<p class="eliminateCriteria">清除</p>
									</dl>
								</li>
								<div class="clear"></div>
								<li class="select-list">
									<dl id="select1">
										<dt class="am-badge am-round">品牌</dt>	
									
										 <div id="brandDd"class="dd-conent">										
											<dd class="select-all selected"><a href="#" onclick="javascript:searchGoodsLimt(1)">全部</a></dd>
											<c:forEach items="${result.brand}" var="brands">
											<dd><a href="#" onclick="javascript:searchGoodsBrand(1,'${brands.brand_name}')">${brands.brand_name}</a></dd>
							                </c:forEach> 
										 </div>
						
									</dl>
								</li>
								
								
					        
							</ul>
							<div class="clear"></div>
                        </div>
							<div class="am-u-sm-12 am-u-md-12 ">
								<div class="sort">
									<li class="liofchlik first thisinit"><a title="综合" href="#">综合排序</a></li>
									<li class="liofchlik" ><a title="销量" href="#">销量排序</a></li>
									<li class="liofchlik" ><a title="价格" href="#">价格优先</a></li>
								</div>
								<div class="clear"></div>

								<ul id="searchGoodsUl" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
							     <c:forEach items="${result.goods}" var="good">
							         <li>
											<div class="i-pic limit">
												<img src="${pageContext.request.contextPath }${good.original_img}" weidth="200px" height="280px"/>											
												<p class="title fl">${good.goods_name}</p>
												<p class="price fl">
													<b>¥</b>
													<strong>${good.shop_price}</strong>
												</p>
												<p class="number fl">
													销量<span>${good.sales}</span>
												</p>
											</div>
										</li>    
							     </c:forEach> 
							 </ul>
							</div>
							
							<div class="clear"></div>
							<!--分页 -->
							<ul id="pageUl" class="am-pagination am-pagination-centered">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>

						</div>
					</div>
					
				</div>

			</div>

		<!-- //footer -->

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
					<img src="${pageContext.request.contextPath }/JSP/RP/images/card.png" alt=" " class="img-responsive">
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
<!-- //footer -->	
<script type="text/javascript">
$("li.liofchlik").click(function(){
    $("li.liofchlik").removeClass("first");
	$(this).addClass("first");
})
function initli(){
    $("li.liofchlik").removeClass("first");
	$("li.thisinit").addClass("first");
}
</script>

		
		
		



	</body>

</html>