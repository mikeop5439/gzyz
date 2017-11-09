<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>用户列表 </title>
<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/JSP/HT/assets/i/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/JSP/HT/assets/css/admin.css">

<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/additional-methods.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/jquery.validate.extend.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JSP/HT/assets/js/addgoods.js" ></script>
<script>
function changecartpage(page){
	var url="userlist/querycartListpage.action";
	var args={"page":page,"time":new Date()};
	$.post(url,args);
};

function snewpage(){
	var page=$(":input[name='newpage']").val();
	if(page != 1 && page != null){
		page=page-1;
		var url="userlist/queruserlistpage.action";
		var args={"page":page,"time":new Date()};
		$.getJSON(url,args,function(date){
			$("tbody").html(date);
		});
	}else{
	
	}
}
function xnewpage(){
	var page=$(":input[name='newpage']").val();
		
		
		var url="userlist/queruserlistpage.action";
		var args={"page":parseInt(page)+1,"time":new Date()};
		$.getJSON(url,args,function(date){
			$("tbody").html(date);
		});
	
};
function querypagelist(){
	var page=$(":input[name='pageslist']").val();
	var url="userlist/querypagelist.action";
	var args={"page":page,"time":new Date()};
		$.getJSON(url,args,function(date){
			$("tbody").html(date);
		});
	
};

function sogo(){
	var page=$(":input[name='sogo']").val();
	if(page !=null && page != ""){
	var url="userlist/sogouser.action";
	var args={"page":page,"time":new Date()};
	$.getJSON(url,args,function(date){
			$("tbody").html(date);
		});
	
	}else{
		alert("请输入用户ID或用户名");
	}
};
</script>
</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->






</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath}/JSP/HT/assets/i/logo.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
 
  
</li>

 <li class="kuanjie">
 	
 	 
 	<a href="#">个人中心</a> 
 	
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
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：黄鼎运</div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="#">商品管理</a></h3>
      <ul>
        <li><a href="${pageContext.request.contextPath }/good/squreyGoodsLimit.action?nowpage=1">商品列表</a></li>
        <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/addgoods.jsp">添加新商品</a></li>
		  <li><a href="Classfiy_goods.html">商品分类</a></li>
        <li>商品回收站</li>
        <li>商品自动上下架 </li>
        <li>商品评论列表</li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3>
      <ul>
        <li>订单列表</li>
        <li><a href="query.html">订单查询</a></li>
		<li>订单打印</li>
        <li>发货单列表</li>
        <li>换货单列表</li>
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
      <h3 class="am-icon-user"><em></em> <a href="#">用户管理</a></h3>
       <ul>
        <li><a href="${pageContext.request.contextPath }/userlist/queryuserList.action">用户列表</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycartList.action">用户购物车</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycollectList.action">用户收藏夹</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/queryreceiverList.action">用户收货地址</a></li>
	  </ul>
      
      <h3 class="am-icon-user"><em></em> <a href="#">权限管理</a></h3>
      <ul>
        <li>管理员列表</li>
        <li>管理员日志</li>
        <li>角色管理</li>
      </ul>
      
      <h3 class="am-icon-gears"><em></em> <a href="#">系统设置</a></h3>
      <ul>
        <li>数据备份</li>
        <li>支付方式</li>
        <li>配送方式</li>
        <li>友情链接</li>
        <li>文章列表</li>
     
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
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				
				});
		</script> 

     
</div>

<div class=" admin-content">
	
		<div class="daohang">
			<ul>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs"> 首页 </li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">奖金管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs">产品管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
				
				
			</ul>

       

	
