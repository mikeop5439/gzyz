package com.gzyz.mapper.login;

import com.gzyz.bean.login.LoginOfManager;

public interface HtLoginMapper {
	//后台登录验证
	public int checkLogin(LoginOfManager loginOfManager);
}
