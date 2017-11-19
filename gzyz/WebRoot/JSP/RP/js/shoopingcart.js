/*购物车*/

$(function(){//全部选择和全部取消上部
	$(":input[name='allselect1']").click(function() {
		if($(":input[name='allselect1']").prop("checked")){
			selectAll();
			$("input[id='allselect2']").each(function(){   
		        this.checked=true;  
		    });
		}else{
			selectNull();
			$("input[id='allselect2']").each(function(){   
		        this.checked=false;  
		    });
		}
	});
});

$(function(){//全部选择和全部取消下部
	$(":input[name='allselect2']").click(function() {
		if($(":input[name='allselect2']").prop("checked")){
			selectAll();
			$("input[id='allselect1']").each(function(){   
		        this.checked=true;  
		    });
		}else{
			selectNull();
			$("input[id='allselect1']").each(function(){   
		        this.checked=false;  
		    });
			
		}
	});
});


function selectAll(){  //选择所有
    $("input[id='idcheck']").each(function(){    
        this.checked=true;  
    });  
}  
function selectNull(){  //取消选择所有
    $("input[id='idcheck']").each(function(){   
        this.checked=false;  
    });  
} 
function Duototal(){//加减之后计算总价的方法1->多选
	var gid=[];
	var total=[];
	var n=0;
	$("input[id='idcheck']").each(function(){ 
		
		if($("input[id='idcheck']").prop("checked")){
			n++;
			gid.push(parseInt($(this).val()));//将选择的值存入数组gid中
			var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
			total.push(price);
		}else{
			$("input[id='allselect1']").each(function(){   
		        this.checked=false;  
		    });
			$("input[id='allselect2']").each(function(){   
		        this.checked=false;  
		    });
		}
		
    });
	goods_total(gid,total,n);
	
	
}
function Dantotal(){//加减之后计算总价的方法2->单选
	var gid=[];
	var total=[];
	var n=0;
	$("input[id='idcheck']").each(function(){ 
		
		if($(this).prop("checked")){
			n++;
			gid.push(parseInt($(this).val()));
			
			var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
			total.push(price);
		}else{
			$("input[id='allselect1']").each(function(){   
		        this.checked=false;  
		    });
			$("input[id='allselect2']").each(function(){   
		        this.checked=false;  
		    });
		}
		
    });
	goods_total(gid,total,n);
	
	
}


$(document).ready(function(){
	//加的效果
	$(".add").click(function(){
		var goodsid=$(this).attr("class");
		var ids=goodsid.substring(3,goodsid.length);
		
		var n=$(this).prev().val();
		var num=parseInt(n)+1;
		if(num==0){ return false;}
		$(this).prev().val(num);
		var id="#"+parseInt(ids);
		var y=parseInt($(id).find("#yjiage").val());
		var s=y*num;
		$(id).find("#price").val(s);
		//将商品数量存数据库
		changenumber(num,ids);
		//加减之后计算总价的方法
		if($("input[id='allselect1']").prop("checked") || $("input[id='allselect2']").prop("checked")){
			Duototal();
		}else{
			Dantotal();
		}
		
	});
	//减的效果
	$(".jian").click(function(){
		var goodsid=$(this).attr("class");
		var ids=goodsid.substring(4,goodsid.length);
		
		var n=$(this).next().val();
		var num=parseInt(n)-1;
		if(num==0){ return false;}
		$(this).next().val(num);
		
		var id="#"+parseInt(ids);
		var y=parseInt($(id).find("#yjiage").val());
		var s=y*num;
		$(id).find("#price").val(s);
		//将商品数量存数据库
		changenumber(num,ids);
		//加减之后计算总价的方法
		if($("input[id='allselect1']").prop("checked") || $("input[id='allselect2']").prop("checked")){
			Duototal();
		}else{
			Dantotal();
		}
	});
	
	
	
});

//修改购物车商品数量
function changenumber(num,ids){
	num=parseInt(num);
	ids=parseInt(ids);
	var url="shoppingcart/changenumber.action";
	var args={"number":num,"id":ids ,"time":new Date()};
	$.post(url,args,function(data){});
}
//计算总价格的方法
function goods_total(gid,total,n){
	
	$("#selectnumber").val(n);
	$("#selectnumber2").val(n);
	var goods_total=0.00;
	for(var i=0;i<total.length;i++){
		goods_total=goods_total+total[i];
	}
	$("#total").val(goods_total);
	$("#total2").val(goods_total);
}



//计算购物车的总价格
$(document).ready(function(){
	$("input[id='allselect1']").click(function() {
		var gid=[];
		var total=[];
		var n=0;
		$("input[id='idcheck']").each(function(){ 
			
			if($("input[id='idcheck']").prop("checked")){
				n++;
				gid.push(parseInt($(this).val()));//将选择的值存入数组gid中
				var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
				total.push(price);
			}else{
				$("input[id='allselect1']").each(function(){   
			        this.checked=false;  
			    });
				$("input[id='allselect2']").each(function(){   
			        this.checked=false;  
			    });
			}
			
	    });
		goods_total(gid,total,n);
	});
	
		
		
});

//计算购物车的总价格
$(document).ready(function(){
	$("input[id='allselect2']").click(function() {
		var gid=[];
		var total=[];
		var n=0;
		$("input[id='idcheck']").each(function(){ 
			
			if($("input[id='idcheck']").prop("checked")){
				n++;
				gid.push(parseInt($(this).val()));//将选择的值存入数组gid中
				var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
				total.push(price);
			}else{
				$("input[id='allselect1']").each(function(){   
			        this.checked=false;  
			    });
				$("input[id='allselect2']").each(function(){   
			        this.checked=false;  
			    });
			}
			
	    });
		goods_total(gid,total,n);
	});
	
		
		
});


