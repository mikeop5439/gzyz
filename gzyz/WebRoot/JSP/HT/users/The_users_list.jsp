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

</head>
<body>
<!--[if lte IE 9]><p class="browsehappy">升级你的浏览器吧！ <a href="http://se.360.cn/" target="_blank">升级浏览器</a>以获得更好的体验！</p><![endif]-->






</head>

<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="assets/i/logo.png"></div>

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
        <li>用户列表 </li>
        <li>用户购物车</li>
        <li>用户收藏夹</li>
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
	
 <div class="am-popup am-popup-inner" id="my-popup">
      <div class="am-popup-hd">
        <h4 class="am-popup-title">添加商品一级分类</h4>
        <span data-am-modal-close
            class="am-close">&times;</span> </div>
      <div class="am-popup-bd">
        <form class="am-form tjlanmu">
          <div class="am-form-group">
            <div class="zuo">栏目名称：</div>
            <div class="you">
              <input type="email" class="am-input-sm" id="doc-ipt-email-1" placeholder="请输入标题">
            </div>
          </div>
          <div class="am-form-group">
            <div class="zuo">栏目关键词：</div>
            <div class="you">
              <input type="password" class="am-input-sm" id="doc-ipt-pwd-1" placeholder="请输入关键词">
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">栏目描述：</div>
            <div class="you">
              <textarea class="" rows="2" id="doc-ta-1"></textarea>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">栏目图片：</div>
            <div class="you" style="height: 45px;">
              <input type="file" id="doc-ipt-file-1">
              <p class="am-form-help">请选择要上传的文件...</p>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">简介：</div>
            <div class="you">
              <textarea class="" rows="2" id="doc-ta-1"></textarea>
            </div>
          </div>
          <div class="am-form-group am-cf">
            <div class="zuo">状态：</div>
            <div class="you" style="margin-top: 3px;">
              <label class="am-checkbox-inline">
                <input type="checkbox" value="option1">
                显示 </label>
              <label class="am-checkbox-inline">
                <input type="checkbox" value="option2">
                隐藏 </label>
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
      <ul class="am-icon-user on"> 用户列表</ul>
      
      <dl class="am-icon-home" style="float: right;"> 当前位置： 用户列表 > <a href="index.html">首页</a></dl>
      
      
      
    </div>
	
	<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <ul>
    <li>
      <div class="am-btn-group am-btn-group-xs">
        <select data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
          <option value="b">用户分类</option>
          <option value="o">旧用户</option>
        </select>
      </div>
    </li>
    <li>
      <div class="am-btn-group am-btn-group-xs">
      <select data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
        <option value="b">用户分类</option>
        <option value="o">新用户</option>
      </select>
      </div>
    </li>
    <li style="margin-right: 0;">
    	<span class="tubiao am-icon-calendar"></span>
      <input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="开始日期" data-am-datepicker="{theme: 'success',}"  readonly/>
    </li>
       <li style="margin-left: -4px;">
    	<span class="tubiao am-icon-calendar"></span>
      <input type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="开始日期" data-am-datepicker="{theme: 'success',}"  readonly/>
    </li>
    
        <li style="margin-left: -10px;">
      <div class="am-btn-group am-btn-group-xs">
      <select data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
        <option value="b">用户分类</option>
        <option value="o">不活跃用户</option>
      </select>
      </div>
    </li>
  <li><input type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: -0.5px;height: 100%;margin-top: 3px; "  placeholder="关键词搜索" /></li>
    <li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: 1px;">搜索</button></li>
  </ul>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead>
              <tr class="am-success">
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">ID</th>
                <th class="table-name">名称</th>
                <th class="table-main">库存</th>
                <th class="table-main">重量（KG）</th>
                <th class="table-main">原价</th>
                <th class="table-main">现价</th>
                <th class="table-main">上架状态</th>
                <th width="163px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${Users }" var="user">
              <tr>
                <td><input type="checkbox" /></td>
                <td>${user.goods_id}</td>
                <td><a href="#">${user.goods_name}</a></td>
                <td>${user.goods_number}</td>
                <td>${user.godds_weight}</td>
                <td>${user.original_price}</td>
                <td>${user.shop_price}</td>
                <td>
                   <c:if test="${user.is_shelves==1}">
                      <i class="am-icon-check am-text-warning"></i>
                   </c:if>
                   <c:if test="${user.is_shelves==0}">
                      <i class="am-icon-close am-text-warning"></i>
                   </c:if>
 
                </td>
                <td><div class="am-btn-toolbar">
                  <div class="am-btn-group am-btn-group-xs">
                 
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-pencil-square-o" data-am-modal="{target: '#my-popup'}" title="修改"></a>
           
                  <a class="am-btn am-btn-default am-btn-xs am-text-success am-round am-icon-trash-o" data-am-modal="{target: '#my-popup'}" title="删除"></a>
        
                    
                  </div>
                </div></td>
              </tr>
              </c:forEach> 
            </tbody>
          </table>
          
                 <div class="am-btn-group am-btn-group-xs">
             
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 上架</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 下架</button>
              
            </div>
          
          <ul class="am-pagination am-fr">
                <li ><a id="tri" href="#">«</a></li>
                <li class="am-active"><a id="tri" href="#">1</a></li>
                <li><a id="tri" href="#">2</a></li>
                <li><a id="tri" href="#">3</a></li>
                <li><a id="tri" href="#">4</a></li>
                <li><a id="tri" href="#">5</a></li>
                <li><a id="tri" href="#">»</a></li>
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
<script src="assets/js/amazeui.min.js"></script>
<script type="text/javascript">  
  
 $(document).ready(function() {  
    $("ul.am-pagination li").click(function() {  
        $("ul.am-pagination li").removeClass("am-active"); //Remove any "active" class  
        $(this).addClass("am-active"); //Add "active" class to selected tab  
        $("#tri").tri("click");
        return false;  
    });  
  
});   
</script>   
<!--<![endif]-->



</body>
</html>