</div>
<!--修改信息  -->
<div class="am-popup am-popup-inner" id="my-update">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加新品牌</h4>
      </div>
      <div class="am-popup-bd">
        <form id="addbrand" class="am-form tjlanmu" action="${pageContext.request.contextPath}/goods/addbrand.action" method="post" enctype="multipart/form-data">
        
          <div class="am-form-group">
            <div class="zuo">品牌名称：</div>
            <div class="you">
              <input type="text" id="brand_name" name="brand_name" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输品牌"/>
            </div>
          </div>          
          <div class="am-form-group am-cf">
            <div class="zuo">品牌LOG：</div>
            <div class="you" style="height: 45px;">
              <input type="file" name="goodsphoto" id="doc-ipt-file-1" placeholder="请选择要上传的文件..."/>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">品牌介绍：</div>
            <div class="you">
              <input type="text" name="brand_desc" rows="2" id="doc-ta-1"/>
            </div>
          </div>
          
          <div class="am-form-group am-cf">
            <div class="you">
              <p>
                <button type="submit" class="am-btn am-btn-success am-radius">提交</button>
              </p>
            </div>
          </div>
          
        </form>
      </div>
    </div>
	

									
																		


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-user on">购物车列表</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： 用户列表 > <a href="index.html">首页</a></dl>
      
      
      
    </div>
	
<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
 <form action="${pageContext.request.contextPath }/userlist/sogocart.action" method="post">
  <ul>
  <li></li>
  <li><input name="sogo" type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: -0.5px;height: 28px;margin-top: 3px;width:200px; "  placeholder="输入用户ID/用户名查找" /></li>
  <li><button type="submit" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: 1px;">搜索</button></li>
  </ul>
  </form>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead>
              <tr class="am-success">
                <th class="table-id">用户ID</th><!--购物车ID  -->
                <th class="table-name">用户名</th>
                <th class="table-name">商品名</th>
                <th class="table-name">货号</th>
                <th class="table-name">价格</th>
                <th class="table-name">数量</th>
              </tr>
            </thead>
            <tbody id="tbody">
             <c:forEach items="${userscart }" var="u">
              <tr>
                <td align="center" valign="middle" rowspan="${u.getCart().size()+1 }">${u.getUser_id()}</td>
                <td valign="middle" rowspan="${u.getCart().size()+1 }">
                	<a>${u.getUser_name()}</a>
                </td>
                
                <c:forEach items="${u.getCart()}" var="c" >
                	<tr>
	                <td id="3">${c.getGoods_name()}</td>
	                <td id="4">${c.getGoods_sn()}</td>
	                <td id="5">${c.getGoods_price()}</td>
	                <td id="6">${c.getGoods_number()}</td>
	                </tr>
                </c:forEach>
              </tr>
              </c:forEach> 
            </tbody>
          </table>
         
          
          <ul class="am-pagination am-fr">
                <li ><a id="a"  href="${pageContext.request.contextPath}/userlist/querycartListpage.action?daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&page=99999999&xia=1&shang=8">上一页</a></li>
                <li ><a id="a" href="${pageContext.request.contextPath}/userlist/querycartListpage.action?daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&page=1&xia=1&shang=1">1</a></li>
                <li><a id="a" href="${pageContext.request.contextPath}/userlist/querycartListpage.action?daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&page=2&xia=1&shang=1">2</a></li>
                <li><a id="a" href="${pageContext.request.contextPath}/userlist/querycartListpage.action?daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&page=3&xia=1&shang=1">3</a></li>
                <li><a id="a" href="${pageContext.request.contextPath}/userlist/querycartListpage.action?daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&daslkdjkadsadgfdgjkjhesakls=<%=new Date() %>&page=9999999&xia=9&shang=1">下一页</a></li>
                
                <li>
                <form action="${pageContext.request.contextPath}/userlist/querycartListpage.action" method="post">
                <input type="hidden" name="daslkdjkadsadgfdgjkjhesakls" value="<%=new Date() %>"/>
                <input type="hidden" name="baslkdjkadsadgfdgjkjhesakls" value="<%=new Date() %>"/>
                <input type="text" name="page" class="am-form-field am-input-sm am-input-xm" style="height:20px; width: 53px"placeholder="输入页码搜索"/>
                <input type="hidden" name="shang" value="1"/>
                <input type="hidden" name="xia" value="1"/>
                </li>
                <li>
                	<input type="submit" value="搜索"/>
                </li>
                </form>
                
              	
              </ul>
          
          
          
      
          <hr />
          <p>注：.....</p>
        </form>
 
 
 
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
<script src="${pageContext.request.contextPath}/JSP/HT/assets/js/amazeui.min.js"></script> 
<!--<![endif]-->



</body>
</html>