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
<title>管理员列表</title>
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
window.onload =function setSpage(){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:qureyLogLimt(1)'>«</a></li>");
     $("#pageUl").append("<li class='am-active'><a href='javascript:qureyLogLimt(1)'>1</a></li>");
      for(i;i<=${AllPage};i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:qureyLogLimt("+i+")'>"+i+"</a></li>");
     } 
     $("#pageUl").append("<li><a onclick='javascript:qureyLogLimt("+${AllPage}+")'>»</a></li>");
     };
     function setpagedate(allpage,nowpage){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:aqureyLogAndDateLimit(1)'>«</a></li>");
     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:aqureyLogAndDateLimit(1)'>1</a></li>");
     for(i;i<=allpage;i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:aqureyLogAndDateLimit("+i+")'>"+i+"</a></li>");
     }
     $("#pageUl").append("<li><a onclick='javascript:aqureyLogAndDateLimit("+allpage+")'>»</a></li>");
     page_id="AllPage"+nowpage;
     var id="#"+page_id;
     $("ul.am-pagination li").removeClass("am-active");
     $(id).addClass("am-active");
     //$(id).tri("click");
     };
     function setpage(allpage,nowpage){
     var i=2;
     var page_id="AllPage"+1;
     $("#pageUl").empty();
     $("#pageUl").append("<li><a href='javascript:qureyLogLimt(1)'>«</a></li>");
     $("#pageUl").append("<li id='"+page_id+"' class='am-active'><a href='javascript:qureyLogLimt(1)'>1</a></li>");
     for(i;i<=allpage;i++){
      page_id="AllPage";
      page_id=page_id+i;
      $("#pageUl").append("<li id='"+page_id+"'><a href='javascript:qureyLogLimt("+i+")'>"+i+"</a></li>");
     }
     $("#pageUl").append("<li><a onclick='javascript:qureyLogLimt("+allpage+")'>»</a></li>");
     page_id="AllPage"+nowpage;
     var id="#"+page_id;
     $("ul.am-pagination li").removeClass("am-active");
     $(id).addClass("am-active");
     //$(id).tri("click");
     };
     function aqureyLogAndDateLimit(nowpage){
        
        var startdate=$("#startdate").val();
        var enddate=$("#enddate").val();
  		var params = '{"startdate":"'+startdate+'","enddate":"'+enddate+'"}';
  		$.ajax({
  			
  			url:"${pageContext.request.contextPath }/manager/squeryAllLogLimitDate.action?nowpage="+nowpage,
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
  			setpagedate(data.allpage,nowpage);
  			  $("#logsTable").empty();

			  $.each(data.manager_logs,function(index,content){
			  console.log(content.log_time);
			  var date = "/Date("+content.log_time+")/";
			  var td1=$("<td></td>").append(content.manager_log_id);
			  var td2=$("<td></td>").append(content.manager_id);
			  var td3=$("<td></td>").append(content.log_origin);
			  var td4=$("<td></td>").append(content.log_method);
			  var td5=$("<td></td>").append(getDateTime(ConvertJSONDateToJSDate(date)));
			  var d1=$("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append($("<button></button>").addClass("am-btn am-btn-danger am-round am-btn-xl am-icon-trash-o").attr("type","button").attr("style","width:200px;").attr("data-am-modal","{target: '#my-confirm'}").attr("onclick","javascript:deleteLog("+content.manager_log_id+")").append("删除日志")));
			  var td6=$("<td></td>").append(d1);
			  //var td6=$("<td></td>").append("asdasd");
 
			  $("#logsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6));

			 });
  			}
  			
  		});
  	};
      function qureyLogLimt(nowpage){
      $("#logsTable").empty();
    $.ajax({  
           type:"POST",  
           url:"${pageContext.request.contextPath }/manager/aqueryLogLimit.action?nowpage="+nowpage, 
	       contentType:'application/json;charset=utf-8',
		   success:function(data){
		   setpage(data.allpage,nowpage);
		   //异步添加商品入表格中
			  $.each(data.manager_log,function(index,content){
			  var date = "/Date("+content.log_time+")/";
			  var td1=$("<td></td>").append(content.manager_log_id);
			  var td2=$("<td></td>").append(content.manager_id);
			  var td3=$("<td></td>").append(content.log_origin);
			  var td4=$("<td></td>").append(content.log_method);
			  var td5=$("<td></td>").append(getDateTime(ConvertJSONDateToJSDate(date)));
			  var d1=$("<div></div>").addClass("am-btn-toolbar").append($("<div></div>").addClass("am-btn-group am-btn-group-xs").append($("<button></button>").addClass("am-btn am-btn-danger am-round am-btn-xl am-icon-trash-o").attr("type","button").attr("style","width:200px;").attr("data-am-modal","{target: '#my-confirm'}").attr("onclick","javascript:deleteLog("+content.manager_log_id+")").append("删除日志")));
			  var td6=$("<td></td>").append(d1);
			  //var td6=$("<td></td>").append("asdasd");
 
			  $("#logsTable").append($("<tr></tr>").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6));

			 });
		  } 
		  	   
       }); 
     };
     function deleteLog(id){
     //var goods_id = id;
     var url="deleteLog.action?manager_log_id="+id;
     $("#deletegood").attr("href",url); 
     
     };
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
 	
 	 
 	<a href="#" rel="drevil">您好，
     
     <c:if test="${managerRole==0}">
     您当前无权限
	 </c:if>
	 <c:if test="${managerRole==1}">
     客服（编辑）
	 </c:if>
     <c:if test="${managerRole==2}">
     商品管理员
	 </c:if>
	 <c:if test="${managerRole==3}">
  CEO管理员
	 </c:if>
	 <c:if test="${managerRole==4}">
    超级管理员
	 </c:if>
     </a> 
 	
 	 <a href="${pageContext.request.contextPath }/htlogin/quitLogin.action">退出</a>
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
      <div id="goods-h"><h3 class="am-icon-flag"><em></em> 商品管理</h3></div>
      <ul id="goods-ul">
        <li><a href="${pageContext.request.contextPath }/good/squreyGoodsLimit.action?nowpage=1">商品列表</a></li>
        <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/addgoods.jsp">添加新商品</a></li>
		  <li><a href="${pageContext.request.contextPath}/JSP/HT/goods/goodscategory.jsp">商品分类</a></li>
        <li>商品回收站</li>
        <li><a href="${pageContext.request.contextPath }/comment/commentlist.action">商品评论列表</a></li>
      </ul>
      <div id="orders-h"><h3 class="am-icon-cart-plus"><em></em> <a href="#"> 订单管理</a></h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/order/orderlist.action">订单列表</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/orders/order_query.jsp">订单查询</a></li>
		<li>订单打印</li>
        <li><a href="${pageContext.request.contextPath }/orderiands/squeryAllInvoiceLimit.action?nowpage=1">退换货单列表</a></li>
      </ul>
      <div id="analysis-h"><h3 class="am-icon-bar-chart"><em></em> <a href="#">数据统计</a></h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/data_traffic.jsp">流量分析（访问量）</a> </li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/costomer_analysis.jsp">客户统计 </a> </li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/sales_about.jsp">销售概况 </a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/top_consumption.jsp">会员排行 </a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/top_goods.jsp">销售排行 </a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/analysis/buy_analysis.jsp">访问购买率 </a></li>
      </ul>
      <div id="users-h"><h3 id="user-ul" class="am-icon-user"><em></em> 用户管理</h3></div>
       <ul>
        <li><a href="${pageContext.request.contextPath }/userlist/queryuserList.action">用户列表</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycartList.action">用户购物车</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/querycollectList.action">用户收藏夹</a></li>
		<li><a href="${pageContext.request.contextPath }/userlist/queryreceiverList.action">用户收货地址</a></li>
		</ul>
      <div id="manager-h"><h3 class="am-icon-lock"><em></em> 权限管理</h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/manager/queryAllManager.action">管理员列表</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/squeryLogLimit.action?nowpage=1">管理员日志</a></li>
        <li><a href="${pageContext.request.contextPath }/manager/queryManagerAndRole.action">角色管理</a></li>
      </ul>
      <div id="system-h"><h3 class="am-icon-gears"><em></em> <a href="#">系统设置</a></h3></div>
      <ul>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemdata.jsp">数据备份</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systempay.jsp">支付方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemsend.jsp">配送方式</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemlinks.jsp">友情链接</a></li>
        <li><a href="${pageContext.request.contextPath }/JSP/HT/system/systemessay.jsp">文章列表</a></li>
     
      </ul>
     
     <div id="jf-h"><h3 class="am-icon-dollar" id="jf-ul"><em></em> <a href="#">促销管理</a></h3></div>
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
				<li><button type="button" class="am-btn am-btn-default am-radius am-btn-xs" onclick="location.href=('${pageContext.request.contextPath }')"> 首页 </li>
			</ul>

       

	
