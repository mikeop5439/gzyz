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
			 return "forward:/JSP/HT/login.jsp";   
		}
		return "forward:/";
	}
}
