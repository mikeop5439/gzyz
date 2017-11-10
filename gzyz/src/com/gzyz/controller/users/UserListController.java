package com.gzyz.controller.users;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzyz.bean.goods.extend.GoodsCollect;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.bean.users.extend.UserCollect;
import com.gzyz.bean.users.extend.UserReceiver;
import com.gzyz.bean.users.extend.Userdate;
import com.gzyz.service.users.service.UserListService;

@Controller
@RequestMapping("userlist")
public class UserListController {
	@Autowired
	private UserListService userListService;
	
	//查询用户
	@RequestMapping("queryuserList")
	public String queryuserList(HttpServletRequest request){
		
		List<Userdate> users=userListService.queryAllUser(0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(Userdate u:users){
			u.setUser_birthday_string(sdf.format(u.getUser_birthday()));
			u.setUser_register_string(sdf.format(u.getUser_register()));
			u.setUser_update_string(sdf.format(u.getUser_update()));
		}
		request.setAttribute("users", users);
		return "/JSP/HT/users/The_users_list.jsp";
	}
	
	//分页查询用户
	@RequestMapping("queruserlistpage")
	public String queruserlistpage(int page,HttpSession session,HttpServletResponse response) throws Exception{
			
			List<String> html=userListService.tongyong(page);
			
			ObjectMapper mapper=new ObjectMapper();
			String result=mapper.writeValueAsString(html);
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charse=UTF-8");
			response.getWriter().print(result);
		
		return null;
	}
	
	//输入叶数查询
	@RequestMapping("querypagelist")
	public String querypagelist(int page,HttpServletResponse response) throws Exception{
		
			List<String> html=userListService.tongyong(page);
			
			ObjectMapper mapper=new ObjectMapper();
			String result=mapper.writeValueAsString(html);
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charse=UTF-8");
			response.getWriter().print(result);
		
		return null;
	}
	//模糊搜索用户
	@RequestMapping("sogouser")
	public String sogouser(String page,HttpServletResponse response) throws Exception{
		
		List<String> html=userListService.queryUserToMh(page);
		
		ObjectMapper mapper=new ObjectMapper();
		String result=mapper.writeValueAsString(html);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charse=UTF-8");
		response.getWriter().print(result);
	return null;
	}
	
	
		
		//查询购物车
		@RequestMapping("querycartList")
		public String querycartList(HttpServletRequest request,HttpSession session){
			
			List<UserCart>userscart=userListService.queryuser(0);
			session.setAttribute("page", 1);
			request.setAttribute("userscart", userscart);
			return "/JSP/HT/users/The_cart_list.jsp";
		}
		
		//分页查询用户购物车
		@RequestMapping("querycartListpage")
		public String querycartListpage(int page,int shang,int xia,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
			int userListnumber=userListService.countusercart();
			double number=Math.ceil(userListnumber/16.0);	
			int p1=(int)session.getAttribute("page") ;
			String result=null;
			if(xia == 9 && p1<= number){
					int p=(int)session.getAttribute("page");
					page=p+1;
				}else{
					int p2=(int)session.getAttribute("page");
					if(shang == 8 && p2 > 0){
						page=p2-1;
					}
				}
				if(page != 99999999 && page > number){
					page=(int) number;
					}
				
				if(page <= number){
				List<UserCart> userscart=userListService.carttongyong(page);
				
				/*ObjectMapper mapper=new ObjectMapper();
				String result=mapper.writeValueAsString(usercart);
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/JavaScript;charse=UTF-8");
				response.getWriter().print(result);*/
				
				if(userscart != null){
					request.setAttribute("userscart", userscart);
					int p=(int)session.getAttribute("page") ;
					if(p<=0){page=1;}
					session.setAttribute("page", page);
					result= "/JSP/HT/users/The_cart_list.jsp";
				}else{
					result="forward:/userlist/querycartList.action";
					}
			}else{
				result="forward:/userlist/querycartList.action";
				}
				return result;
		}
		
		//搜索查询购物车
		@RequestMapping("sogocart")
		public String sogocart(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
			String result=null;
			List<UserCart> userscart=userListService.queryCartToMh(sogo);
			if(userscart != null){
				request.setAttribute("userscart", userscart);
				result= "/JSP/HT/users/The_cart_list.jsp";
			}else {
				int p=(int)session.getAttribute("page") ;
				result="forward:/userlist/querycartListpage.action?page="+p+"&xia=1&shang=1";
			}
			
		return result;
		}
	
		//查询收藏夹
		@RequestMapping("querycollectList")
		public String querycollectList(HttpServletRequest request,HttpSession session){
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			List<UserCollect> collects=userListService.queryCollect(1);
			for(UserCollect u:collects){
				for(GoodsCollect g:u.getGoodsCollect()){
					if(g.getOriginal_img() != null && g.getOriginal_img().length() > 36){
						String imgString=g.getOriginal_img().substring(36);
						g.setOriginal_img(imgString);
						}
					g.setAddtime((sdf.format(g.getCollect_goods().getAdd_time())));
				}
			}
			session.setAttribute("pages", 1);
			request.setAttribute("collects", collects);
			return "/JSP/HT/users/The_collect_list.jsp";
		}
		
		//分页查询收藏夹
		@RequestMapping("quercollectlistpage")
		public String quercollectlistpage(int page,int shang,int xia,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
				
			int userListnumber=userListService.countcollect();//查询有多少条数据
			double number=Math.ceil(userListnumber/16.0);	
			int p1=(int)session.getAttribute("pages") ;
			String result=null;
			if(xia == 9 && p1<= number){
					int p=(int)session.getAttribute("pages");
					page=p+1;
				}else{
					int p2=(int)session.getAttribute("pages");
					if(shang == 8 && p2 > 0){
						page=p2-1;
					}
				}
				if(page != 99999999 && page > number){
					page=(int) number;
					}
				
				if(page <= number){
				if(page<=0){page=1;}
				List<UserCollect> collects=userListService.queryCollect(page);
				
				if(collects != null){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for(UserCollect u:collects){
						for(GoodsCollect g:u.getGoodsCollect()){
							if(g.getOriginal_img() != null && g.getOriginal_img().length() > 36){
							String imgString=g.getOriginal_img().substring(36);
							g.setOriginal_img(imgString);
							}
							g.setAddtime((sdf.format(g.getCollect_goods().getAdd_time())));
						}
					}
					
					request.setAttribute("collects", collects);
					
					
					session.setAttribute("pages", page);
					result= "/JSP/HT/users/The_collect_list.jsp";
				}else{
					result="forward:/userlist/querycollectList.action";
					}
			}else{
				result="forward:/userlist/querycollectList.action";
				}
		return result;
		}
		//搜索查询收藏夹
		@RequestMapping("sogocollect")
		public String sogocollect(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
				String result=null;
				List<UserCollect> collects=userListService.queryCollectToMh(sogo);
				if(collects != null){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for(UserCollect u:collects){
						for(GoodsCollect g:u.getGoodsCollect()){
							if(g.getOriginal_img() != null && g.getOriginal_img().length() > 36){
							String imgString=g.getOriginal_img().substring(36);
							g.setOriginal_img(imgString);
							}
							g.setAddtime((sdf.format(g.getCollect_goods().getAdd_time())));
						}
					}
						request.setAttribute("collects", collects);
						result= "/JSP/HT/users/The_collect_list.jsp";
					}else {
						int p=(int)session.getAttribute("page") ;
						result="forward:/userlist/querycartListpage.action?page="+p+"&xia=1&shang=1";
					}
					
				return result;
				}
		
		
		//查询收收货地址
		@RequestMapping("queryreceiverList")
		public String queryreceiverList(HttpServletRequest request,HttpSession session){
					
					List<UserReceiver> receivers=userListService.queryreceiver(1);
					
					session.setAttribute("pagess", 1);
					request.setAttribute("receivers", receivers);
					return "/JSP/HT/users/The_receiver_list.jsp";
				}
				
		//分页查询收货地址
		@RequestMapping("queryreceiverlistpage")
		public String queryreceiverlistpage(int page,int shang,int xia,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
						
					int userListnumber=userListService.countreceicer();//查询有多少条数据
					double number=Math.ceil(userListnumber/16.0);	
					int p1=(int)session.getAttribute("pagess") ;
					String result=null;
					if(xia == 9 && p1<= number){
							int p=(int)session.getAttribute("pagess");
							page=p+1;
						}else{
							int p2=(int)session.getAttribute("pagess");
							if(shang == 8 && p2 > 0){
								page=p2-1;
							}
						}
						if(page != 99999999 && page > number){
							page=(int) number;
							}
						
						if(page <= number){
						if(page<=0){page=1;}
						List<UserReceiver> receivers=userListService.queryreceiver(page);
						
						if(receivers != null){
							request.setAttribute("receivers", receivers);
							session.setAttribute("pagess", page);
							result= "/JSP/HT/users/The_receiver_list.jsp";
						}else{
							result="forward:/userlist/queryreceiverList.action";
							}
					}else{
						result="forward:/userlist/queryreceiverList.action";
						}
				return result;
				}
				//搜索查询收藏夹
				@RequestMapping("sogoreceiver")
				public String sogoreceiver(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
						String result=null;
						List<UserReceiver> receivers=userListService.queryReceiversToMh(sogo);
						if(receivers != null){
								request.setAttribute("receivers", receivers);
								result= "/JSP/HT/users/The_receiver_list.jsp";
							}else {
								int p=(int)session.getAttribute("page") ;
								result="forward:/userlist/queryreceiverlistpage.action?page="+p+"&xia=1&shang=1";
							}
							
						return result;
						}
				//搜索查询收藏夹BY用户ID/name
				@RequestMapping("sogoreceiverByid")
				public String sogoreceiverByid(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
						String result=null;
						List<UserReceiver> receivers=userListService.queryReceiversByid(sogo);
						if(receivers != null){
								request.setAttribute("receivers", receivers);
								result= "/JSP/HT/users/The_receiver_list.jsp";
							}else {
								int p=(int)session.getAttribute("page") ;
								result="forward:/userlist/queryreceiverlistpage.action?page="+p+"&xia=1&shang=1";
							}
							
						return result;
						}	
		
		
		
}
