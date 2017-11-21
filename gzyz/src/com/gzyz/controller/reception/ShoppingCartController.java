package com.gzyz.controller.reception;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzyz.bean.address.ProvinceCityUseQuery;
import com.gzyz.bean.address.Provinces;
import com.gzyz.bean.address.ProvincesCities;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.collect_goods;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.service.reception.service.ShoopingCartService;

@Controller
@RequestMapping("shoppingcart")
public class ShoppingCartController {
	@Autowired
	private ShoopingCartService shoopingCartService;
	
	@RequestMapping("queryShoopingCart")
	public String queryShoopingCart(int user_id,Model model){
		//查询购物车
		List<UserCart> userCarts=shoopingCartService.queryShoopingcart(user_id);
		model.addAttribute("userCarts",userCarts);
		
		return "/JSP/RP/shoopingcart.jsp";
	}
	
	@RequestMapping("changenumber")
	public String changenumber(int number,int id,HttpSession session,HttpServletResponse response) throws Exception{
		//更新购物车商品数量
		User user=(User) session.getAttribute("user");
		if(user !=null){
			Cartextend cartextend=new Cartextend();
			cartextend.setGoods_id(id);
			cartextend.setGoods_number(number);
			cartextend.setUser_id(user.getUser_id());
			shoopingCartService.changecartnumber(cartextend);
		}
		response.getWriter().print(true);
		return null;
	}
	
	@RequestMapping("deletecartByidone")
	public String deletecartByidone(int goods_id,HttpSession session){
		//删除购物车商品
		User user=(User) session.getAttribute("user");
		if(user !=null){
			Cartextend cartextend=new Cartextend();
			cartextend.setUser_id(user.getUser_id());
			cartextend.setGoods_id(goods_id);
			shoopingCartService.deletecartByidone(cartextend);
		}
		
		
		return "forward:/shoppingcart/queryShoopingCart.action?user_id="+user.getUser_id();
	}
	
	@RequestMapping("addcartorder_details")
	public String addcartorder_details(HttpServletRequest request,HttpSession session){
		//购物车提交上来的订单
		String[] stringoods_id=request.getParameterValues("goods_id");
		String total=request.getParameter("total");
		
		//User user=(User) session.getAttribute("user");
		/*设置一个临时的user*/User user=new User();user.setUser_id(1);
		List<Order_details> order_details=new ArrayList<>();
		for(int i=0;i<stringoods_id.length;i++){
			/*Order order=new Order();
			Order_details order_details=new Order_details();
			order.setUser_id(user.getUser_id());
			order.setReceiver_id(user.getReceiver_id());
			order.setOrder_time(new Date());
			order.setOrder_status(0);
			order.setGoods_id(Integer.parseInt(s));*/
			//将部分信息存入订单表中
			/*shoopingCartService.insertOrder(order);*/
			//通过商品ID和用户ID,查询出订单ID
			/*int order_id=shoopingCartService.queryOrderid(order);
			order_details.setOrder_id(order_id);*/
			Order_details details=new Order_details();
			details.setGoods_id(Integer.parseInt(stringoods_id[i]));
			//查询商品的单价和数量
			Cartextend cartextend=new Cartextend();
			cartextend.setGoods_id(Integer.parseInt(stringoods_id[i]));
			cartextend.setUser_id(user.getUser_id());
			Cartextend cart=shoopingCartService.querycartNP(cartextend);
			
			details.setQuantity(cart.getGoods_number());
			details.setShop_price(cart.getGoods_price());
			
			//查询商品的商品名
			Goods goods =shoopingCartService.querygoods(Integer.parseInt(stringoods_id[i]));
			
			details.setGoods_name(goods.getGoods_name());
			details.setTotal_fee(cart.getGoods_number()*cart.getGoods_price());
			details.setOriginal_img(goods.getOriginal_img());
			
			order_details.add(details);
		}
		//查询用户收货地址
		List<Receiver> receiver=shoopingCartService.selectuserreceiver(user.getUser_id());
		//查询用户默认收货地址
		User user2=shoopingCartService.queryuserservice(user.getUser_id());
		session.setAttribute("user", user2);
		
		request.setAttribute("receiver", receiver);
		request.setAttribute("order_details", order_details);
		request.setAttribute("total", Integer.parseInt(total));
		return "/JSP/RP/Order_details.jsp";
	}
	@RequestMapping("setmorenaddress")
	public String setmorenaddress(int id,HttpServletResponse response) throws Exception{
		//设置用户的默认地址
		//User user=(User) session.getAttribute("user");
		User user=new User();
		user.setUser_id(1);
		user.setReceiver_id(id);
		shoopingCartService.updatemorenaddress(user);
		//查询用户收货地址
		List<Receiver> receiver=shoopingCartService.selectuserreceiver(user.getUser_id());
		ObjectMapper mapper=new ObjectMapper();
		//响应用户地址
		String reslut=mapper.writeValueAsString(receiver);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		
		return null;
	}
	
