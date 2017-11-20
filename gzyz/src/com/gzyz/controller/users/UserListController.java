package com.gzyz.controller.users;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzyz.bean.goods.extend.GoodsCollect;
import com.gzyz.bean.users.User;
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
		System.out.println(users);
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
			/*for(UserCart u:userscart){
				for(Cartextend g:u.getCartextend() ){
					if(g.getGoods().getOriginal_img() != null && g.getGoods().getOriginal_img().length() > 36){
						String imgString=g.getGoods().getOriginal_img().substring(36);
						g.getGoods().setOriginal_img(g.getGoods().getOriginal_img());
						}
				}
			}*/
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
					/*for(UserCart u:userscart){
						for(Cartextend g:u.getCartextend() ){
							if(g.getGoods().getOriginal_img() != null && g.getGoods().getOriginal_img().length() > 36){
								String imgString=g.getGoods().getOriginal_img().substring(36);
								
								g.getGoods().setOriginal_img(imgString);
								}
						}
					}*/
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
		
		//搜索查询购物车BYID
		@RequestMapping("sogocartByid")
		public String sogocartByid(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
			String result=null;
			List<UserCart> userscart=userListService.queryCartToMh(sogo);
			if(userscart != null && userscart.size() > 0){
				/*for(UserCart u:userscart){
					for(Cartextend g:u.getCartextend() ){
						if(g.getGoods().getOriginal_img() != null && g.getGoods().getOriginal_img().length() > 36){
							String imgString=g.getGoods().getOriginal_img().substring(36);
							g.getGoods().setOriginal_img(imgString);
							}
					}
				}*/
				request.setAttribute("userscart", userscart);
				result= "/JSP/HT/users/The_cart_list.jsp";
			}else {
				int p=(int)session.getAttribute("page") ;
				result="forward:/userlist/querycartListpage.action?page="+p+"&xia=1&shang=1";
			}
			
		return result;
		}
		//搜索查询购物车BY货号
		@RequestMapping("sogocartBysn")
		public String sogocartBysn(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
					String result=null;
					List<UserCart> userscart=userListService.queryCartSn(sogo);
					if(userscart != null && userscart.size() > 0){
						/*for(UserCart u:userscart){
							for(Cartextend g:u.getCartextend() ){
								if(g.getGoods().getOriginal_img() != null && g.getGoods().getOriginal_img().length() > 36){
									String imgString=g.getGoods().getOriginal_img().substring(36);
									g.getGoods().setOriginal_img(imgString);
									}
							}
						}*/
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
					/*if(g.getOriginal_img() != null && g.getOriginal_img().length() > 36){
						String imgString=g.getOriginal_img().substring(36);
						g.setOriginal_img(imgString);
						}*/
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
							/*if(g.getOriginal_img() != null && g.getOriginal_img().length() > 36){
							String imgString=g.getOriginal_img().substring(36);
							g.setOriginal_img(imgString);
							}*/
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
				if(collects != null && collects.size() > 0){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					for(UserCollect u:collects){
						for(GoodsCollect g:u.getGoodsCollect()){
							/*if(g.getOriginal_img() != null && g.getOriginal_img().length() > 36){
							String imgString=g.getOriginal_img().substring(36);
							g.setOriginal_img(imgString);
							}*/
							g.setAddtime((sdf.format(g.getCollect_goods().getAdd_time())));
						}
					}
						request.setAttribute("collects", collects);
						result= "/JSP/HT/users/The_collect_list.jsp";
					}else {
						int p=(int)session.getAttribute("pages") ;
						result="forward:/userlist/quercollectlistpage.action?page="+p+"&xia=1&shang=1";
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
				//搜索查询收货地址
				@RequestMapping("sogoreceiver")
				public String sogoreceiver(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
						String result=null;
						List<UserReceiver> receivers=userListService.queryReceiversToMh(sogo);
						if(receivers != null && receivers.size() > 0){
								request.setAttribute("receivers", receivers);
								result= "/JSP/HT/users/The_receiver_list.jsp";
							}else {
								int p=(int)session.getAttribute("pagess") ;
								result="forward:/userlist/queryreceiverlistpage.action?page="+p+"&xia=1&shang=1";
							}
							
						return result;
						}
				//搜索查询收藏夹BY用户ID/name
				@RequestMapping("sogoreceiverByid")
				public String sogoreceiverByid(String sogo,HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
						String result=null;
						List<UserReceiver> receivers=userListService.queryReceiversByid(sogo);
						if(receivers != null && receivers.size()> 0){
								request.setAttribute("receivers", receivers);
								result= "/JSP/HT/users/The_receiver_list.jsp";
							}else {
								int p=(int)session.getAttribute("pagess") ;
								result="forward:/userlist/queryreceiverlistpage.action?page="+p+"&xia=1&shang=1";
							}
							
						return result;
						}	
		//用户登录
		@RequestMapping("queryuserLogin")
		public String queryuserLogin(HttpServletRequest request,
				HttpServletResponse response,
				User user,String user_name,
				String user_password,
				String userCode
				){
			System.out.println("23");			
			
			HttpSession session = request.getSession();
			
			user_name = request.getParameter("username");
			user_password = request.getParameter("userpass");
			userCode = request.getParameter("userCode"); // 获取验证码文本
			
			String verificationCode = (String) session.getAttribute("yanzhengma_InSession");
			session.removeAttribute("yanzhengma_InSession");
			 
			if(user_name == null || user_name == ""){
				
				System.out.println("用户名为空！");
				session.setAttribute("loginError", "用户名不能为空！");
				return "redirect:/JSP/RP/login.jsp";
				
			}
			
			user.setUser_name(user_name);
			User user2 = userListService.userLogin(user);
			System.out.println("23");
			
			
			
			if(user2 == null){	
				System.out.println("用户不存在！");
				session.setAttribute("loginError", "用户名错误！");
				return "redirect:/JSP/RP/login.jsp";
				
			}else{
				if(user_password == "" || user_password == null ){ 
					System.out.println("密码为空！！");
					session.setAttribute("loginError", "密码不能为空！");
					return "redirect:/JSP/RP/login.jsp";
				}else{
					if(user2.getUser_password().equals(user_password)){
						if(userCode == null || userCode == ""){
							System.out.println("验证码为空！！"); 
							session.setAttribute("loginError", "验证码不能为空！");
							return "redirect:/JSP/RP/login.jsp";
						}else{
							if(userCode.equals(verificationCode)){
								System.out.println("登录成功！");
								session.setAttribute("loginuser", user2);
								String st2 = session.getId();
								System.out.println(st2);
								return "redirect:/JSP/RP/index.jsp";					
							}else{
								session.setAttribute("loginError", "验证码错误");
								return "redirect:/JSP/RP/login.jsp";
							}
						}
					}else{
						session.setAttribute("loginError", "密码错误！");
						return "redirect:/JSP/RP/login.jsp";
					}
				}
			}
			
		}
		
		
		//用户退出登录
		@RequestMapping("queryuserLoginExit")
		public String queryuserLoginExit(HttpSession session)throws Exception{
			System.out.println("23");	
			
			session.invalidate();
			String st1 = session.getId();
			System.out.println(st1);
			return "redirect:/JSP/RP/index.jsp";
		}
		
		
}
