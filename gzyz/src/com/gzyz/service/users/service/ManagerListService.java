package com.gzyz.service.users.service;

import java.util.List;

import com.gzyz.bean.users.manger;

public interface ManagerListService {
	//查询所有管理员
	public List<manger> queryAllManager();
	//分页查询所有管理员
	public List<manger> queryAllManagerLimit(int startindex);
	//增加管理员 
	public void insertManager(manger manger);
	//修改管理员
	public void updateManager(manger manger);
	//修改前置查询
	public manger queryBefroeUpdateManager(int manger_id);
}
