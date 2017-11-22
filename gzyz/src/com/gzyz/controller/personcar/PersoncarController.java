package com.gzyz.controller.personcar;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.personcar.UserNameAndUserPassword;
import com.gzyz.bean.users.User;
import com.gzyz.service.personcar.service.PersoncarService;
import com.gzyz.service.users.service.UserListService;

@Controller
@RequestMapping("personcar")
public class PersoncarController {
	@Autowired
	private PersoncarService personcarService;
	@Autowired
	private UserListService userListService;
	
	//修改用户信息
	@RequestMapping("updateUserInfo.action")
	public String updateUserInfo(User user,MultipartFile userphoto,HttpSession session,int flage) throws IllegalStateException, IOException{
		if(flage==1){
			String path = session.getServletContext().getRealPath("/upload/usersimg");
			
			String realName="";
			
			realName = realName+user.getUser_id()+".jpg";
			
			String realFilePath = path+File.separator+realName;
			
			String saveFilePath = File.separator+"upload"+File.separator+"usersimg"+File.separator+realName;
			
			File file = new File(realFilePath);
			userphoto.transferTo(file);
			
			
			user.setUser_image(saveFilePath);;
		}
		 personcarService.updateUserInfo(user);
		 User user1=new User();
		 user1.setUser_name(user.getUser_name());;
		 session.setAttribute("loginuser", userListService.userLogin(user1));
		 return "redirect:/JSP/RP/personcar.jsp";	
	}
	//验证原密码
	@RequestMapping("queryOriginalPassword.action")
	public @ResponseBody int queryOriginalPassword(@RequestBody UserNameAndUserPassword userNameAndUserPassword){
		int flage=personcarService.queryOriginalPassword(userNameAndUserPassword);
		return flage;	
	}
	//修改密码
	@RequestMapping("updatePassword.action")
	public  String updatePassword(User user,HttpSession session){
		personcarService.updatePassword(user);
		session.removeAttribute("loginuser");
		return "redirect:/JSP/RP/personcar_success.jsp";	
	}
}
