<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>后台管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/JSP/HT/assets/i/favicon.png">

<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/admin.css">
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/amazeui.min.js"></script>
<script>
window.onload =function(){
  var number=0;
  reminder("head","info","onmouseover","onmouseout",number);
  function reminder (div1,div2,event1,event2,num){
    var oHead = document.getElementsByClassName(div1)[num];
    var oInfo = document.getElementsByClassName(div2)[num];
    var timer = null;
    oHead[event1] = oInfo[event1]=function(){
     clearTimeout(timer);
     oInfo.style.display="block";
    };
    oHead[event2] = oInfo[event2]=function(){
     timer = setTimeout(function(){
      oInfo.style.display="none";
     },500);
    };
  }
};
	
</script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->
</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath }/JSP/HT/assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">


 <li class="kuanjie">
 	
 	 
     <a href="#" rel="drevil">个人中心</a>
 	 
 	
 	 <a href="login.html">退出</a>
 </li>
 

 <li class="soso">
 	
<p>   
	
	<select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
          <option value="b">全部</option>
          <option value="o">产品</option>
          <option value="o">会员</option>
          
        </select>

</p>

<p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="光宗耀组" /></p>
<p><button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button></p>
 </li>


 <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
   
  </div>
  
</header>


<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：<c:out value="${username}"/> </div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> 商品管理</h3>
      <ul>
        <li><a href="${pageContext.request.contextPath }/good/squreyGoodsLimit.action?nowpage=1">商品列表</a></li>
        <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/addgoods.jsp">添加新商品</a></li>
		  <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/goodscategory.jsp">商品分类</a></li>
        <li>商品回收站</li>
        <li><a href="${pageContext.request.contextPath }/comment/commentlist.action">商品评论列表</a></li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
      <ul>
        <li><a href="${pageContext.request.contextPath }/order/orderlist.action">订单列表</a></li>
        <li><a href="query.html">订单查询</a></li>
		<li>订单打印</li>
        <li><a href="${pageContext.request.contextPath }/orderiands/squeryAllInvoiceLimit.action?nowpage=1">退换货单列表</a></li>
      </ul>
      <h3 class="am-icon-bar-chart"><em></em> <a href="#">数据统计</a></h3>
      <ul>
        <li>流量分析（访问量） </li>
        <li>客户统计</li>
        <li>销售概况</li>
        <li>会员排行</li>
        <li>销售排行</li>
        <li>访问购买率</li>
      </ul>
      <h3 class="am-icon-user"><em></em> 用户管理</h3>
       <ul>
        <li><a href="${pageContext.request.contextPath }/userlist/queryuserList.action">用户列表</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycartList.action">用户购物车</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycollectList.action">用户收藏夹</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/queryreceiverList.action">用户收货地址</a></li>
		</ul>
      <h3 class="am-icon-lock"><em></em> 权限管理</h3>
      <ul>
        
        <li><a href="${pageContext.request.contextPath }/manager/queryAllManager.action">管理员列表</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/squeryLogLimit.action?nowpage=1">管理员日志</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/queryManagerAndRole.action">角色管理</a></li>
      </ul>
      <h3 class="am-icon-gears"><em></em> <a href="#">系统设置</a></h3>
      <ul>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemdata.jsp">数据备份</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systempay.jsp">支付方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemsend.jsp">配送方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemlinks.jsp">友情链接</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemessay.jsp">文章列表</a></li>
     
      </ul>
     
     <h3 class="am-icon-dollar"><em></em> <a href="#">促销管理</a></h3>
      <ul>
        <li>积分商城商品</li>
       
      </ul>
    </div>
    <!-- sideMenu End --> 
    
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:200 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				
				});
		</script> 

    
    
    
    
    
    
    
</div>

<div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 首页</button><br>
 </li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">奖金管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">产品管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				
				
			</ul>

       

	
</div>
	
	


