package com.gzyz.service.personcar.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.personcar.UserNameAndUserPassword;
import com.gzyz.bean.users.User;
import com.gzyz.mapper.personcar.PersoncarMapper;
import com.gzyz.service.personcar.service.PersoncarService;
@Service
public class PersoncarServiceImpl implements PersoncarService {
	@Autowired
	private PersoncarMapper personcarMapper;
	@Override
	public void updateUserInfo(User user) {
		// TODO Auto-generated method stub
		personcarMapper.updateUserInfo(user);
	}
	@Override
	public int queryOriginalPassword(UserNameAndUserPassword userNameAndUserPassword) {
		// TODO Auto-generated method stub
		return personcarMapper.queryOriginalPassword(userNameAndUserPassword);
	}
	@Override
	public void updatePassword(User user) {
		// TODO Auto-generated method stub
		personcarMapper.updatePassword(user);
	}

}
