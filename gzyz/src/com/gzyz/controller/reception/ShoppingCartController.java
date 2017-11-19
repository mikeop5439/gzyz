package com.gzyz.controller.reception;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.service.reception.service.ShoopingCartService;
import com.sun.mail.iap.Response;

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
			SimpleDateFormat myFmt2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
	
	
}