</div>
    
			
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">你好</div>
    <div class="am-modal-bd">
      你，确定要删除此日志吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel><a>取消</a></span>
      <a id="deletegood" href="">确定</a>
    </div>
  </div>
</div>
									
																		


<div class="admin-biaogelist">
	
    <div class="listbiaoti am-cf">
      <ul class="am-icon-lock"> 管理员日志</ul>
      
      <dl class="am-icon-lock" style="float: right;"> 当前位置： 角色管理 > <a href="${pageContext.request.contextPath }">首页</a></dl>
      
       <dl>
         
        </dl>
      
    </div>
	
<div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
  <ul>
    <li style="margin-right: 0;">
    	<span class="tubiao am-icon-calendar"></span>
      <input id="startdate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="开始日期" data-am-datepicker="{theme: 'success',}" name="startdate" readonly/>
    </li>
       <li style="margin-left: -4px;">
    	<span class="tubiao am-icon-calendar"></span>
      <input id="enddate" type="text" class="am-form-field am-input-sm am-input-zm  am-icon-calendar" placeholder="结束日期" data-am-datepicker="{theme: 'success',}" name="enddate" readonly/>
    </li>

    <li><button type="button" class="am-btn am-radius am-btn-xs am-btn-success" onclick="javascript:aqureyLogAndDateLimit(1);" style="margin-top: 1px;">搜索</button></li>
  </ul>
