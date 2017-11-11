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
<title>用户列表</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />



<link rel="icon" type="${pageContext.request.contextPath }/JSP/HT/assets/i/favicon.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/JSP/HT/assets/css/admin.css">
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath }/JSP/HT/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
function getDateTime(date) {
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hh = date.getHours();
    var mm = date.getMinutes();
    var ss = date.getSeconds();
    return year + "-" + month + "-" + day + " " + hh + ":" + mm + ":" + ss;
};
function ConvertJSONDateToJSDate(jsondate) {
    var date = new Date(parseInt(jsondate.replace("/Date(", "").replace(")/", ""), 10));
    return date;
};

     function queryTheOrder(){
        
        var startdate=$("#startdate").val();
        var enddate=$("#enddate").val();
        var user_name=$("#user_name").val();
        var order_id=$("#order_id").val();
  		var params = '{"startdate":"'+startdate+'","enddate":"'+enddate+'","user_name":"'+user_name+'","order_id":"'+order_id+'"}';
  		$.ajax({
  			
  			url:"${pageContext.request.contextPath }/orderiands/queryTheOrder.action",
  			type:"POST",
  			//如果前台传递json数据，那么一定要加上这个字段。
  			contentType:'application/json;charset=utf-8',
  			//会自动把字符串数据转换为json对象数据
  			dataType:"json",
  			//data:"username=abc&age=1",
  			data:params,
  			//当服务器成功的返回数据后调用这个方法
  			//data就是服务器返回的数据，
  			success:function(data){
  			  $("#logsTable").empty();
			  $.each(data.orderAndUserAndOrderDetails,function(index,content){
			  var count=content.order_details.length;
			  var order_time = "/Date("+content.order_time+")/";
			  var pay_time = "/Date("+content.pay_time+")/";
			  
			  var td1;
			  var td2;
			  var td3;
			  var td4;
			  var td5;
			  var td6;
			  var td7;
			  var td8;
			  var td9;
			  var td10;
			  var td11;
			  var td12;
			  var td13;
			  var td14;
			      td1=$("<td></td>").attr("rowspan",""+count+"").append(content.order_id);
			      td2=$("<td></td>").attr("rowspan",""+count+"").append(content.user.user_id);
			      td3=$("<td></td>").attr("rowspan",""+count+"").append(content.user.user_name);
			      td4=$("<td></td>").attr("rowspan",""+count+"").append(getDateTime(ConvertJSONDateToJSDate(order_time)));
			      td5=$("<td></td>").attr("rowspan",""+count+"").append(content.order_status);
			      td6=$("<td></td>").attr("rowspan",""+count+"").append(getDateTime(ConvertJSONDateToJSDate(pay_time)));
			      td7=$("<td></td>").attr("rowspan",""+count+"").append(content.shipping_name);
			      td8=$("<td></td>").attr("rowspan",""+count+"").append(content.shipping_code);

			   $.each(content.order_details,function(index,content){
			      td9=$("<td></td>").append(content.order_details_id);
			      td10=$("<td></td>").append(content.goods_id);
			      td11=$("<td></td>").append(content.goods_name);
			      td12=$("<td></td>").append(content.quantity);
			      td13=$("<td></td>").append(content.shop_price);
			      td14=$("<td></td>").append(content.total_fee);
			      if(index==0){
			       $("#logsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8).append(td9).append(td10).append(td11).append(td12).append(td13).append(td14));
			      }else{
			       $("#logsTable").append($("<tr></tr>").append(td9).append(td10).append(td11).append(td12).append(td13).append(td14));
			      }
			  });
			 
			 });
  			}
  			
  		});
  	};
  	function checkUsernameAndDate(){
  	var user_name=$("#user_name").val();
  	var order_id=$("#order_id").val();
  	var startdate=$("#startdate").val();
  	var enddate=$("#enddate").val();
  	if(order_id!=""){
  	return true;
  	}else{
  	if(user_name!=""){
  	return true;
  	}else{
  	return false;
  	}
  	}
  	};
  	function check(){
  	if(checkUsernameAndDate()==false){
  	$("#btnsubmit").attr("disabled",true);
  	return false;
  	}else{
  	$("#btnsubmit").attr("disabled",false);
  	return true;
  	}
  	}
</script>
</head>


<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath }/JSP/HT/assets/i/logo.png"></div>

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
        <li><a href="Add_new_goods.html">添加新商品</a></li>
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
        <li>用户列表 </li>
        <li>用户购物车</li>
        <li>用户收藏夹</li>
       
      </ul>
      <h3 class="am-icon-lock"><em></em> 权限管理</h3>
      <ul>
        
        <li><a href="${pageContext.request.contextPath }/manager/queryAllManager.action">管理员列表</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/squeryLogLimit.action?nowpage=1">管理员日志</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/queryManagerAndRole.action">角色管理</a></li>
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
    
			
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">你好</div>
    <div class="am-modal-bd">
      你，确定要同意此请求吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel><a>取消</a></span>
      <a id="deletegood" href="">同意</a>
    </div>
  </div>
</div>
									
																		


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-lock">订单查询</ul>
      
      <dl class="am-icon-lock" style="float: right;"> 当前位置：订单查询> <a href="index.html">首页</a></dl>
      
       <dl>
         
        </dl>
      
    </div>
	
	<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <ul>
    <li>
      <input oninput="check()" id="order_id" type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: 2.5px;height: 100%;width:100% "  placeholder="通过ID查询" name="order_id"/>
    </li>
    <li >
      <input oninput="check()" id="user_name" type="text" class="am-form-field am-input-sm am-input-xm" style="margin-top: 2.5px;height: 100%;width:100% "  placeholder="通过用户名以及日期查询" name="user_name"/>
    </li>
    <li style="margin-right: 0;">
      <span class="tubiao am-icon-calendar"></span>
      <input oninput="check()" id="startdate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="开始日期" data-am-datepicker="{theme: 'success',}" name="startdate" readonly/>
    </li>
    <li style="margin-left: -4px;">
      <span class="tubiao am-icon-calendar"></span>
      <input oninput="check()" id="enddate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="结束日期" data-am-datepicker="{theme: 'success',}" name="enddate" readonly/>
    </li>
    <li>
      <button disabled="true" id="btnsubmit" type="button" class="am-btn am-radius am-btn-xs am-btn-success" onclick="javascript:queryTheOrder();" style="margin-top: 1px;">搜索</button></li>
    </ul>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-centered">
            <thead >
              <tr class="am-success">
                <th class="table-id">订单ID</th>
                <th class="table-name" >用户ID</th>
                <th class="table-main">用户名</th>
                <th class="table-main">订单时间</th>
                <th  class="table-main">订单状态</th>
                <th  class="table-main">付款时间</th>
                <th  class="table-main">快递公司</th>
                <th  class="table-main">快递单号</th>
                <th  class="table-main">详情ID</th>
                <th  class="table-main">商品ID</th>
                <th  class="table-main">商品名称</th>
                <th  class="table-main">购买数量</th>
                <th  class="table-main">商品单价</th>
                <th  class="table-main">总价格</th>
              </tr>
            </thead>
            <tbody id="logsTable">
             
            </tbody>
          </table>
          
          
          
      
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
<!--<![endif]-->



</body>
</html>