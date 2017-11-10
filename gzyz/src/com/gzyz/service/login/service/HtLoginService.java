package com.gzyz.service.login.service;

import com.gzyz.bean.login.LoginOfManager;

public interface HtLoginService {
	//后台登录验证
		public int checkLogin(LoginOfManager loginOfManager);
}
