package com.gzyz.service.login.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.login.LoginOfManager;
import com.gzyz.mapper.login.HtLoginMapper;
import com.gzyz.service.login.service.HtLoginService;


@Service
public class HtLoginServiceImpl implements HtLoginService{
	@Autowired
	private HtLoginMapper htLoginMapper;

	@Override
	public int checkLogin(LoginOfManager loginOfManager) {
		// TODO Auto-generated method stub
		return htLoginMapper.checkLogin(loginOfManager);
	}
}
