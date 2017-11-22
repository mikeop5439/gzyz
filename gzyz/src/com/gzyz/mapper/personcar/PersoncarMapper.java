package com.gzyz.mapper.personcar;

import com.gzyz.bean.personcar.UserNameAndUserPassword;
import com.gzyz.bean.users.User;

public interface PersoncarMapper {
	//修改用户信息
	public void updateUserInfo(User user);
	//验证原密码
	public int queryOriginalPassword(UserNameAndUserPassword userNameAndUserPassword);
	//修改密码
	public void updatePassword(User user);
}