//单选计算
$(document).ready(function(){
	$("input[id='idcheck']").click(function() {
		var gid=[];
		var total=[];
		var n=0;
		$("input[id='idcheck']").each(function(){ 
			
			if($(this).prop("checked")){
				n++;
				gid.push(parseInt($(this).val()));
				
				var price=parseInt($("#"+parseInt(parseInt($(this).val()))).find("#price").val());
				total.push(price);
			}else{
				$("input[id='allselect1']").each(function(){   
			        this.checked=false;  
			    });
				$("input[id='allselect2']").each(function(){   
			        this.checked=false;  
			    });
			}
			
	    });
		goods_total(gid,total,n);
	});
	
		
		
});


/*商品订单详情*/
$(document).ready(function(){
	/*$("input[id='receiverid1']").trigger("click");*/
	/*$("input[id='receiverid1']").click(function(){alert(1);*/
	
	$("input[name='receiverid']").change(function(){
		$("input[id='receiverid']").each(function(){  
			/*if($("input[id='receiverid']").prop("checked")){}else{*/
				this.checked=false;
			/*}*/
	    });
		this.checked=true;
		
		$("#orderaddress").html("");
		$("#ordername").html("");
		$("#orderphone").html("");
		receiverfunction();
	});	
	
	receiverfunction();//将地址放到页面最后的提交订单	
		
});
function receiverfunction(){
	/*alert(1);*/
	$(".receiver_top").each(function(){
		/*var i=1;*/
		if($(this).find("input[id='receiverid']").prop("checked")){
				/*i++;*/
				var receiver_id=$(this).find("input[id='receiverid']").val();
		 		var state = $(this).find("#state").html(); 
		 		var city = $(this).find("#city").html(); 
		 		var district = $(this).find("#district").html();
		 		var address = $(this).find("#address").html();
		 		var name = $(this).find("#name").html();
		 		var phone = $(this).find("#phone").html();
		 		/*设置提交的地址*/
		 		$("input[name='userreceiveid']").val(receiver_id);
		 		$("#orderaddress").append("<div>"+
		 				"<span>"+"收货地址："+"</span>"+
		 				"<span>"+state+"</span>"+
		 				"<span>"+city+"</span>"+
		 				"<span>"+district+"</span>"+
		 				"<span>"+address+"</span>"+"</div>"
		 				);
		 		$("#ordername").append("<div>"+"<span>"+"收货人："+"</span>"+"<span>"+name+"</span>"+"</div>");
		 		$("#orderphone").append("<div>"+"<span>"+"收货电话："+"</span>"+"<span>"+phone+"</span>"+"</div>");
		}else{
			/*alert("错误");*/
		}
		/*alert(i);*/
	});
}



/*--------------------->商品订单详情*/


/*设置默认地址*/
function setmorenaddress(id){
	var url="shoppingcart/setmorenaddress.action";
	var args={"id":id,"time":new Date()};
	$.getJSON(url,args,function(data){
			if(data.length !=null){
				$("#receiver").html("");
			for(var i=0;i<data.length;i++){
				var receiver_id = data[i].receiver_id;
				var state =data[i].receiver_state; 
		 		var city = data[i].receiver_city;
		 		var district = data[i].receiver_district;
		 		var address = data[i].receiver_address;
		 		var name = data[i].receiver_name;
		 		var phone = data[i].receiver_phone;
		 		
		 		
		 		if(receiver_id == id){/*默认地址*/
		 			var jqDom=$('<div class="receiver_top" ><div class="container container_top" ><div class="receiveraddress1" ><span><input id="receiverid" name="receiverid" type="radio" value="'+receiver_id+'" checked="checked" /></span><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span><span style="color:red;font-size:16px;">默认地址</span><span class="updateaddress"><a  href="javascript:void(0)" onclick="updateaddress('+receiver_id+')">修改地址</a></span></div></div></div>');
		 			jqDom.appendTo("#receiver");
				}else{
					/*普通地址*/
					var jqDom=$('<div class="receiver_top" ><div class="container container_top" ><div class="receiveraddress2" ><span><input id="receiverid" name="receiverid" type="radio" value="'+receiver_id+'" /></span><span id="state">'+state+'</span><span id="city">'+city+'</span><span id="district">'+district+'</span><span id="address">'+address+'</span><span id="name">('+name+'收)</span><span id="phone">'+phone+'</span>	<span><a  href="javascript:void(0)" onclick="setmorenaddress('+receiver_id+')">设置为默认地址</a></span>	<span class="updateaddress"><a  href="javascript:void(0)" onclick="updateaddress('+receiver_id+')">修改地址</a></span></div></div></div>');
		 			jqDom.appendTo("#receiver");
					
				}
			}
		}
			var jqDom=$('<div class="container" style="margin:30px;"><a href="insertaddress" ><div class="btn btn-warning">+添加新地址</div></a>		 	 		</div>');
			jqDom.appendTo("#receiver");
			
			//更新提交订到的地址
			$("#orderaddress").html("");
			$("#ordername").html("");
			$("#orderphone").html("");
			receiverfunction();
	});
	
}

/*$(document).ready(function(){
	$("input[id='receiverid1']").trigger("click");
	$("input[id='receiverid1']").click(function(){alert(1);
	
	$(".receiverid").change(function(){
		$("input[id='receiverid']").each(function(){  
			if($("input[id='receiverid']").prop("checked")){}else{
				this.checked=false;
			}
	    });
		this.checked=true;
		alert("oosad");
		$("#orderaddress").html("");
		$("#ordername").html("");
		$("#orderphone").html("");
		receiverfunction();
	});	
	
//将地址放到页面最后的提交订单	
		
});*/
/*--------------------->设置默认地址*/