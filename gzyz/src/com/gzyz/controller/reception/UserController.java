package com.gzyz.controller.reception;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.service.reception.UserLoginService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserLoginService userLoginService; 
	
	@RequestMapping("checkUsername")
	public @ResponseBody int checkUsername(String user_name) {
		int value = -1;
		String param = user_name; 
		System.out.println(param);
		value = userLoginService.countUsername(param);
		System.out.println(value);
		return value;
	}
}