</div>


    <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
            <thead >
              <tr class="am-success">
                <th class="table-id">日志ID</th>
                <th class="table-name" >操作者ID</th>
                <th class="table-main">日志源地点</th>
                <th class="table-main">行为</th>
                <th  class="table-main">日期</th>
                <th  class="table-main">操作</th>
              </tr>
            </thead>
            <tbody id="logsTable">
             <c:forEach items="${Logs}" var="log">
              <tr>
                <td>${log.manager_log_id}</td>
                <td>${log.manager_id}</td>
                <td>${log.log_origin}</td>
                <td>${log.log_method}</td>
                <td>${log.log_time}</td>
                <td><div class="am-btn-toolbar">
                 <div class="am-btn-group am-btn-group-xs"  >
                 <button type="button" style="width:200px;"  class="am-btn am-btn-danger am-round am-btn-xl am-icon-trash-o" data-am-modal="{target: '#my-confirm'}" onclick="javascript:deleteLog(${log.manager_log_id})">&nbsp删除日志</button> 
                  </div>
                </div></td>
              </tr>
              </c:forEach> 
            </tbody>
          </table>
          
          <ul id="pageUl" class="am-pagination am-fr">
                <li><a href="">«</a></li>
                <li class="am-active"><a href="#" onclick="javascript:qureyAllGoodLimt(1)">1</a></li>
                <li><a id="tri" href="#" onclick="javascript:qureyAllGoodLimt(2)">2</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(3)">3</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(4)">4</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(5)">5</a></li>
                <li><a id="tri" onclick="javascript:qureyAllGoodLimt(6)">»</a></li>
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
<!--<![endif]-->



</body>
</html>