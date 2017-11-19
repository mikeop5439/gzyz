package com.gzyz.mapper.reception;

import java.util.List;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.bean.users.extend.UserCart;

public interface ShoopingCartMapper {
	//查询购物车
	public List<UserCart> selectcart(int i);
	//修改购物车商品数量
	public void updatecartgoodsnumber(Cartextend cartextend);
	//删除商品信息
	public void deletecartByidone(Cartextend cartextend);
	//查询购物车的商品数量和商品单价
	public Cartextend selectcartNP(Cartextend cartextend);
	//查询商品
	public Goods selectgoods(int parseInt);
	//查询用户收货地址
	public List<Receiver> selectuserreceiver(int user_id);
	//设置用户的默认地址
	public void updatemorenaddress(User user);
	/*查询用户收货id*/
	public User selectuserrs(int id);
	/*增加订单信息*/
	public void insertorser(Order order);
	/*查询订单ID*/
	public int selectorderid(Order order);
	/*增加订单详情*/
	public void insertorderdetails(Order_details details);
}
