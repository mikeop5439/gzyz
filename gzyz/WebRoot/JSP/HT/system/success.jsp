<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/admin.css">
	 
	<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/app.js"></script>
	<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/amazeui.min.js"></script>

<script language='javascript'>
 
 
 </script>

  </head>
  
  <body>
   <header class="am-topbar admin-header">
   		<div class="am-topbar-brand"><img src="./assets/i/logo.png"></div>

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
      <h3 class="am-icon-flag"><em></em> 商品管理</h3>
      <ul>
       <li><a href="The_gods_list.html">商品列表</a></li>
        <li><a href="Add_new_goods.html">添加新商品</a></li>
		<li><a href="Classfiy_goods.html">商品分类</a></li>
		<li><a href="The_recycle_bin.html">商品回收站</a></li>
        <li>商品自动上下架 </li>
		 <li><a href="The_good_comment_list.html">商品评论列表</a></li>
      </ul>
      <h3 class="am-icon-cart-plus"><em></em>订单管理</h3>
      <ul>
        <li>订单列表</li>
        <li><a href="query.html">订单查询</a></li>
		<li>订单打印</li>
        <li>发货单列表</li>
        <li>换货单列表</li>
      </ul>
      <h3 class="am-icon-bar-chart"><em></em> 数据统计</h3>
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
        <li>用户列表 </li>
        <li>用户购物车</li>
        <li>用户收藏夹</li>
        <li>管理员列表</li>
        <li>管理员日志</li>
        <li>角色管理</li>
      </ul>
      <h3 class="am-icon-gears"><em></em>系统设置</h3>
      <ul>
           <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemdata.jsp">数据备份</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systempay.jsp">支付方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemsend.jsp">配送方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemlinks.jsp">友情链接</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemessay.jsp">文章列表</a></li>
     
      </ul>
     
     <h3 class="am-icon-dollar"><em></em> 促销管理</h3>
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
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
				
		</script> 
  </div>
  <div class=" admin-content">
    <div class="daohang">
      <ul>
        <li>
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
        首页
        </li>
        <li>
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
        帮助中心<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </button>
        </li>
        <li>
          <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
          奖金管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
          </button>
        </li>
        <li>
          <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
          产品管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
          </button>
        </li>
      </ul>
    </div>
    
    
     
     	
    <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">编辑商品分类属性值</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> 
      </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu">
          <table align="center" border="1" width="600" >
          <tr>
          	<td align="center">商品类型</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
           <tr>
          	<td align="center">商品名称</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品品牌</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">品牌描述</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品原价</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品现价</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
          <tr>
          	<td align="center">商品描述（简要）</td>
          	<td><input type="text" name="" value=""/></td>
          </tr>
           <tr align="center">
         	<td colspan="2">
         		<input type="submit" value="提交">
         	</td>
           </tr>
        </table>
        </form>
        
      </div>
      
    </div>
    
   
    <div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">
          数据备份
        </ul>
        <dl class="am-icon-home" style="float: right;">
          当前位置：数据备份 > <a href="index.html">首页</a>
        </dl>

       
        <!--data-am-modal="{target: '#my-popup'}" 弹出层 ID  弹出层 190行 开始  271行结束--> 
        
      </div>
      
      
<div style="height: 800px;">
	<p style='text-align: center;'>操作成功！</p>
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
<script src="assets/js/amazeui.min.js"></script> 

<!--<![endif]-->
  </body>
</html>