<div class="admin">
	
 <div class="info"></div>
	
	
   
   <div class="admin-index">
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
		  <dt class="qs"><i class="am-icon-users"></i></dt>
        <dd>455</dd>
        <dd class="f12">今日访客</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
        <dt class="cs"><i class="am-icon-area-chart"></i></dt>
        <dd>455</dd>
        <dd class="f12">今日收入</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
        <dt class="hs"><i class="am-icon-shopping-cart"></i></dt>
        <dd>455</dd>
        <dd class="f12">商品数量</dd>
      </dl>
      <dl data-am-scrollspy="{animation: 'slide-right', delay: 900}">
        <dt class="ls"><i class="am-icon-cny"></i></dt>
        <dd>455</dd>
        <dd class="f12">全部收入</dd>
      </dl>
    </div>
    
    
    
  <div class="admin-biaoge">
      <div class="xinxitj">信息概况</div>
    
    </div>
    <div class="shuju">
      <div class="shujuone">
        <dl>
          <dt>全盘收入：  1356666</dt>
          <dt>全盘支出：   5646465.98</dt>
          <dt>全盘利润：  546464</dt>
        </dl>
        <ul>
          <h2>26.83%</h2>
          <li>全盘拨出</li>
        </ul>
      </div>
      <div class="shujutow">
        <dl>
          <dt>全盘收入：  1356666</dt>
          <dt>全盘支出：   5646465.98</dt>
          <dt>全盘利润：  546464</dt>
        </dl>
        <ul>
          <h2>26.83%</h2>
          <li>全盘拨出</li>
        </ul>
      </div>
      <div class="slideTxtBox">
        <div class="hd">
          <ul>
            <li>工作通知</li>
            <li>工作进度表</li>
          </ul>
        </div>
        <div class="bd">
         
          <ul>
            <table class="am-table">
              <tbody>
                <tr>
                  <td>普卡</td>
                  <td>普卡</td>
                  <td><a href="#">4534</a></td>
                  <td>+20</td>
                  <td> 4534 </td>
                </tr>
                <tr>
                  <td>银卡</td>
                  <td>银卡</td>
                  <td>4534</td>
                  <td>+2</td>
                  <td> 4534 </td>
                </tr>
                <tr>
                  <td>金卡</td>
                  <td>金卡</td>
                  <td>4534</td>
                  <td>+10</td>
                  <td> 4534 </td>
                </tr>
                <tr>
                  <td>钻卡</td>
                  <td>钻卡</td>
                  <td>4534</td>
                  <td>+50</td>
                  <td> 4534 </td>
                </tr>
                <tr>
                  <td>合计</td>
                  <td>合计</td>
                  <td>4534</td>
                  <td>+50</td>
                  <td> 4534 </td>
                </tr>
              </tbody>
            </table>
          </ul>
          
           <ul>
            <table width="100%" class="am-table">
              <tbody>
                <tr>
                  <td width="7%"  align="center">1 </td>
                  <td width="83%" >工作进度名称</td>
                  <td width="10%"  align="center"><a href="#">10%</a></td>
                </tr>
                <tr>
                  <td align="center">1 </td>
                  <td>工作进度名称</td>
                  <td  align="center"><a href="#">10%</a></td>
                </tr>
                <tr>
                  <td  align="center">1 </td>
                  <td>工作进度名称</td>
                  <td  align="center"><a href="#">10%</a></td>
                </tr>
                <tr>
                  <td  align="center">1 </td>
                  <td>工作进度名称</td>
                  <td  align="center"><a href="#">10%</a></td>
                </tr>
                
                <tr>
                  <td  align="center">1 </td>
                  <td>工作进度名称</td>
                  <td  align="center"><a href="#">10%</a></td>
                </tr>
                
                <tr>
                  <td  align="center" >1 </td>
                  <td>工作进度名称</td>
                  <td  align="center"><a href="#">10%</a></td>
                </tr>
                
                <tr>
                  <td  align="center">1 </td>
                  <td>工作进度名称</td>
                  <td  align="center"><a href="#">10%</a></td>
                </tr>
                
                
                
                
                
                
                
                
              </tbody>
            </table>
          </ul>
        </div>
      </div>
      <script type="text/javascript">jQuery(".slideTxtBox").slide();</script> 
   
 </div>  
   
    

    <div class="foods">
    	<ul>版权所有@2017 . 光宗耀祖</ul>
    	<dl><a href="" title="返回头部" class="am-icon-btn am-icon-arrow-up"></a></dl>


    	
    </div>







</div>

</div>




</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]--> 

<!--[if (gte IE 9)|!(IE)]><!--> 

<!--<![endif]-->

<script>
	
$(function(){
$("[rel=drevil]").popover({
trigger:'manual',
placement : 'bottom', //placement of the popover. also can use top, bottom, left or right
html: 'true', //needed to show html of course
content : '<div id="popOverBox" style="width:130px;height:150px;">  <img src="assets/img/user05.png"  width="130" height="130" > <br> <p>超级管理员：曾盈</p> </div>', //this is the content of the html box. add the image here or anything you want really.
animation: false
}).on("mouseenter", function () {
var _this = this;
$(this).popover("show");
$(this).siblings(".popover").on("mouseleave", function () {
$(_this).popover('hide');
});
}).on("mouseleave", function () {
var _this = this;
setTimeout(function () {
if (!$(".popover:hover").length) {
$(_this).popover("hide")
}
}, 100);
});
});	
</script>

</body>
</html>