	@RequestMapping("addcartorder")
	public String addcartorder(HttpServletRequest request,HttpSession session){
		//添加订单
		//获取收货地址ID
		String userreceiveid=request.getParameter("userreceiveid");
		/*商品ID*/
		String[] stringoods_id=request.getParameterValues("goods_id");
		/*总计格*/
		String ordertotal=request.getParameter("ordertotal");
		/*获取用户对象*/
		User user=(User) session.getAttribute("user");
		
		List<Order> orders=new ArrayList<>();
		List<Order_details> order_details=new ArrayList<>();
		for(int i=0;i<stringoods_id.length;i++){
			//创建订单对象
			Order order=new Order();
			//创建订单详情对象
			Order_details details=new Order_details();
			
			order.setUser_id(user.getUser_id());
			order.setReceiver_id(Integer.parseInt(userreceiveid));
			
			order.setOrder_time(new Date());
			order.setOrder_status(0);
			order.setGoods_id(Integer.parseInt(stringoods_id[i]));
			//将部分信息存入订单表中
			shoopingCartService.insertOrder(order);
			//通过商品ID和用户ID,查询出订单ID
			int order_id=shoopingCartService.queryOrderid(order);
			order.setOrder_id(order_id);
			details.setOrder_id(order_id);
			details.setGoods_id(Integer.parseInt(stringoods_id[i]));
			//查询商品的单价和数量
			Cartextend cartextend=new Cartextend();
			cartextend.setGoods_id(Integer.parseInt(stringoods_id[i]));
			cartextend.setUser_id(user.getUser_id());
			Cartextend cart=shoopingCartService.querycartNP(cartextend);
			
			details.setQuantity(cart.getGoods_number());
			details.setShop_price(cart.getGoods_price());
			
			//查询商品的商品名
			Goods goods =shoopingCartService.querygoods(Integer.parseInt(stringoods_id[i]));
			
			details.setGoods_name(goods.getGoods_name());
			details.setTotal_fee(cart.getGoods_number()*cart.getGoods_price());
			details.setOriginal_img(goods.getOriginal_img());
			//将订单详情存入数据库
			shoopingCartService.insertOrder_details(details);
			orders.add(order);
			order_details.add(details);
		}
	
		return null;
	}
	@RequestMapping("delectselectcart")
	public String delectselectcart(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception{
		//删除多个选择的购物车商品
		//User user=(User) session.getAttribute("user");
		String[] goods_id = request.getParameterValues("goods_id");
		String g1=goods_id[0];
		String g2=g1.substring(1,g1.length()-1);
		String g3=g2.replace("\"", "");
		/*Pattern pattern = Pattern.compile("[^0-9]");
        Matcher matcher = pattern.matcher(g2);
        String all = matcher.replaceAll("");*/
		String[] id =g3.split(",");
		cart cart=new cart();
		cart.setUser_id(1);
		for(int i=0;i<id.length;i++){
			cart.setGoods_id(Integer.parseInt(id[i]));
			shoopingCartService.delectSelectCart(cart);
		}
		response.getWriter().print(true);
		return null;
	}
	
	@RequestMapping("insertcollect")
	public String insertcollect(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws Exception{
		
		//User user=(User) session.getAttribute("user");
		User user=new User();user.setUser_id(1);
		String[] goods_id = request.getParameterValues("goods_id");
		
		collect_goods collect_goods=new collect_goods();
		collect_goods.setUser_id(user.getUser_id());
		collect_goods.setAdd_time(new Date());
		//选择多个商品添加收藏夹
		if(goods_id != null && goods_id.length != 0){
			String g1=goods_id[0];
			String g2=g1.substring(1,g1.length()-1);
			String g3=g2.replace("\"", "");
			String[] id =g3.split(",");
			
			for(int i=0;i<id.length;i++){
				List<Integer> collect_goods_id=shoopingCartService.querycollectgoodsid(user.getUser_id());
				if(collect_goods_id.indexOf(Integer.parseInt(id[i]))>= 0){
					}else{
						collect_goods.setGoods_id(Integer.parseInt(id[i]));
						//添加收藏夹
						shoopingCartService.insertcollect(collect_goods);
					}
				
			}
		}	
		//选择单个商品添加收藏夹
		String collectgoodsidString=request.getParameter("collectgoodsidString");
		if(collectgoodsidString !=null && collectgoodsidString != ""){
			List<Integer> collect_goods_id=shoopingCartService.querycollectgoodsid(user.getUser_id());
			if(collect_goods_id.indexOf(Integer.parseInt(collectgoodsidString)) >= 0){}
			else {
				collect_goods.setGoods_id(Integer.parseInt(collectgoodsidString));
				//添加收藏夹
				shoopingCartService.insertcollect(collect_goods);
			}
		}
		response.getWriter().print(true);
		return null;
	}
	@RequestMapping("addnewaddress")
	public String addnewaddress(HttpServletResponse response) throws Exception{
		//查询省市
		List<Provinces> provinces= shoopingCartService.queryprovinces();
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(provinces);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	
	@RequestMapping("addnewaddress_city")
	public String addnewaddress_city(String province,HttpServletResponse response) throws Exception{
		//查询城市
		List<ProvincesCities> provinces= shoopingCartService.querycities(province);
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(provinces);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	@RequestMapping("addnewaddress_areas")
	public String addnewaddress_areas(String province,String city,HttpServletResponse response) throws Exception{
		//查询城市
		ProvinceCityUseQuery p=new ProvinceCityUseQuery();
		p.setCity(city);
		p.setProvince(province);
		List<ProvincesCities> provinces= shoopingCartService.queryareas(p);
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(provinces);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	@RequestMapping("updateaddress")
	public String updateaddress(Receiver receiver,HttpSession session,HttpServletResponse response) throws IOException{
		//修改收货地址
		//User user=session.getAttribute("user");
		receiver.setUser_id(1);
		shoopingCartService.updateaddress(receiver);
		
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString("true");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	@RequestMapping("add_ads_newaddres")
	public String add_ads_newaddres(Receiver receiver,HttpSession session,HttpServletResponse response) throws IOException{
		//增加新的收货地址
		//User user=session.getAttribute("user");
		receiver.setUser_id(1);
	 if(receiver.getReceiver_name() !=null && receiver.getReceiver_address() != null && receiver.getReceiver_state() != null){
		shoopingCartService.insertaddress(receiver);
		List<Receiver> address=shoopingCartService.selectuserreceiver(1);
		int max=0;
		for(Receiver a:address){
			if(max<a.getReceiver_id()){
				max=a.getReceiver_id();
			}
		}
		Receiver receiver2=shoopingCartService.selectaddressByid(max);
		ObjectMapper mapper=new ObjectMapper();
		String reslut=mapper.writeValueAsString(receiver2);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
	 }
		return null;
	}
	
	
	@RequestMapping("queryaddress")
	public String queryaddress(HttpServletResponse response,HttpSession session) throws Exception{
		//查询用户收货地址
		//备用 User user=(User) session.getAttribute("user");
		List<Receiver> receiver=shoopingCartService.selectuserreceiver(1);
		ObjectMapper mapper=new ObjectMapper();
		//响应用户地址
		String reslut=mapper.writeValueAsString(receiver);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/Javascript;charse=UTF-8");
		response.getWriter().print(reslut);
		return null;
	}
	
	
	
}
