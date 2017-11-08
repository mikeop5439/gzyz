package com.gzyz.controller.users;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.jms.Session;
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

import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.extend.UserCart;
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
			session.setAttribute("page", 0);
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
	
}
