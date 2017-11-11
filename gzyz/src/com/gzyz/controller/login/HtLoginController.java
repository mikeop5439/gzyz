package com.gzyz.controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzyz.bean.goods.Category;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.login.LoginOfManager;
import com.gzyz.service.login.service.HtLoginService;

@Controller
@RequestMapping("htlogin")
public class HtLoginController {
	@Autowired
	private HtLoginService htLoginService;
	//登录验证
	@RequestMapping("checkLogin.action")
	public String checkLogin(Model model,LoginOfManager loginOfManager,HttpSession session,HttpServletResponse response) throws IOException{
		System.out.println("aaaaaaaaaaaaaa"+htLoginService.checkLogin(loginOfManager));
		if(htLoginService.checkLogin(loginOfManager)==1){
			session.setAttribute("username", loginOfManager.getManger_name());
		}else {
			    PrintWriter out = response.getWriter();
	            out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
	            out.println("<HTML>");
	            out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
	            out.println("  <BODY>");
	            out.println("<script>alert('用户名或密码错误');window.location.href='login.jsp'</script>");
	            out.println("  </BODY>");
	            out.println("</HTML>");
	            out.flush();
	            out.close();
	            
	            return "forward:index.jsp";
		}
		return "forward:http://localhost:8888/gzyz/";
	}
}
