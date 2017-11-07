package com.gzyz.service.users.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.users.manger;
import com.gzyz.mapper.users.ManagerListMapper;
import com.gzyz.service.users.service.ManagerListService;
@Service
public class ManagerListServiceImpl implements ManagerListService {
	@Autowired
	private ManagerListMapper managerListMapper;

	@Override
	public List<manger> queryAllManager() {
		// TODO Auto-generated method stub
		return managerListMapper.queryAllManager();
	}

	@Override
	public List<manger> queryAllManagerLimit(int startindex) {
		// TODO Auto-generated method stub
		return managerListMapper.queryAllManagerLimit(startindex);
	}

	@Override
	public void insertManager(manger manger) {
		// TODO Auto-generated method stub
		managerListMapper.insertManager(manger);
	}

	@Override
	public void updateManager(manger manger) {
		// TODO Auto-generated method stub
		managerListMapper.updateManager(manger);;
	}

	@Override
	public manger queryBefroeUpdateManager(int manger_id) {
		// TODO Auto-generated method stub
		manger manger=managerListMapper.queryBefroeUpdateManager(manger_id);
		return manger;
	}

}
