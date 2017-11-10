package com.gzyz.mapper.users;

import java.util.List;

import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.bean.users.extend.UserCollect;
import com.gzyz.bean.users.extend.UserReceiver;
import com.gzyz.bean.users.extend.Userdate;

public interface UserListMapper {
		public List<Userdate> selectAllUser(int page);

		public int selectusernumber();//查询用户数量
		
		public List<Userdate> selectuserByid(int object);

		public List<Userdate> selectuserToMh(String object);

		public List<cart> selectCart(int i);
		public List<UserCart> selectuser(int page);
		
		public int countusercart();

		public List<UserCart> selectcartByid(int id);

		public List<UserCart> selectcartToMh(String page);
		
		public List<UserCollect> selectcollect(int page);

		public int countcollect();

		public List<UserCollect> selectcollectToMh(String sogo);

		public List<UserReceiver> selectreceiver(int i);
		public int countreceiver();

		public List<UserReceiver> selectreceiverToMh(String sogo);

		public List<UserReceiver> selectreceiverByid(String sogo);
}
